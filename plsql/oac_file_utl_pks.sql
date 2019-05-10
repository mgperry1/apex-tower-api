set define off
CREATE OR REPLACE PACKAGE "CHARTER2_INV"."OAC$FILE_UTL" AS 

  /* TODO enter package declarations (types,exceptions,methods etc) here */
    g_default_dir VARCHAR2(100) := 'JSON_DATA';
    g_dir_name_pref VARCHAR2(100) := 'ODIR';
    g_db_check_list_file VARCHAR2(100) := 'db_check_list_dir.txt';
    g_db_check_list_tbl VARCHAR2(100) := 'DB_CHECK_LIST';
    g_host_inv_file VARCHAR2(100) := 'testdir.txt';
    g_host_inv_tbl VARCHAR2(100) := 'host_inv_tbl';
    
    g_db_inv_file VARCHAR2(100) := 'v_db_inventory.txt';
    g_db_inv_tbl VARCHAR2(100) := 'v_db_inventory';    
    
    g_process_status_file VARCHAR2(100) := 'v_process_status.txt';
    g_process_status_tbl VARCHAR2(100) := 'v_process_status';      
    
    FUNCTION get_path ( p_dir IN VARCHAR2 ) RETURN VARCHAR2;

    FUNCTION get_ora_dirname ( p_path IN VARCHAR2 ) RETURN VARCHAR2;

    FUNCTION create_ora_dir (
        p_dir_name   IN VARCHAR2,
        p_dir_path   IN VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION create_ora_dir ( p_dir_path IN VARCHAR2 ) RETURN VARCHAR2;

    PROCEDURE drop_ora_dir ( p_dir_name IN VARCHAR2 );

    FUNCTION get_clob_from_file (
        p_directory_name   IN VARCHAR2,
        p_file_name        IN VARCHAR2
    ) RETURN CLOB;

    FUNCTION read_file_to_clob (
        p_dir_name    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) RETURN CLOB;

    FUNCTION read_file_to_clob2 (
        p_dir_path    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) RETURN CLOB;

    PROCEDURE get_file_attr (
        p_dir_name      IN VARCHAR2,
        p_file_name     IN VARCHAR2,
        p_exists        OUT BOOLEAN,
        p_file_length   OUT NUMBER,
        p_blocksize     OUT NUMBER
    );

    FUNCTION list_files ( p_directory_file IN VARCHAR2 ) RETURN file_listing_ntt
        PIPELINED;

    PROCEDURE get_path (
        p_file   IN VARCHAR2,
        p_path   OUT VARCHAR2
    );

    PROCEDURE populate_rest_logs_tbl (
        p_directory_file   IN VARCHAR2,
        p_ref_tbl_name     IN VARCHAR2
    );

    PROCEDURE fetch_host_inv_files;

    PROCEDURE fetch_dbchecklist_files;
    
    PROCEDURE fetch_db_inv_files;
    
    PROCEDURE fetch_process_status_files;
    
END oac$file_utl;

/
