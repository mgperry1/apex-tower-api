set define off 
CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$FILE_UTL" AS

    FUNCTION get_path ( p_dir IN VARCHAR2 ) RETURN VARCHAR2 IS
        o_path   all_directories.directory_path%TYPE;
    BEGIN
        SELECT
            directory_path
        INTO
            o_path
        FROM all_directories d
        WHERE
            d.directory_name = p_dir;

        RETURN o_path;
    END get_path;

    FUNCTION get_ora_dirname ( p_path IN VARCHAR2 ) RETURN VARCHAR2
        IS
    BEGIN
        FOR i IN (
            SELECT
                directory_name
            FROM all_directories d
            WHERE
                d.directory_path = p_path
        ) LOOP
            RETURN i.directory_name;
        END LOOP;

        RETURN NULL;
    END get_ora_dirname;

    FUNCTION create_ora_dir (
        p_dir_name   IN VARCHAR2,
        p_dir_path   IN VARCHAR2
    ) RETURN VARCHAR2
        IS
    BEGIN
        EXECUTE IMMEDIATE 'create or replace directory ' ||p_dir_name ||' as ''' ||p_dir_path ||'''';
        RETURN p_dir_name;
    END;

    FUNCTION create_ora_dir ( p_dir_path IN VARCHAR2 ) RETURN VARCHAR2 IS
        v_dir_name   VARCHAR2(100);
        v_sql        VARCHAR2(2000);
    BEGIN
        v_dir_name   := g_dir_name_pref ||TO_CHAR(systimestamp,'RRMMDDHH24MISSFF6');
        v_sql        := 'create or replace directory ' ||v_dir_name ||' as ''' ||p_dir_path ||'''';
        EXECUTE IMMEDIATE ( v_sql ); 
        --EXECUTE IMMEDIATE 'create or replace directory ' ||v_dir_name ||' as ''' ||p_dir_path ||'''';
        RETURN v_dir_name;
    END;

    PROCEDURE drop_ora_dir ( p_dir_name IN VARCHAR2 ) IS
        v_sql   VARCHAR2(2000);
    BEGIN
        v_sql   := 'drop directory ' || p_dir_name;
        EXECUTE IMMEDIATE ( v_sql ); 
        --EXECUTE IMMEDIATE 'drop directory "' || p_dir_name || '"';
    END;

    FUNCTION get_clob_from_file (
        p_directory_name   IN VARCHAR2,
        p_file_name        IN VARCHAR2
    ) RETURN CLOB AS
        l_bfile         BFILE;
        l_returnvalue   CLOB;
    BEGIN
    
      /*
     
      Purpose:      Get clob from file
     
      Remarks:      
     
      Who     Date        Description
      ------  ----------  --------------------------------
      MBR     18.01.2011  Created
     
      */
        dbms_lob.createtemporary(l_returnvalue,false);
        l_bfile   := bfilename(p_directory_name,p_file_name);
        dbms_lob.fileopen(l_bfile,dbms_lob.file_readonly);
        dbms_lob.loadfromfile(
            l_returnvalue,
            l_bfile,
            dbms_lob.getlength(l_bfile)
        );
        dbms_lob.fileclose(l_bfile);
        RETURN l_returnvalue;
    EXCEPTION
        WHEN OTHERS THEN
            IF
                dbms_lob.fileisopen(l_bfile) = 1
            THEN
                dbms_lob.fileclose(l_bfile);
            END IF;

            dbms_lob.freetemporary(l_returnvalue);
            RAISE;
    END get_clob_from_file;

    FUNCTION read_file_to_clob (
        p_dir_name    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) RETURN CLOB IS

        l_bfile      BFILE;
        l_clob       CLOB := empty_clob ();
        l_clob1      CLOB;
        l_wrn        INT;
        l_src_off    INT := 1;
        l_dest_off   INT := 1;
        l_lang_ctx   INT := 0;
    BEGIN
        l_bfile   := bfilename(p_dir_name,p_file_name);
        dbms_lob.fileopen(l_bfile,dbms_lob.file_readonly);
        IF
            dbms_lob.getlength(l_bfile) > 0
        THEN
            dbms_lob.createtemporary(l_clob,true);
            dbms_lob.loadclobfromfile(
                l_clob,
                l_bfile,
                dbms_lob.getlength(l_bfile),
                l_src_off,
                l_dest_off,
                0,
                l_lang_ctx,
                l_wrn
            );

            l_clob1   := l_clob;
            dbms_lob.freetemporary(l_clob);
        END IF;

        dbms_lob.fileclose(l_bfile);
        RETURN l_clob1;
    END read_file_to_clob;

    FUNCTION read_file_to_clob2 (
        p_dir_path    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) RETURN CLOB IS
        l_clob1       CLOB;
        v_dir_name    VARCHAR2(128);
        v_dir_name1   VARCHAR2(128);
    BEGIN
        v_dir_name    := oac$file_utl.get_ora_dirname(p_dir_path);
        IF
            v_dir_name IS NOT NULL
        THEN
            l_clob1   := read_file_to_clob(v_dir_name,p_file_name);
        ELSE
            BEGIN
                v_dir_name1   := create_ora_dir(p_dir_path);
                l_clob1       := read_file_to_clob(v_dir_name1,p_file_name);
                drop_ora_dir(v_dir_name1);
            EXCEPTION
                WHEN OTHERS THEN
                    drop_ora_dir(v_dir_name1);
                    dbms_output.put_line('Error inside read_file_to_clob2 ' || sqlerrm);
            END;
        END IF;

        RETURN l_clob1;
    END read_file_to_clob2;

    PROCEDURE get_file_attr (
        p_dir_name      IN VARCHAR2,
        p_file_name     IN VARCHAR2,
        p_exists        OUT BOOLEAN,
        p_file_length   OUT NUMBER,
        p_blocksize     OUT NUMBER
    )
        IS
    BEGIN
        utl_file.fgetattr(
            p_dir_name,
            p_file_name,
            p_exists,
            p_file_length,
            p_blocksize
        );
    END get_file_attr;

      ----------------------------------------------------------

    PROCEDURE get_path (
        p_file   IN VARCHAR2,
        p_path   OUT VARCHAR2
    ) IS
        v_file   utl_file.file_type;
    BEGIN
        v_file   := utl_file.fopen(g_default_dir,p_file,'r');
        utl_file.get_line(v_file,p_path);
        utl_file.fclose(v_file);
    END get_path;
 
      ----------------------------------------------------------

    PROCEDURE set_location ( p_file IN VARCHAR2 ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE v_app_files LOCATION (''' || p_file || ''')';
    END set_location;

    FUNCTION list_files ( p_directory_file IN VARCHAR2 ) RETURN file_listing_ntt
        PIPELINED
    IS
        v_path   VARCHAR2(1000);
    BEGIN
 
      /* Read the path from the directory file... */
        get_path(p_directory_file,v_path);
 
      /* Prepare the external table... */
        set_location(p_directory_file);
 
      /* Read the file listing... */
        FOR r_files IN (
            SELECT
                *
            FROM v_app_files --v_app_files
        ) LOOP
            PIPE ROW ( file_listing_ot(
                v_path,
                r_files.file_name,
                r_files.last_modified,--file_time
                r_files.size_bytes
            ) );  --file_size
        END LOOP;

        return;
    END list_files;

    PROCEDURE populate_rest_logs_tbl (
        p_directory_file   IN VARCHAR2,
        p_ref_tbl_name     IN VARCHAR2
    )
        IS
    BEGIN
    --oac$file_utl.get_ora_dirname(file_path) ora_dir 
        MERGE INTO v_ansible_rest_logs a USING
            ( SELECT
                file_path,
                file_name,
                file_time,
                file_size
            FROM TABLE ( list_files(p_directory_file) )
            WHERE
                file_name LIKE ( '%.%' )
            )
        b ON (
                a.file_name = b.file_name
            AND a.file_path = b.file_path
            AND a.file_time = b.file_time
            AND a.file_size = b.file_size
        ) WHEN NOT MATCHED THEN INSERT ( file_path,file_name,file_size,file_time,status,ref_tbl_name ) VALUES ( b.file_path,b.file_name,b.file_size,
b.file_time,'I',p_ref_tbl_name );

    END;

    PROCEDURE fetch_host_inv_files
        IS
    BEGIN
        populate_rest_logs_tbl(g_host_inv_file,g_host_inv_tbl);
    END;

    PROCEDURE fetch_dbchecklist_files
        IS
    BEGIN
        populate_rest_logs_tbl(g_db_check_list_file,g_db_check_list_tbl);
    END;
    
    PROCEDURE fetch_db_inv_files
        IS
    BEGIN
        populate_rest_logs_tbl(g_db_inv_file,g_db_inv_tbl);
    END;    
    
    PROCEDURE fetch_process_status_files
        IS
    BEGIN
        populate_rest_logs_tbl(g_process_status_file,g_process_status_tbl);
    END;        
END oac$file_utl;

/
