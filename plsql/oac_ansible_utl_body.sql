CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$ANSIBLE_UTL" AS
    encryption_type   PLS_INTEGER := dbms_crypto.encrypt_des + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
    encryption_key    RAW(32) := utl_raw.cast_to_raw('0111SAFC');


     -- The encryption key should be 8 bytes or more for DES algorithm. Here I used MESSYKICKGOAL as encrypted key

    FUNCTION get_template_id (
        p_template_typ   IN               VARCHAR2,
        p_app_id         IN               NUMBER,
        p_page_id        IN               NUMBER,
        p_apex_feature   IN               VARCHAR2
    ) RETURN NUMBER AS
    BEGIN
        FOR i IN (
            SELECT
                template_name,
                template_id
            FROM
                v_ansible_template_store
            WHERE
                template_type = p_template_typ
                AND apex_app_id = p_app_id
                AND apex_menu_item = p_page_id
                AND ( upper(apex_feature) = upper(p_apex_feature)
                      OR p_apex_feature IS NULL )
        ) LOOP
            RETURN i.template_id;
        END LOOP;

        RETURN NULL;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_template_id' || sqlerrm);
    END;

    FUNCTION get_template_id (
        p_template_name IN   VARCHAR2
    ) RETURN NUMBER AS
    BEGIN
        FOR i IN (
            SELECT
                template_id
            FROM
                v_ansible_template_store
            WHERE
                template_name = p_template_name
        ) LOOP
            RETURN i.template_id;
        END LOOP;

        RETURN NULL;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_template_id' || sqlerrm);
    END;

    FUNCTION get_template_name (
        p_template_typ   IN               VARCHAR2,
        p_app_id         IN               NUMBER,
        p_page_id        IN               NUMBER,
        p_apex_feature   IN               VARCHAR2
    ) RETURN VARCHAR2 AS
    BEGIN
        FOR i IN (
            SELECT
                template_name,
                template_id
            FROM
                v_ansible_template_store
            WHERE
                template_type = p_template_typ
                AND apex_app_id = p_app_id
                AND TO_CHAR(apex_menu_item) = TO_CHAR(p_page_id)
                AND ( upper(apex_feature) = upper(p_apex_feature)
                      OR p_apex_feature IS NULL )

                --UPPER(APEX_FEATURE) = nvl(UPPER(P_APEX_FEATURE) ,P_APEX_FEATURE )
        ) LOOP
            RETURN i.template_name;
        END LOOP;

        RETURN NULL;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_template_name' || sqlerrm);
            RETURN NULL;
    END;

    PROCEDURE get_template_info (
        p_template_typ    IN                VARCHAR2,
        p_app_id          IN                NUMBER,
        p_page_id         IN                NUMBER,
        p_apex_feature    IN                VARCHAR2,
        p_template_id     OUT               NUMBER,
        p_template_name   OUT               VARCHAR2
    ) AS
    BEGIN
        FOR i IN (
            SELECT
                template_name,
                template_id
            FROM
                v_ansible_template_store
            WHERE
                template_type = p_template_typ
                AND apex_app_id = p_app_id
                AND apex_menu_item = p_page_id
                AND ( upper(apex_feature) = upper(p_apex_feature)
                      OR p_apex_feature IS NULL )
        ) LOOP
            p_template_id := i.template_id;
            p_template_name := i.template_name;
        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_template_info' || sqlerrm);
    END;

    FUNCTION get_tower_domain RETURN VARCHAR2 AS
    BEGIN
        FOR i IN (
            SELECT
                setting_value
            FROM
                v_app_settings
            WHERE
                setting_category = 'TOWER DOMAIN'
        ) LOOP
            RETURN i.setting_value;
        END LOOP;

        RETURN NULL;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_tower_domain' || sqlerrm);
    END;

    FUNCTION get_inventory_id RETURN NUMBER AS
    BEGIN
        FOR i IN (
            SELECT
                setting_value
            FROM
                v_app_settings
            WHERE
                setting_category = 'ORACLE INVENTORY ID'
        ) LOOP
            RETURN i.setting_value;
        END LOOP;

        RETURN NULL;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('get_inventory_id' || sqlerrm);
    END;

    PROCEDURE exec_workflow (
        p_req_id IN   NUMBER
    ) AS

        v_inventory_id    NUMBER;
        p_ticket_ref      VARCHAR2(200);
        p_response        CLOB;
        v_param_json      CLOB;
        v_template_type   VARCHAR2(1);
        v_request_type    VARCHAR2(200);
        v_job_name        VARCHAR2(200);
        v_workflow_id     NUMBER;
        v_group_id        NUMBER;
        v_host_name       CLOB;
        v_host_id         number;
  --p_req_id number;
        p_request_id      NUMBER;
        v_job_id          NUMBER;
        v_response        CLOB;
        l_unq_grp varchar2(255) := '_'||to_char(sysdate,'HH24_MI_SS');
        v_group_name varchar2(255);
    BEGIN
        v_inventory_id := oac$ansible_utl.get_inventory_id;
        SELECT
            ticket_ref,
            extra_vars,
            template_type,

        --TEMPLATE_NAME,
            job_name,
            request_type,
            host_name
        INTO
            p_ticket_ref,
            v_param_json,
            v_template_type,
            v_job_name,
            v_request_type,
            v_host_name
        FROM
            v_request_queue
        WHERE
            id = p_req_id;
        
        
        --Setup a Unique Grp Name
        --Added MGP Jan 10 2019
        -- 
        v_group_name := p_ticket_ref||l_unq_grp;
       
        v_workflow_id := oac$ansible_rest_utl.get_workflow_id(v_job_name);
        
        oac$ansible_rest_utl.add_group(p_inventory_id => v_inventory_id, p_group_name => p_ticket_ref, p_response => p_response);

        v_group_id := oac$ansible_rest_utl.get_group_id(p_ticket_ref);
        
        BEGIN

    -- ADDING THE GROUP ID
            UPDATE v_request_queue
            SET
                group_id = v_group_id
            WHERE
                id = p_req_id;

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('ADDING GROUP ID TO TABLE: ' || sqlerrm);
        END;

  -- adding multiple hosts to the group

        FOR i IN (
            SELECT
                column_value
            FROM
                TABLE ( apex_string.split(v_host_name, ',') )
                order by column_value
        ) LOOP
        
          --MGP do not apply the domain to the host
          --For Charter Demo needed to remove appending the
          -- 
          --   v_host_id := oac$ansible_rest_utl.get_host_id(i.column_value || oac$ansible_rest_utl.g_tower_domain);
            v_host_id := oac$ansible_rest_utl.get_host_id(i.column_value );

            
            IF
                v_host_id IS NOT NULL
            THEN
              dbms_output.put_line('Hosts exists');
                oac$ansible_rest_utl.add_host_to_group(
                    p_group_id   => v_group_id,
                    p_host_id    => v_host_id,
                    p_response   => p_response
                );
                 dbms_output.put_line(p_response);
            ELSE
              dbms_output.put_line('Hosts dos not exists');

                oac$ansible_rest_utl.create_host_to_group(
                    p_inventory_id   => v_inventory_id,
                    p_group_id       => v_group_id,
                    p_host_name      => i.column_value,
                    p_response       => p_response
                );
               dbms_output.put_line(p_response); 
            END IF;
        END LOOP;

        oac$ansible_rest_utl.make_rest_call(
            p_flag         => v_template_type,
            p_id           => v_workflow_id,
            p_param_json   => v_param_json,
            p_response     => v_response
        );

        dbms_output.put_line('v_response: ' || v_response);
        UPDATE v_request_queue
        SET
            status = 'E'
        WHERE
            id = p_req_id;

        COMMIT;

   -- parse and store response
        oac$ansible_rest_utl.parse_and_store_resp(p_request_type => v_request_type, p_job_name => v_job_name, p_ticket_ref => p_ticket_ref
        , p_target_name => v_host_name, p_resp_clob => v_response, p_id => v_job_id, p_request_id => p_request_id);

        dbms_output.put_line('v_job_id: ' || v_job_id);
        dbms_output.put_line('p_request_id: ' || p_request_id);
        UPDATE v_self_service_status
        SET
            req_queue_id = p_req_id
        WHERE
            request_id = p_request_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(sqlerrm);
    END;

    FUNCTION exec_workflow (
        p_req_id IN   NUMBER
    ) return number AS

        v_inventory_id    NUMBER;
        p_ticket_ref      VARCHAR2(200);
        p_response        CLOB;
        v_param_json      CLOB;
        v_template_type   VARCHAR2(1);
        v_request_type    VARCHAR2(200);
        v_job_name        VARCHAR2(200);
        v_workflow_id     NUMBER;
        v_group_id        NUMBER;
        v_host_name       CLOB;
        v_host_id         number;

  --p_req_id number;
        p_request_id      NUMBER;
        v_job_id          NUMBER;
        v_response        CLOB;
        l_unq_grp varchar2(255) := '_'||to_char(sysdate,'HH24_MI_SS');
        v_group_name varchar2(255);
    BEGIN
        v_inventory_id := oac$ansible_utl.get_inventory_id;
        SELECT
            ticket_ref,
            extra_vars,
            template_type,

        --TEMPLATE_NAME,
            job_name,
            request_type,
            host_name
        INTO
            p_ticket_ref,
            v_param_json,
            v_template_type,
            v_job_name,
            v_request_type,
            v_host_name
        FROM
            v_request_queue
        WHERE
            id = p_req_id;
            
           --For Uniqueness
        --Added MGP Jan 10 2019
        -- 
        v_group_name := p_ticket_ref||l_unq_grp;    
        --dbms_output.put_line('Extra vars:'||substr(v_param_json,1,2000) );
        v_workflow_id := oac$ansible_rest_utl.get_workflow_id(v_job_name);
        dbms_output.put_line('Job name: ' || v_job_name); 
        dbms_output.put_line('Workflow id: ' || v_workflow_id);
        oac$ansible_rest_utl.add_group(p_inventory_id => v_inventory_id, p_group_name => p_ticket_ref, p_response => p_response);

        v_group_id := oac$ansible_rest_utl.get_group_id(p_ticket_ref);
        BEGIN

    -- ADDING THE GROUP ID
            UPDATE v_request_queue
            SET
                group_id = v_group_id
            WHERE
                id = p_req_id;

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('ADDING GROUP ID TO TABLE: ' || sqlerrm);
        END;
  -- dbms_output.put_line('Grp Id:'||v_group_id);
  -- adding multipl hosts to the group
    --    dbms_output.put_line('Raw Host:'||v_host_name);
        FOR i IN (
            SELECT
                column_value
            FROM TABLE ( apex_string.split(v_host_name,',') )
            order by column_value
        ) LOOP
        
            --v_host_id := oac$ansible_rest_utl.get_host_id(i.column_value || oac$ansible_rest_utl.g_tower_domain);
            v_host_id := oac$ansible_rest_utl.get_host_id(i.column_value );
            -- dbms_output.put_line('Id:'||v_host_id);
            IF
                v_host_id IS NOT NULL
            THEN
           -- dbms_output.put_line('Add Id:'||v_host_name);
                oac$ansible_rest_utl.add_host_to_group(
                    p_group_id   => v_group_id,
                    p_host_id    => v_host_id,
                    p_response   => p_response
                );
           --  dbms_output.put_line('Add ID Response:'||p_response);   
            ELSE
            --    dbms_output.put_line('Create host:'||i.column_value);
                 --  DBMS_OUTPUT.PUT_LINE (l_hosts_a(i)||g_tower_domain||' - The host id ' ||l_host_id);
                oac$ansible_rest_utl.create_host_to_group(
                    p_inventory_id   => v_inventory_id,
                    p_group_id       => v_group_id,
                    p_host_name      => i.column_value,
                    p_response       => p_response
                );
            -- dbms_output.put_line('Response:'||p_response);

            END IF;
        END LOOP;
     
        oac$ansible_rest_utl.make_rest_call(
            p_flag         => v_template_type,
            p_id           => v_workflow_id,
            p_param_json   => v_param_json,
            p_response     => v_response
        );

        dbms_output.put_line('v_response: ' || v_response);
        UPDATE v_request_queue
        SET
            status = 'E'
        WHERE
            id = p_req_id;

        COMMIT;

   -- parse and store response
        oac$ansible_rest_utl.parse_and_store_resp(p_request_type => v_request_type, p_job_name => v_job_name, p_ticket_ref => p_ticket_ref
        , p_target_name => v_host_name, p_resp_clob => v_response, p_id => v_job_id, p_request_id => p_request_id);

        dbms_output.put_line('v_job_id: ' || v_job_id);
        dbms_output.put_line('p_request_id: ' || p_request_id);
        UPDATE v_self_service_status
        SET
            req_queue_id = p_req_id
        WHERE
            request_id = p_request_id;

        COMMIT;
        return p_request_id;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(sqlerrm);
            return null;
    END;

    FUNCTION exec_playbook_c (
        p_req_id IN   NUMBER
    ) return number AS

        v_inventory_id    NUMBER;
        p_ticket_ref      VARCHAR2(200);
        p_response        CLOB;
        v_param_json      CLOB;
        v_template_type   VARCHAR2(1);
        v_request_type    VARCHAR2(200);
        v_job_name        VARCHAR2(200);
        v_workflow_id     NUMBER;
        v_group_id        NUMBER;
        v_host_name       CLOB;
        v_host_id         number;
        v_cluster_name    v_request_queue.cluster_name%TYPE;

  --p_req_id number;
        p_request_id      NUMBER;
        v_job_id          NUMBER;
        v_response        CLOB;
    BEGIN
        v_inventory_id := oac$ansible_utl.get_inventory_id;
        SELECT
            ticket_ref,
            extra_vars,
            template_type,

        --TEMPLATE_NAME,
            job_name,
            request_type,
            host_name,
            cluster_name
        INTO
            p_ticket_ref,
            v_param_json,
            v_template_type,
            v_job_name,
            v_request_type,
            v_host_name,
            v_cluster_name
        FROM
            v_request_queue
        WHERE
            id = p_req_id;
        --dbms_output.put_line('Extra vars:'||substr(v_param_json,1,2000) );
        v_workflow_id := oac$ansible_rest_utl.get_workflow_id(v_job_name);
        dbms_output.put_line('Job name: ' || v_job_name); 
        dbms_output.put_line('Workflow id: ' || v_workflow_id);
        oac$ansible_rest_utl.add_group(p_inventory_id => v_inventory_id, p_group_name => v_cluster_name , p_response => p_response);

        v_group_id := oac$ansible_rest_utl.get_group_id(v_cluster_name);
        BEGIN

    -- ADDING THE GROUP ID
            UPDATE v_request_queue
            SET
                group_id = v_group_id
            WHERE
                id = p_req_id;

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('ADDING GROUP ID TO TABLE: ' || sqlerrm);
        END;
  -- dbms_output.put_line('Grp Id:'||v_group_id);
  -- adding multipl hosts to the group
    --    dbms_output.put_line('Raw Host:'||v_host_name);
        FOR i IN (
            SELECT
                column_value
            FROM TABLE ( apex_string.split(v_host_name,',') )
        ) LOOP
        
            v_host_id := oac$ansible_rest_utl.get_host_id(i.column_value );
            -- dbms_output.put_line('Id:'||v_host_id);
            IF
                v_host_id IS NOT NULL
            THEN
          --  dbms_output.put_line('Add Id:'||v_host_name);
                oac$ansible_rest_utl.add_host_to_group(
                    p_group_id   => v_group_id,
                    p_host_id    => v_host_id,
                    p_response   => p_response
                );
            ELSE
             --   dbms_output.put_line('Create host:'||i.column_value);
                 --  DBMS_OUTPUT.PUT_LINE (l_hosts_a(i)||g_tower_domain||' - The host id ' ||l_host_id);
                oac$ansible_rest_utl.create_host_to_group(
                    p_inventory_id   => v_inventory_id,
                    p_group_id       => v_group_id,
                    p_host_name      => i.column_value,
                    p_response       => p_response
                );
            END IF;
        END LOOP;
     
        oac$ansible_rest_utl.make_rest_call(
            p_flag         => v_template_type,
            p_id           => v_workflow_id,
            p_param_json   => v_param_json,
            p_response     => v_response
        );

        dbms_output.put_line('v_response: ' || v_response);
        UPDATE v_request_queue
        SET
            status = 'E'
        WHERE
            id = p_req_id;

        COMMIT;

   -- parse and store response
        oac$ansible_rest_utl.parse_and_store_resp(p_request_type => v_request_type, p_job_name => v_job_name, p_ticket_ref => p_ticket_ref
        , p_target_name => v_host_name, p_resp_clob => v_response, p_id => v_job_id, p_request_id => p_request_id);

        dbms_output.put_line('v_job_id: ' || v_job_id);
        dbms_output.put_line('p_request_id: ' || p_request_id);
        UPDATE v_self_service_status
        SET
            req_queue_id = p_req_id
        WHERE
            request_id = p_request_id;

        COMMIT;
        return p_request_id;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(sqlerrm);
            return null;
    END;    
    
    FUNCTION encrypt (
        p_plaintext VARCHAR2
    ) RETURN RAW
        DETERMINISTIC
    IS
        encrypted_raw   RAW(2000);
    BEGIN
        encrypted_raw := dbms_crypto.encrypt(src => utl_raw.cast_to_raw(p_plaintext), typ => encryption_type, key => encryption_key
        );

        RETURN encrypted_raw;
    END encrypt;

    FUNCTION decrypt (
        p_encryptedtext RAW
    ) RETURN VARCHAR2
        DETERMINISTIC
    IS
        decrypted_raw   RAW(2000);
    BEGIN
        decrypted_raw := dbms_crypto.decrypt(src => p_encryptedtext, typ => encryption_type, key => encryption_key);

        return(utl_raw.cast_to_varchar2(decrypted_raw));
    END decrypt;

    -- Removing the group and setting the status to the O.
    PROCEDURE remove_group ( p_req_id IN NUMBER ) IS
        v_response   CLOB;
    BEGIN
        NULL;
        FOR i IN (
            SELECT
                group_id
            FROM v_request_queue
            WHERE
                id = p_req_id
        ) LOOP
            oac$ansible_rest_utl.delete_group(i.group_id,v_response);
            
            IF   instr(v_response,'Error') <= 0     THEN
                UPDATE v_request_queue
                    SET
                        status = 'O'
                WHERE
                    id = p_req_id;

                COMMIT;
            else
             dbms_output.put_line('Error during remove:' || instr(v_response,'Error'));            
             dbms_output.put_line('Remove Group for request response:');
             dbms_output.put_line(substr(v_response,1,250));
            END IF;
            
            v_response   := NULL;
        END LOOP;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Remove Group for request' || sqlerrm);
    END;

    /**
     author: Jaydipsinh Raulji
     Purpose: Delete hosts associated with given job request.
    */    
    PROCEDURE remove_hosts ( p_req_id IN NUMBER ) IS
        v_response   CLOB;
        v_host_id    NUMBER;
    BEGIN
        NULL;
        FOR i IN (
            SELECT
                column_value
            FROM v_request_queue,
                 TABLE ( apex_string.split(host_name,',') )
            WHERE
                id = p_req_id
        ) LOOP
            v_host_id   := oac$ansible_rest_utl.get_host_id(i.column_value || oac$ansible_rest_utl.g_tower_domain);
            IF
                v_host_id IS NOT NULL
            THEN
                oac$ansible_rest_utl.delete_host(v_host_id,v_response);
            END IF;
    
        END LOOP;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Remove Host for request' || sqlerrm);
    END;    

    PROCEDURE refresh_job ( p_self_srvc_id IN NUMBER ) AS
    
        l_clob            CLOB;
            --l_amount          NUMBER;
           -- l_offset          NUMBER;
           -- l_buffer          VARCHAR2(32767);
            --v_amount          NUMBER;
           -- v_offset          NUMBER;
        v_response        CLOB;
            --v_id              NUMBER;
        v_job_url         VARCHAR2(100);
        v_status          VARCHAR2(500);
        v_result_stdout   CLOB;
        l_values          apex_json.t_values;
            --p_endpoint        VARCHAR2(100);
    BEGIN
        --INTO v_job_url
        FOR i IN (
            SELECT
                job_url
            FROM v_self_service_status
            WHERE
                request_id = p_self_srvc_id
        ) LOOP
            dbms_output.put_line('Inside Refresh Job...');
            oac$ansible_rest_utl.do_rest_call(
                p_url           => rtrim(oac$ansible_rest_utl.g_tower_url,'/') ||i.job_url,
                p_http_method   => 'GET',
                p_response      => v_response
            );
            --DBMS_OUTPUT.PUT_LINE(v_response);
    
            l_clob            := v_response;
            --v_amount          := 32000;
            --v_offset          := 1;
            dbms_output.put_line('Inside Refresh Job2...');
            apex_json.parse(
                p_values   => l_values,
                p_source   => l_clob
            );
            v_status          := apex_json.get_varchar2(
                p_values   => l_values,
                p_path     => 'status'
            );
            v_result_stdout   := apex_json.get_varchar2(
                p_values   => l_values,
                p_path     => 'result_stdout'
            );
            
            -- fetching stdout result.             
            oac$ansible_rest_utl.do_rest_call(
                p_url           => rtrim(oac$ansible_rest_utl.g_tower_url,'/') ||i.job_url ||'stdout/?format=txt',
                p_http_method   => 'GET',
                p_response      => v_result_stdout
            );              
            --dbms_output.put_line('v_status: ' || v_status);
            --dbms_output.put_line('v_result_stdout: ' || v_result_stdout);
            UPDATE v_self_service_status
                SET
                    job_result = v_status,
                    result_stdout = v_result_stdout
            WHERE
                request_id = p_self_srvc_id;
    
            COMMIT;
        END LOOP;
    END refresh_job;

    /**
     author: Jaydipsinh Raulji
     Purpose: This procedure will be used as a part of job which do check not completed jobs & refresh the same.
    */
    PROCEDURE refresh_jobs
        AS
    BEGIN
        FOR i IN (
            SELECT
                request_id
            FROM v_self_service_status
            WHERE
                TRIM(job_result) NOT IN (
                    'failed','successful','canceled'
                )
        ) LOOP
            oac$ansible_utl.refresh_job(i.request_id);
        END LOOP;
    END;
    
    /**
     author: Jaydipsinh Raulji
     Purpose: This procedure will be used as a part of job which do check completed jobs & remove associated groups.
     Updated defination to executed only executed and completed ones.
    */
    PROCEDURE remove_job_groups
        AS
    BEGIN
     dbms_output.put_line('Removing Any Groups and Hosts that have completed Jobs');
        FOR i IN (
          SELECT
            s.request_id,
                s.req_queue_id,
                s.TICKET_REF,
                s.JOB_NAME,
                s.created ,
                q.group_id
            FROM v_self_service_status s
            ,v_request_queue q
            WHERE
                    TRIM(s.job_result) IN (
                        'failed','successful','canceled'
                    )
             and    s.req_queue_id = q.id
              --Only Jobs we have not already removed the group on
              --
                AND EXISTS (
                        SELECT
                            1
                        FROM v_request_queue
                        WHERE
                                v_request_queue.id = req_queue_id
                            AND v_request_queue.status = 'E'
                    )
               --
               -- Do not remove the group if a Job is running/pending 
               -- that refrences the same group
               --
              and not exists (
             SELECT
                s.req_queue_id,
                s.TICKET_REF,
                s.JOB_NAME,
                s.created ,
                q.group_id
            FROM v_self_service_status si
            ,v_request_queue qi
            WHERE
                    TRIM(si.job_result) NOT IN (
                        'failed','successful','canceled'
                    )
            
             and    si.req_queue_id = qi.id
             and qi.group_id = q.group_id
            )
             and s.created >= sysdate - 60
           order by created desc
        ) LOOP
            dbms_output.put_line('Remove group Ticket Ref/Job: '||i.TICKET_REF||'/'||i.job_name);
            oac$ansible_utl.remove_group(i.req_queue_id);
        END LOOP;
    

    END; 


 --
 --
 --

PROCEDURE LOAD_TOWER_SETUP (
    p_action   IN         VARCHAR2 DEFAULT 'LOAD',
    p_parm1    IN         VARCHAR2 DEFAULT NULL,
    p_parm2    IN         VARCHAR2 DEFAULT NULL,
    p_parm3    IN         VARCHAR2 DEFAULT NULL
) AS

    l_clob           CLOB;
    v_id             NUMBER;
    v_url            VARCHAR2(1000) ;
    v_status         VARCHAR2(1000);
    p_username       VARCHAR2(255) := 'apex';
    p_password       VARCHAR2(255) := 'apex1234';
    g_endpoint_prefix  VARCHAR2(1000);
    g_wallet_path    VARCHAR2(255) := 'file:/home/oracle/app/oracle/product/12.2.0/dbhome_1/user';
    g_wallet_pass    VARCHAR2(255) := 'oracle123';
    g_content_type   VARCHAR2(255) := 'application/json';
       g_tower_url  VARCHAR2(1000);
     l_finish       boolean          := false;
     next_url varchar2(1000);
   
    BEGIN
    -- Purpose:
    -- Load Tower setup into tables so that we can use them to create LOVs
    -- which will be used for populating our mapping table
    --  V_ANSIBLE_TEMPLATE_STORE
    -- The Procudre make 3 Rest calls to extract 
    -- Organizations
    -- Inventories
    -- job_templates
    --  It takes the result sand loads them into tables, Only add records that are missing, 
    -- So  it can be called reptable in case we need to refresh Could add deletes to the tables..

     OAC$ANSIBLE_REST_UTL.config ('INIT');
     p_username := OAC$ANSIBLE_REST_UTL.p_username;
     p_password := OAC$ANSIBLE_REST_UTL.p_password;
     g_wallet_path   := OAC$ANSIBLE_REST_UTL.g_wallet_path ;
     g_wallet_pass  := OAC$ANSIBLE_REST_UTL.g_wallet_pass;
     g_endpoint_prefix  := OAC$ANSIBLE_REST_UTL.g_endpoint_prefix;
     g_tower_url := OAC$ANSIBLE_REST_UTL.g_tower_url;
     --If the URl ends in / then remove it as the next URLs begin with the /
     if  substr(g_tower_url,-1) = '/' then
        g_tower_url := substr(g_tower_url,1,length(g_tower_url) -1 );
     end if;   



    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type; --'application/json'; 
  -- host should be dbtest04.techlab.com 

   delete from v_ansible_job_templates; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'job_templates/';
  while not l_finish loop
  
      OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 

 /*   l_clob := apex_web_service.make_rest_request(p_url => v_url, p_http_method => 'GET', p_username => p_username, p_password => p_password
    , p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pass);
    --    DBMS_OUTPUT.PUT_LINE(substr(l_clob,1,300));    
   */ 
    /*
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    );*/
   -- 
   --Added a commit for tracing
   --
   commit;
   
    INSERT INTO v_ansible_job_templates (
        id,
        name,
        description,
        playbook,
        url,
        inventory,
        TEMPLATE_TYPE
    )
        SELECT
            id,
            name,
            description,
            playbook,
            url,
            inventory,
            'P'
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) COLUMNS name VARCHAR2(255) PATH 'name', id NUMBER PATH 'id', inventory VARCHAR2
            (1000) PATH 'inventory', description VARCHAR2(1000) PATH 'description', playbook VARCHAR2(1000) PATH 'playbook', url VARCHAR2
            (1000) PATH 'url' ) x;

  select
            x.next_page into next_url 
        from xmltable( 
            '/json'
            passing apex_json.to_xmltype( l_clob )
            columns
                next_page varchar2(1000) path 'next'
        ) x;
        
        if next_url is null then 
        l_finish := true; 
        else
         v_url := g_tower_url||next_url;
         --dbms_output.put_line('Hosts Next: '||v_url);
        end if;
   
 end loop;
 
--  v_url := 'https://tower.techlab.com/api/v2/workflow_job_templates/';

 l_finish  := false;
  v_url    := g_endpoint_prefix|| 'workflow_job_templates/';
  while not l_finish loop

      OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 
       
    --    DBMS_OUTPUT.PUT_LINE(substr(l_clob,1,300));    
    /*
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    );*/
   -- 
   --Added a commit for tracing
   --
   commit;

    INSERT INTO v_ansible_job_templates (
        id,
        name,
        description,
        playbook,
        url,
        inventory,
        TEMPLATE_TYPE
    )
        SELECT
            id,
            name,
            description,
            playbook,
            url,
            inventory,
            'W'
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) COLUMNS name VARCHAR2(255) PATH 'name', id NUMBER PATH 'id', inventory VARCHAR2
            (1000) PATH 'inventory', description VARCHAR2(1000) PATH 'description', playbook VARCHAR2(1000) PATH 'playbook', url VARCHAR2
            (1000) PATH 'url' ) x
        ;

  select
            x.next_page into next_url 
        from xmltable( 
            '/json'
            passing apex_json.to_xmltype( l_clob )
            columns
                next_page varchar2(1000) path 'next'
        ) x;
        
        if next_url is null then 
        l_finish := true; 
        else
         v_url := g_tower_url||next_url;
         --dbms_output.put_line('Hosts Next: '||v_url);
        end if;
   
 end loop;
   -- v_url := 'https://tower.techlab.com/api/v2/inventories/';
   v_url    := g_endpoint_prefix|| 'inventories/';
/*
    l_clob := apex_web_service.make_rest_request(p_url => v_url, p_http_method => 'GET', p_username => p_username, p_password => p_password
    , p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pass);
   --    DBMS_OUTPUT.PUT_LINE(substr(l_clob,1,300));    
*/
     OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 
    /*   
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    );*/
   -- 
   --Added a commit for tracing
   --
   commit;
   delete from v_ansible_inventories;
    INSERT INTO v_ansible_inventories (
        id,
        name,
        description,
        organization,
        variables
    )
        SELECT
            id,
            name,
            description,
            organization,
            variables
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) COLUMNS name VARCHAR2(255) PATH 'name', id NUMBER PATH 'id', inventory VARCHAR2
            (1000) PATH 'inventory', description VARCHAR2(1000) PATH 'description', organization NUMBER PATH 'organization', variables
            VARCHAR2(4000) PATH 'variables' ) x ;

   -- v_url := 'https://tower.techlab.com/api/v2/organizations/';
   v_url    := g_endpoint_prefix|| 'organizations/';
/*
    l_clob := apex_web_service.make_rest_request(p_url => v_url, p_http_method => 'GET', p_username => p_username, p_password => p_password
    , p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pass);
   --    DBMS_OUTPUT.PUT_LINE(substr(l_clob,1,300));    
  */
       OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 
    /*   
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    ); */
   -- 
   --Added a commit for tracing
   --
   commit;
  delete from v_ansible_organizations;
  INSERT INTO v_ansible_organizations (
    id,
    name,
    description
)        SELECT
             id,
    name,
    description
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) COLUMNS name VARCHAR2(255) PATH 'name', id NUMBER PATH 'id', description
            VARCHAR2(1000) PATH 'description' ) x ;
    
    
   l_finish  := false;
   v_url    := g_endpoint_prefix|| 'groups/';
   delete from v_ansible_groups; 
  while not l_finish loop
  
      OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 
   /* 
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    );*/
   -- 
   --Added a commit for tracing
   --
   commit;
   
   
   
    INSERT INTO v_ansible_groups (
        id,
        name,
        description,
        url,
        inventory,
        total_hosts
    )
    SELECT
        id,
        name,
        description,
        url,
        inventory,
        total_hosts
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) 
             COLUMNS
             name VARCHAR2(255) PATH 'name',
             id NUMBER PATH 'id',
             inventory VARCHAR2(1000) PATH 'inventory',
             description VARCHAR2(1000) PATH 'description',
             url VARCHAR2(1000) PATH 'url' ,
             total_hosts NUMBER PATH 'total_hosts' ) x
   ;
     select
            x.next_page into next_url 
        from xmltable( 
            '/json'
            passing apex_json.to_xmltype( l_clob )
            columns
                next_page varchar2(1000) path 'next'
        ) x;
        
        if next_url is null then 
        l_finish := true; 
        else
         v_url := g_tower_url||next_url;
         --dbms_output.put_line('Hosts Next: '||v_url);
        end if;
   
 end loop;
 
 
   delete from v_ansible_hosts;   
   l_finish  := false;
   v_url    := g_endpoint_prefix|| 'hosts/';

   while not l_finish loop

  
      OAC$ANSIBLE_REST_UTL.do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RESPONSE => l_clob) ; 
    /*
    INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response
    ) values (
    'GET',
     v_url,
     l_clob
    );
    */
   -- 
   --Added a commit for tracing
   --
    commit;
   
    INSERT INTO v_ansible_hosts (
        id,
        name,
        description,
        url,
        inventory
    )
    SELECT
        id,
        name,
        description,
        url,
        inventory
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) 
             COLUMNS
             name VARCHAR2(255) PATH 'name',
             id NUMBER PATH 'id',
             inventory VARCHAR2(1000) PATH 'inventory',
             description VARCHAR2(1000) PATH 'description',
             url VARCHAR2(1000) PATH 'url' ,
             total_hosts NUMBER PATH 'total_hosts' ) x
   ;
 

   select
            x.next_page into next_url 
        from xmltable( 
            '/json'
            passing apex_json.to_xmltype( l_clob )
            columns
                next_page varchar2(1000) path 'next'
        ) x;
        
        if next_url is null then 
        l_finish := true; 
        else
         v_url := g_tower_url||next_url;
         --dbms_output.put_line('Hosts Next: '||v_url);
        end if;
   
 end loop;


 
 /*
    FOR c1 IN (
        SELECT
            *
        FROM
            XMLTABLE (
                --'/json/items/row'
             '/json/results/row' PASSING apex_json.to_xmltype(l_clob) COLUMNS name VARCHAR2(255) PATH 'name', id NUMBER PATH 'id', description
            VARCHAR2(1000) PATH 'description' ) x
    ) LOOP
        dbms_output.put_line(c1.id
                             || ' '
                             || c1.name
                             || ', '
                             || c1.description
                             || ' ');
    END LOOP;
*/
    end;

 procedure setup_batch_jobs(
  p_action in varchar2 default 'DAILY',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
) as
jobno number;
qt varchar2(30) := '''';
good_job number := 0;
Begin

  if p_action in ('DAILY','CREATE') then
    /* Refresh the job status every 30 mins , only for jobs with non completed status */
    setup_batch_job(  p_search => upper('%OAC$ANSIBLE_UTL.refresh_jobs%'),
    p_what => upper('OAC$ANSIBLE_UTL.refresh_jobs();'),
    p_start => sysdate + 5/(24 *60)  , 
    p_interval => 'sysdate + 30/(24 *60)' );

  /*
   setup_batch_job(  p_search => upper('%OAC$ANSIBLE_UTL.remove_job_groups%'),
    p_what => upper('OAC$ANSIBLE_UTL.remove_job_groups ();'),
    p_start => sysdate + 15/(24 *60)  , 
    p_interval => 'sysdate + 15/(24 *60)' );
*/
   /* Remove Groups and hosts every 8 hrs */
   setup_batch_job(  p_search => upper('%OAC$ANSIBLE_UTL.remove_job_groups%'),
    p_what => upper('OAC$ANSIBLE_UTL.remove_job_groups ();'),
    p_start => sysdate + .1/24  , 
    p_interval => 'sysdate + 8/24' );

   /* Run Operational Task every 15 Mins */
   setup_batch_job(  p_search => upper('%STANDARD_TASK_MGR .task_queue%'),
    p_what => upper('STANDARD_TASK_MGR .task_queue( p_action => '||qt||'CHECK_SCHEDULE'||qt||');'),
    p_start => sysdate + .1/24  , 
    p_interval => 'sysdate + .25/24' );


  elsif p_action in ('REMOVE','DELETE','DROP') then
    remove_batch_job(  p_search => upper('%OAC$ANSIBLE_UTL.remove_job_groups%'));
    remove_batch_job(  p_search => upper('%OAC$ANSIBLE_UTL.refresh_jobs%'));
    remove_batch_job(  p_search => upper('%STANDARD_TASK_MGR .task_queue%'));
  end if;
  
end;

 procedure setup_batch_job(
  p_search in varchar2 default null,
p_what in varchar2 default null,
p_start in date default null,
p_interval in varchar2 default null
) as
jobno number;
qt varchar2(30) := '''';
good_job number := 0;
Begin

  dbms_output.put_line('Remove Job:');
  dbms_output.put_line(rpad('-',75,'-'));
  for c2 in (
          select
           job
           ,broken
          from dba_jobs
          where
             upper(what) like p_search
         )
   loop
       if c2.broken = 'Y' then
        sys.dbms_ijob.remove(c2.job);
        dbms_output.put_line('Removing broken Job no:'||c2.job);
       else
        good_job := 1;
       end if;

   end loop;

 if good_job <= 0 then
   dbms_job.submit (jobno, p_what,  next_date => p_start , interval => p_interval );
 end if;
 
 
commit;
  dbms_output.put_line('New Job:');
  dbms_output.put_line(rpad('-',75,'-'));

  for c2 in (
          select
           job
           ,what
           ,to_char (NEXT_DATE,'DD-MON HH24:MI') NEXT_DATE
           ,interval
          from dba_jobs
          where
             upper(what) like p_search
         )
   loop
       dbms_output.put_line('Job no:'||c2.job);
       dbms_output.put_line('What:'||c2.what);
       dbms_output.put_line('Next:'||c2.Next_date);
       dbms_output.put_line('Interval:'||c2.interval);
   end loop;

end;


 procedure remove_batch_job(
  p_search in varchar2 default null,
p_what in varchar2 default null,
p_start in date default null,
p_interval in varchar2 default null
) as
jobno number;
qt varchar2(30) := '''';
good_job number := 0;
Begin

  dbms_output.put_line('Remove Job Serach for jobs like:');
  dbms_output.put_line('Search string :'||p_search);
  dbms_output.put_line(rpad('-',75,'-'));
  for c2 in (
          select
           job
           ,broken
          from dba_jobs
          where
             upper(what) like p_search
         )
   loop
        sys.dbms_ijob.remove(c2.job);
        dbms_output.put_line('For Search Removing Job no:'||c2.job);
   end loop;
 
 
commit;

end;


END oac$ansible_utl;

/
