CREATE OR REPLACE PACKAGE "CHARTER2_INV"."STATUS_REST_UTL" AS 

/*
    -- Purpose: Holding ORDS REST Call API supporting objects for checklist status & process status.
    -- Created On: 18 FEB 2019     
*/
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
    );
    
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
    );
    
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
    );    
    
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
    );  
    
     PROCEDURE checkliststatus_sql_ins (
        p_task_id            IN                   v_checklist_status.task_id%TYPE,
        p_task_key           IN                   v_checklist_status.task_key%TYPE,
        p_task_area          IN                   v_checklist_status.task_area%TYPE,
        p_task_status        IN                   v_checklist_status.task_status%TYPE,
        p_task_message       IN                   v_checklist_status.task_message%TYPE,
        p_task_body          IN                   BLOB,
        p_record_type        IN                   v_checklist_status.record_type%TYPE,
        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,
        p_status_id          OUT                  NUMBER
    );

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
    );
    
END STATUS_REST_UTL;

/
