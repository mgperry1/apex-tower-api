CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."STATUS_REST_UTL" AS

    PROCEDURE checkliststatus_ins (
        p_task_id            IN                   v_checklist_status.task_id%TYPE,
        p_task_key           IN                   v_checklist_status.task_key%TYPE,
        p_task_area          IN                   v_checklist_status.task_area%TYPE,
        p_task_status        IN                   v_checklist_status.task_status%TYPE,
        p_task_message       IN                   v_checklist_status.task_message%TYPE,
        p_task_body          IN                   BLOB,--v_checklist_status.task_body%TYPE,
        p_record_type        IN                   v_checklist_status.record_type%TYPE,
        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS
        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);    
    BEGIN
        BEGIN            
            l_record_type := upper(p_record_type);
            if p_task_body is null then 
            l_task_body :=null;
            else
                l_blob := p_task_body;
                dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
                DBMS_LOB.converttoclob(
                dest_lob      => l_task_body,
                src_blob      => l_blob,
                amount        => DBMS_LOB.lobmaxsize,
                dest_offset   => l_dest_offset,
                src_offset    => l_src_offset, 
                blob_csid     => DBMS_LOB.default_csid,
                lang_context  => l_lang_context,
                warning       => l_warning);
    
                IF l_task_body LIKE '[{%' THEN
                    l_record_type := 'LOAD_JSON';
                END IF;
            end if;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;    
        INSERT INTO v_checklist_status (
            task_id,
            task_key,
            task_area,
            task_status,
            task_message,
            task_body,
            record_type,
            standard_task_id
        ) VALUES (
            p_task_id,
            p_task_key,
            p_task_area,
            p_task_status,
            p_task_message,
            l_task_body,--p_task_body,
            l_record_type,--upper(p_record_type),
            p_standard_task_id
        ) RETURNING status_id INTO p_status_id;

    END;

    PROCEDURE checkliststatus_file_ins (
        p_task_id            IN                   v_checklist_status.task_id%TYPE,
        p_task_key           IN                   v_checklist_status.task_key%TYPE,
        p_task_area          IN                   v_checklist_status.task_area%TYPE,
        p_task_status        IN                   v_checklist_status.task_status%TYPE,
        p_task_message       IN                   v_checklist_status.task_message%TYPE,
        p_file_upload        IN                   v_checklist_status.file_upload%TYPE,
        p_record_type        IN                   v_checklist_status.record_type%TYPE,
        p_file_mimetype      IN                   v_checklist_status.file_mimetype%TYPE,
        p_file_name          IN                   v_checklist_status.file_name%TYPE,
        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS

        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);
    BEGIN
        BEGIN
            l_blob := p_file_upload;
            l_record_type := upper(p_record_type);
            dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
            DBMS_LOB.converttoclob(
            dest_lob      => l_task_body,
            src_blob      => l_blob,
            amount        => DBMS_LOB.lobmaxsize,
            dest_offset   => l_dest_offset,
            src_offset    => l_src_offset, 
            blob_csid     => DBMS_LOB.default_csid,
            lang_context  => l_lang_context,
            warning       => l_warning);

            IF l_task_body LIKE '[{%' THEN
                l_record_type := 'LOAD_JSON';
            END IF;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;
            INSERT INTO v_checklist_status (
                task_id,
                task_key,
                task_area,
                task_status,
                task_message,
                task_body,
                file_upload,
                record_type,
                file_mimetype,
                file_name,
                standard_task_id
            ) VALUES (
                p_task_id,
                p_task_key,
                p_task_area,
                p_task_status,
                p_task_message,
                l_task_body,
                l_blob,
                l_record_type,
                p_file_mimetype,
                p_file_name,
                p_standard_task_id
            ) RETURNING status_id INTO p_status_id;

    END;

    PROCEDURE process_status_ins (
        p_task_id            IN                   v_process_status.task_id%TYPE,
        p_task_key           IN                   v_process_status.task_key%TYPE,
        p_task_area          IN                   v_process_status.task_area%TYPE,
        p_task_status        IN                   v_process_status.task_status%TYPE,
        p_task_message       IN                   v_process_status.task_message%TYPE,
        p_task_body          IN                   BLOB,--v_process_status.task_body%TYPE,
        p_record_type        IN                   v_process_status.record_type%TYPE,
        p_standard_task_id   IN                   v_process_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS
        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);    
    BEGIN
        BEGIN
            l_blob := p_task_body;
            l_record_type := upper(p_record_type);
            dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
            DBMS_LOB.converttoclob(
            dest_lob      => l_task_body,
            src_blob      => l_blob,
            amount        => DBMS_LOB.lobmaxsize,
            dest_offset   => l_dest_offset,
            src_offset    => l_src_offset, 
            blob_csid     => DBMS_LOB.default_csid,
            lang_context  => l_lang_context,
            warning       => l_warning);

            IF l_task_body LIKE '[{%' THEN
                l_record_type := 'LOAD_JSON';
            END IF;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;
        
        INSERT INTO v_process_status (
            task_id,
            task_key,
            task_area,
            task_status,
            task_message,
            task_body,
            record_type,
            standard_task_id
        ) VALUES (
            p_task_id,
            p_task_key,
            p_task_area,
            p_task_status,
            p_task_message,
            l_task_body,--p_task_body,
            l_record_type,--upper(p_record_type),
            p_standard_task_id
        ) RETURNING status_id INTO p_status_id;

    END process_status_ins;
    
    PROCEDURE process_status_file_ins (
        p_task_id            IN                   v_process_status.task_id%TYPE,
        p_task_key           IN                   v_process_status.task_key%TYPE,
        p_task_area          IN                   v_process_status.task_area%TYPE,
        p_task_status        IN                   v_process_status.task_status%TYPE,
        p_task_message       IN                   v_process_status.task_message%TYPE,
        p_file_upload        IN                   v_process_status.file_upload%TYPE,
        p_record_type        IN                   v_process_status.record_type%TYPE,
        p_file_mimetype      IN                   v_process_status.file_mimetype%TYPE,
        p_file_name          IN                   v_process_status.file_name%TYPE,
        p_standard_task_id   IN                   v_process_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS

        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);
    BEGIN
        BEGIN
            l_blob := p_file_upload;
            l_record_type := upper(p_record_type);
            dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
            DBMS_LOB.converttoclob(
            dest_lob      => l_task_body,
            src_blob      => l_blob,
            amount        => DBMS_LOB.lobmaxsize,
            dest_offset   => l_dest_offset,
            src_offset    => l_src_offset, 
            blob_csid     => DBMS_LOB.default_csid,
            lang_context  => l_lang_context,
            warning       => l_warning);

            IF l_task_body LIKE '[{%' THEN
                l_record_type := 'LOAD_JSON';
            END IF;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;
            INSERT INTO v_process_status (
                task_id,
                task_key,
                task_area,
                task_status,
                task_message,
                task_body,
                file_upload,
                record_type,
                file_mimetype,
                file_name,
                standard_task_id
            ) VALUES (
                p_task_id,
                p_task_key,
                p_task_area,
                p_task_status,
                p_task_message,
                l_task_body,
                l_blob,
                l_record_type,
                p_file_mimetype,
                p_file_name,
                p_standard_task_id
            ) RETURNING status_id INTO p_status_id;

    END process_status_file_ins;


    PROCEDURE checkliststatus_sql_ins (
        p_task_id            IN                   v_checklist_status.task_id%TYPE,
        p_task_key           IN                   v_checklist_status.task_key%TYPE,
        p_task_area          IN                   v_checklist_status.task_area%TYPE,
        p_task_status        IN                   v_checklist_status.task_status%TYPE,
        p_task_message       IN                   v_checklist_status.task_message%TYPE,
        p_task_body          IN                   BLOB,--v_checklist_status.task_body%TYPE,
        p_record_type        IN                   v_checklist_status.record_type%TYPE,
        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS
        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);    
    BEGIN
        BEGIN            
            l_record_type := upper(p_record_type);
            if p_task_body is null then 
            l_task_body :=null;
            else
                l_blob := p_task_body;
                dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
                DBMS_LOB.converttoclob(
                dest_lob      => l_task_body,
                src_blob      => l_blob,
                amount        => DBMS_LOB.lobmaxsize,
                dest_offset   => l_dest_offset,
                src_offset    => l_src_offset, 
                blob_csid     => DBMS_LOB.default_csid,
                lang_context  => l_lang_context,
                warning       => l_warning);
    
                IF l_task_body LIKE '[{%' THEN
                    l_record_type := 'LOAD_JSON';
                END IF;
            end if;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;    
        INSERT INTO charter2_sql.v_checklist_status (
            task_id,
            task_key,
            task_area,
            task_status,
            task_message,
            task_body,
            record_type,
            standard_task_id
        ) VALUES (
            p_task_id,
            p_task_key,
            p_task_area,
            p_task_status,
            p_task_message,
            l_task_body,--p_task_body,
            l_record_type,--upper(p_record_type),
            p_standard_task_id
        ) RETURNING status_id INTO p_status_id;

    END;

    PROCEDURE checkliststatus_sql_file_ins (
        p_task_id            IN                   v_checklist_status.task_id%TYPE,
        p_task_key           IN                   v_checklist_status.task_key%TYPE,
        p_task_area          IN                   v_checklist_status.task_area%TYPE,
        p_task_status        IN                   v_checklist_status.task_status%TYPE,
        p_task_message       IN                   v_checklist_status.task_message%TYPE,
        p_file_upload        IN                   v_checklist_status.file_upload%TYPE,
        p_record_type        IN                   v_checklist_status.record_type%TYPE,
        p_file_mimetype      IN                   v_checklist_status.file_mimetype%TYPE,
        p_file_name          IN                   v_checklist_status.file_name%TYPE,
        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    ) IS

        l_task_body      CLOB;
        l_blob           BLOB;
        l_dest_offset    PLS_INTEGER := 1;
        l_src_offset     PLS_INTEGER := 1;
        l_lang_context   PLS_INTEGER := dbms_lob.default_lang_ctx;
        l_warning        PLS_INTEGER;
        l_record_type    VARCHAR2(255);
    BEGIN
        BEGIN
            l_blob := p_file_upload;
            l_record_type := upper(p_record_type);
            dbms_lob.createtemporary(lob_loc => l_task_body, cache => true);
            DBMS_LOB.converttoclob(
            dest_lob      => l_task_body,
            src_blob      => l_blob,
            amount        => DBMS_LOB.lobmaxsize,
            dest_offset   => l_dest_offset,
            src_offset    => l_src_offset, 
            blob_csid     => DBMS_LOB.default_csid,
            lang_context  => l_lang_context,
            warning       => l_warning);

            IF l_task_body LIKE '[{%' THEN
                l_record_type := 'LOAD_JSON';
            END IF;
        EXCEPTION
        WHEN OTHERS THEN NULL;
        END;
            INSERT INTO charter2_sql.v_checklist_status (
                task_id,
                task_key,
                task_area,
                task_status,
                task_message,
                task_body,
                file_upload,
                record_type,
                file_mimetype,
                file_name,
                standard_task_id
            ) VALUES (
                p_task_id,
                p_task_key,
                p_task_area,
                p_task_status,
                p_task_message,
                l_task_body,
                l_blob,
                l_record_type,
                p_file_mimetype,
                p_file_name,
                p_standard_task_id
            ) RETURNING status_id INTO p_status_id;

    END;


    
END status_rest_utl;

/
