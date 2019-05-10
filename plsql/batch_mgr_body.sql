set define off
CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."BATCH_MGR" AS

    PROCEDURE check_work_queue (
        p_queue    IN VARCHAR2 DEFAULT NULL,
        p_action   IN VARCHAR2 DEFAULT NULL
    )
        AS
    BEGIN
    -- TODO: Implementation required for PROCEDURE BATCH_MGR.check_work_queue
        NULL;
    END check_work_queue;

    PROCEDURE process_files (
        p_interface   IN VARCHAR2 DEFAULT NULL,
        p_action      IN VARCHAR2 DEFAULT NULL
    )
        AS
    BEGIN
        NULL;
        IF
            upper(p_interface) IN (
                'ALL','DB_CHECK_LIST'
            )
        THEN
            NULL;
    -- Read list files
    -- For each file in the interacfe
    -- read in json data stream as blob
    -- convert to insertable table
    --insert into application table
    -- Add record to processed file queue so that we dont reprocessfile
        ELSIF
            upper(p_interface) IN (
                'ALL','ORACLE_LIC'
            )
        THEN
            NULL;
        ELSIF
            upper(p_interface) IN (
                'ALL','V_HOST_INV_TBL'
            )
        THEN
            process_host_inv_json;
        END IF;

    END;

    PROCEDURE process_host_inv_json (
        p_dir_path    IN VARCHAR2,--p_dir_name
        p_file_name   IN VARCHAR2
    ) IS

        CURSOR c_json IS
            WITH json_test AS (
                SELECT
                    oac$file_utl.read_file_to_clob2(p_dir_path,p_file_name) AS json_data  --oac$file_utl.read_file_to_clob('JSON_DATA','host_inv.json') AS json_data
                FROM dual
            ) SELECT
                jt.*
            FROM json_test,
                     JSON_TABLE ( json_data,'$.host_inv[*]'
                        COLUMNS (
                            row_number FOR ORDINALITY,
                            --v_id NUMBER PATH '$.ID',
                            host_name VARCHAR2 ( 30 ) PATH '$.host_name',
                            network_type VARCHAR2 ( 50 ) PATH '$.network_type',
                            core_count VARCHAR2 ( 50 ) PATH '$.core_count',
                            processor_config_speed VARCHAR2 ( 50 ) PATH '$.processor_config_speed',
                            server_model VARCHAR2 ( 50 ) PATH '$.server_model',
                            hardware_vendor VARCHAR2 ( 50 ) PATH '$.hardware_vendor',
                            os_type_version VARCHAR2 ( 50 ) PATH '$.os_type_version',
                            processor_bit VARCHAR2 ( 50 ) PATH '$.processor_bit',
                            server_creation_date VARCHAR2 ( 50 ) PATH '$.server_creation_date',
                            phy_virt VARCHAR2 ( 50 ) PATH '$.phy_virt',
                            dc_location VARCHAR2 ( 80 ) PATH '$.dc_location',
                            global_zone_solaris VARCHAR2 ( 50 ) PATH '$.global_zone_solaris',
                            phy_memory VARCHAR2 ( 50 ) PATH '$.phy_memory',
                            server_monitoring_tool VARCHAR2 ( 50 ) PATH '$.server_monitoring_tool',
                            cluster_name VARCHAR2 ( 50 ) PATH '$.cluster_name',
                            clustered VARCHAR2 ( 50 ) PATH '$.clustered',
                            os_type VARCHAR2 ( 50 ) PATH '$.os_type',
                            env_source VARCHAR2 ( 50 ) PATH '$.env_source',
                            cluster_type VARCHAR2 ( 50 ) PATH '$.cluster_type',
                            gi_version VARCHAR2 ( 50 ) PATH '$.gi_version',
                            gi_current_patchset VARCHAR2 ( 50 ) PATH '$.gi_current_patchset'
                        )
                    )
                AS jt;

        p_host_code   VARCHAR2(200);
        p_exists      NUMBER;
    BEGIN
    -- insert statement
    -- update the record statement
    
    --insert into host_inv_tbl () 
        FOR i IN c_json LOOP
   -- Consolidate for both Standalone and cluster,the gaol is this page manegers both v_host_inv_tbl and v_cluster_member
   --  If p_cluster_name is not null then lookup it up on cluster table
            IF
                i.cluster_name IS NOT NULL
            THEN
                SELECT
                    MAX(v_host_code)
                INTO
                    p_host_code
                FROM v_cluster_member_tbl
                WHERE
                    cluster_name = i.cluster_name;

                IF
                    p_host_code IS NULL
                THEN
                    p_host_code   := get_host_code('CHR');
                    INSERT INTO charter2_inv.v_cluster_member_tbl (
                        cluster_name,
                        cluster_type,
                        gi_version,
                        gi_current_patchset,
                        v_host_code
                    ) VALUES (
                        i.cluster_name,
                        i.cluster_type,
                        i.gi_version,
                        i.gi_current_patchset,
                        p_host_code
                    );

                END IF;

            ELSE
                p_host_code   := get_host_code;
            END IF;
   --    if we find a record in v_cluster_member table then grab this host code
   --    if we dont find a record in v_cluster_member then we need to insert a host records get the host code 
   --    finally do then insert a member into the cluster member table if its clustered
      -- Does the record Exist

            SELECT
                COUNT(*)
            INTO
                p_exists
            FROM charter2_inv.v_host_inv_tbl
            WHERE
                    host_name = p_host_code
                AND dc_location = i.dc_location;

            IF
                nvl(p_exists,0) <= 0
            THEN
                INSERT INTO charter2_inv.v_host_inv_tbl (
                    host_name,
                    network_type,
                    core_count,
                    processor_config_speed,
                    server_model,
                    hardware_vendor,
                    os_type_version,
                    processor_bit,
                    server_creation_date,
                    phy_virt,
                    dc_location,
                    global_zone_solaris,
                    phy_memory,
                    server_monitoring_tool,
                    host_code,
                    clustered,
                    os_type,
                    env_source
                ) VALUES (
                    i.host_name,
                    i.network_type,
                    i.core_count,
                    i.processor_config_speed,
                    i.server_model,
                    i.hardware_vendor,
                    i.os_type_version,
                    i.processor_bit,
                    i.server_creation_date,
                    i.phy_virt,
                    i.dc_location,
                    i.global_zone_solaris,
                    i.phy_memory,
                    i.server_monitoring_tool,
                    p_host_code,
                    i.clustered,
                    i.os_type,
                    i.env_source
                );-- returning id into p_id;

                UPDATE v_ansible_rest_logs
                    SET
                        status = 'P'
                WHERE
                        file_path = p_dir_path
                    AND file_name = p_file_name
                    AND ref_tbl_name = 'host_inv_tbl';

                COMMIT;
            END IF;

        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            dbms_output.put_line(sqlerrm);
    END process_host_inv_json;

    PROCEDURE process_host_inv_json IS
        CURSOR cur_host_inv IS
            SELECT
                file_path,
                file_name
            FROM v_ansible_rest_logs
            WHERE
                    ref_tbl_name = oac$file_utl.g_host_inv_tbl
                AND status = 'I';

    BEGIN
        NULL;
        FOR i IN cur_host_inv LOOP
            process_host_inv_json(
                i.file_path,
                i.file_name
            );
        END LOOP;

    END process_host_inv_json;

    PROCEDURE process_db_inv_json (
        p_dir_path    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) IS

        CURSOR c_json IS
            WITH json_test AS (
                SELECT
                    oac$file_utl.read_file_to_clob2(p_dir_path,p_file_name) AS json_data  --oac$file_utl.read_file_to_clob('JSON_DATA','host_inv.json') AS json_data
                FROM dual
            ) SELECT
                jt.*
            FROM json_test,
                     JSON_TABLE ( json_data,'$.db_inv[*]'
                        COLUMNS (
                            row_number FOR ORDINALITY,
                            --v_id NUMBER PATH '$.ID',
                            database_name VARCHAR2 ( 30 ) PATH '$.database_name',
                            application_name VARCHAR2 ( 50 ) PATH '$.application_name',
                            environment VARCHAR2 ( 50 ) PATH '$.environment',
                            oracle_version VARCHAR2 ( 50 ) PATH '$.oracle_version',
                            rac_type VARCHAR2 ( 50 ) PATH '$.rac_type',
                            business_unit VARCHAR2 ( 50 ) PATH '$.business_unit',
                            appliance VARCHAR2 ( 50 ) PATH '$.appliance',
                            database_role VARCHAR2 ( 50 ) PATH '$.database_role',
                            pci_required VARCHAR2 ( 50 ) PATH '$.pci_required',
                            sox_required VARCHAR2 ( 50 ) PATH '$.sox_required',
                            encryption_required VARCHAR2 ( 80 ) PATH '$.encryption_required',
                            dataguard VARCHAR2 ( 50 ) PATH '$.dataguard',
                            golden_gate VARCHAR2 ( 50 ) PATH '$.golden_gate',
                            backup_enabled VARCHAR2 ( 50 ) PATH '$.backup_enabled',
                            end_of_life VARCHAR2 ( 50 ) PATH '$.end_of_life',
                            db_monitoring_tool VARCHAR2 ( 50 ) PATH '$.db_monitoring_tool',
                            monitoring VARCHAR2 ( 50 ) PATH '$.monitoring',
                            comments VARCHAR2 ( 50 ) PATH '$.comments',
                            instance_count VARCHAR2 ( 50 ) PATH '$.instance_count',
                            db_source VARCHAR2 ( 50 ) PATH '$.db_source',
                            dr_solution VARCHAR2 ( 50 ) PATH '$.dr_solution',
                            dr_location VARCHAR2 ( 50 ) PATH '$.dr_location',
                            env_category VARCHAR2 ( 50 ) PATH '$.env_category',
                            host_code VARCHAR2 ( 50 ) PATH '$.host_code',
                            app_id VARCHAR2 ( 50 ) PATH '$.app_id',
                            storage_type VARCHAR2 ( 50 ) PATH '$.storage_type',
                            cluster_name VARCHAR2 ( 50 ) PATH '$.cluster_name',
                            host_name VARCHAR2 ( 50 ) PATH '$.host_name',
                            db_home VARCHAR2 ( 50 ) PATH '$.db_home'
                        )
                    )
                AS jt;

        p_host_code   VARCHAR2(200);
        p_exists      NUMBER;
    BEGIN
    -- insert statement
    -- update the record statement
    
    --insert into host_inv_tbl () 
        FOR i IN c_json LOOP
            IF
                i.cluster_name IS NOT NULL
            THEN
                SELECT
                    MAX(v_host_code)
                INTO
                    p_host_code
                FROM v_cluster_member_tbl
                WHERE
                    cluster_name = i.cluster_name;

            ELSE
                SELECT
                    MAX(host_code)
                INTO
                    p_host_code
                FROM v_host_inv_tbl
                WHERE
                    host_name = i.host_name;

            END IF;

            SELECT
                COUNT(*)
            INTO
                p_exists
            FROM charter2_inv.v_db_inventory
            WHERE
                    database_name = i.database_name
                AND v_host_code = p_host_code;

            IF
                nvl(p_exists,0) <= 0
            THEN
                INSERT INTO charter2_inv.v_db_inventory (
                    database_name,
                    application_name,
                    environment,
                    oracle_version,
                    rac_type,
                    business_unit,
                    appliance,
                    database_role,
                    pci_required,
                    sox_required,
                    encryption_required,
                    dataguard,
                    golden_gate,
                    backup_enabled,
                    end_of_life,
                    db_monitoring_tool,
                    monitoring,
                    comments,
                    instance_count,
                    db_source,
                    dr_solution,
                    dr_location,
                    env_category,
                    v_host_code,
                    app_id,
                    storage_type,
                    db_home
                ) VALUES (
                    i.database_name,
                    i.application_name,
                    i.environment,
                    i.oracle_version,
                    i.rac_type,
                    i.business_unit,
                    i.appliance,
                    i.database_role,
                    i.pci_required,
                    i.sox_required,
                    i.encryption_required,
                    i.dataguard,
                    i.golden_gate,
                    i.backup_enabled,
                    i.end_of_life,
                    i.db_monitoring_tool,
                    i.monitoring,
                    i.comments,
                    i.instance_count,
                    i.db_source,
                    i.dr_solution,
                    i.dr_location,
                    i.env_category,
                    p_host_code,
                    i.app_id,
                    i.storage_type,
                    i.db_home
                );--returning id into p_id ;

                UPDATE v_ansible_rest_logs
                    SET
                        status = 'P'
                WHERE
                        file_path = p_dir_path
                    AND file_name = p_file_name
                    AND ref_tbl_name = 'v_db_inventory';

                COMMIT;
            END IF;

        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            dbms_output.put_line(sqlerrm);
    END process_db_inv_json;

    PROCEDURE process_db_inv_json IS
        CURSOR cur_db_inv IS
            SELECT
                file_path,
                file_name
            FROM v_ansible_rest_logs
            WHERE
                    ref_tbl_name = oac$file_utl.g_db_inv_tbl
                AND status = 'I';

    BEGIN
        FOR i IN cur_db_inv LOOP
            process_db_inv_json(
                i.file_path,
                i.file_name
            );
        END LOOP;
    END process_db_inv_json;

    PROCEDURE process_db_chklst_json (
        p_dir_path    IN VARCHAR2,
        p_file_name   IN VARCHAR2
    ) IS

        CURSOR c_json IS
            WITH json_test AS (
                SELECT
                    oac$file_utl.read_file_to_clob2(p_dir_path,p_file_name) AS json_data  
                FROM dual
            ) SELECT
                jt.*
            FROM json_test,
                     JSON_TABLE ( json_data,'$.db_chklst[*]'
                        COLUMNS (
                            row_number FOR ORDINALITY,
                            checklist_type VARCHAR2 ( 30 ) PATH '$.checklist_type',
                            post_build_status VARCHAR2 ( 50 ) PATH '$.post_build_status',
                            cluster_verify VARCHAR2 ( 50 ) PATH '$.cluster_verify',
                            gi_install_status VARCHAR2 ( 50 ) PATH '$.gi_install_status',
                            db_install_status VARCHAR2 ( 50 ) PATH '$.db_install_status',
                            db_upgrade_status VARCHAR2 ( 50 ) PATH '$.db_upgrade_status',
                            gi_upgrade_status VARCHAR2 ( 50 ) PATH '$.gi_upgrade_status',
                            migration_status VARCHAR2 ( 50 ) PATH '$.migration_status',
                            post_migration_status VARCHAR2 ( 50 ) PATH '$.post_migration_status',
                            checklist_category VARCHAR2 ( 50 ) PATH '$.checklist_category',
                            db_name VARCHAR2 ( 80 ) PATH '$.db_name',
                            cluster_name VARCHAR2 ( 50 ) PATH '$.cluster_name',
                            host_name VARCHAR2 ( 50 ) PATH '$.host_name',
                            task_desc VARCHAR2 ( 255 ) PATH '$.task_desc',
                            ticket_ref VARCHAR2 ( 100 ) PATH '$.ticket_ref'
                        )
                    )
                AS jt;

        p_host_code   VARCHAR2(200);
        p_exists      NUMBER;
    BEGIN
    -- insert statement
    -- update the record statement
    
    --insert into host_inv_tbl () 
        FOR i IN c_json LOOP
        insert into charter2_inv.v_db_check_list (
            checklist_type,
            post_build_status,
            cluster_verify,
            gi_install_status,
            db_install_status,
            db_upgrade_status,
            gi_upgrade_status,
            migration_status,
            post_migration_status,
            checklist_category,
            db_name,
            host_name,
            cluster_name,
            task_desc,
            ticket_ref
        ) values (
            i.checklist_type,
            i.post_build_status,
            i.cluster_verify,
            i.gi_install_status,
            i.db_install_status,
            i.db_upgrade_status,
            i.gi_upgrade_status,
            i.migration_status,
            i.post_migration_status,
            i.checklist_category,
            i.db_name,
            i.host_name,
            i.cluster_name,
            i.task_desc,
            i.ticket_ref
        ); 
                UPDATE v_ansible_rest_logs
                    SET
                        status = 'P'
                WHERE
                        file_path = p_dir_path
                    AND file_name = p_file_name
                    AND ref_tbl_name = oac$file_utl.g_db_check_list_tbl;

                COMMIT;

        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            dbms_output.put_line(sqlerrm);
    END process_db_chklst_json;

    PROCEDURE process_db_chklst_json IS
        CURSOR cur_db_chklst IS
            SELECT
                file_path,
                file_name
            FROM v_ansible_rest_logs
            WHERE
                    ref_tbl_name = oac$file_utl.g_db_check_list_tbl
                AND status = 'I';

    BEGIN
        FOR i IN cur_db_chklst LOOP
            process_db_chklst_json(
                i.file_path,
                i.file_name
            );
        END LOOP;
    END process_db_chklst_json;
    
PROCEDURE process_status_json (
    p_dir_path    IN VARCHAR2,
    p_file_name   IN VARCHAR2
) IS

    CURSOR c_json IS
        WITH json_test AS (
            SELECT
                oac$file_utl.read_file_to_clob2(p_dir_path,p_file_name) AS json_data
            FROM dual
        ) SELECT
            jt.*
        FROM json_test,
                 JSON_TABLE ( json_data,'$.process_status[*]'
                    COLUMNS (
                        row_number FOR ORDINALITY,
                        task_id VARCHAR2 ( 255 ) PATH '$.task_id',
                        task_key VARCHAR2 ( 1000 ) PATH '$.task_key',
                        task_area VARCHAR2 ( 1000 ) PATH '$.task_area',
                        task_status VARCHAR2 ( 255 ) PATH '$.task_status',
                        task_message VARCHAR2 ( 4000 ) PATH '$.task_message',
                        body VARCHAR2(32767) PATH '$.body',
                        record_type VARCHAR2 ( 255 ) PATH '$.record_type'
                    )
                )
            AS jt;

    p_host_code   VARCHAR2(200);
    p_exists      NUMBER;
BEGIN
    -- insert statement
    -- update the record statement
    
    --insert into host_inv_tbl () 
    FOR i IN c_json LOOP
        INSERT INTO v_process_status (
            task_id,
            task_key,
            task_area,
            task_status,
            task_message,
            task_body,
            record_type
        ) VALUES (
            i.task_id,
            i.task_key,
            i.task_area,
            i.task_status,
            i.task_message,
            i.body,
            i.record_type
        ) ;

        UPDATE v_ansible_rest_logs
            SET
                status = 'P'
        WHERE
                file_path = p_dir_path
            AND file_name = p_file_name
            AND ref_tbl_name = oac$file_utl.g_process_status_tbl;

        COMMIT;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line(sqlerrm);
END process_status_json;

PROCEDURE process_status_json IS
    CURSOR cur_process_status IS
        SELECT
            file_path,
            file_name
        FROM v_ansible_rest_logs
        WHERE
                ref_tbl_name = oac$file_utl.g_process_status_tbl
            AND status = 'I';

BEGIN
    FOR i IN cur_process_status LOOP
        process_status_json(
            i.file_path,
            i.file_name
        );
    END LOOP;
END process_status_json;    
    
END batch_mgr;

/
