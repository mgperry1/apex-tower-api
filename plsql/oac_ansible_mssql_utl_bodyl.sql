set define ~
CREATE OR REPLACE PACKAGE BODY "CHARTER2_SQL"."OAC$ANSIBLE_MSSQL_UTL" AS

  procedure do_mssql_install_withDB (   p_request_id in number,
                                      p_job_id out number,
                                      p_self_service_id out number,
                                      p_extra_vars out clob
                                    ) AS
                                    
v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'MSSQL-PROVISIONING';
--v_request_type  varchar2(50) := 'PATCHING';
--v_job_name      varchar2(50):= 'Grid-PSU-apply';

v_job_name      varchar2(50):= 'mssql-standalone-install-withDB';
--v_job_name      varchar2(50):= 'psu-patching-rdbms';

--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number ;--:= get_id(g_playbook,v_job_name) ;
l_hosts_a APEX_APPLICATION_GLOBAL.VC_ARR2;
l_host_id number; -- tower host id
l_group_id number; -- tower group id
l_group_name varchar2(255) ;
l_host_code varchar2(255);
c_RESPONSE clob; -- Tower host and group reponse                                         
  BEGIN
    -- Templates in V_ANSIBLE_TEMPLATE_STORE
 --mssql-cluster-install-withDB
 --mssql-standalone-install-withDB
 
 -- Setup for MSSQL Inventory
 oac$ansible_rest_utl.config('INIT_MSSQL');
 
 g_tower_domain :=  oac$ansible_rest_utl.g_tower_domain;
 g_default_inventory_id := oac$ansible_rest_utl.g_default_inventory_id;
 --g_default_inventory_id := 26;
 dbms_output.put_line('Inventory: '||g_default_inventory_id);
    --
    -- Build out all the parms for the PSU by looking up the patch ingo
    --
        FOR c1 IN (
            SELECT
                id,
                template_type,
                template_name,
                job_name,
                request_type,
                db_option,
                host_name,
                application_name,
                application_reference,
                ticket_ref,
                data_center,
                environment,
                phy_vert,
                server_type,
                description,
                quantity,
                operating_system,
                server_size,
                cores,
                mem,
                os_disk,
                domain,
                backups_needed,
                backup_type,
                vmware_cluster_name,
                clustered,
                sql_version,
                data_drive,
                logs_drive,
                system_drive,
                temp_drive,
                backups_drive,
                project_id,
                aag_cluster_name,
                aag_cluster_type,
                aag_node_count,
                vmware_cluster_template,
                database_name,
                group_id,
    aag_primary,
    aag_secondary,
    aag_drreplica,
    AAG_ENDPOINTPORT,
   AAG_AVAILABILITYGROUP,
    aag_ipaddr,
    aag_listener,
    aag_listenerip,
    aag_listnerport,
    aag_listnersubnet,
    aag_listnerip_2,
    aag_listnersubnet_2
            FROM
                v_request_queue q
            WHERE
                q.id = p_request_id
        ) LOOP
    
      v_job_name := c1.job_name;
      --
      -- Set the group to the Cluster name or to the Ticket_ref
      --
      if lower(c1.template_name) like 'mssql-cluster%' then

       l_group_name :=  c1.aag_cluster_name ;
      else
       l_group_name :=  replace(c1.ticket_ref,' ','_') ;
      end if;
  --
 -- Check the group to see if it exists
            SELECT
                oac$ansible_rest_utl.get_group_id(l_group_name)
            INTO l_group_id
            FROM
                dual;

            IF l_group_id IS NULL THEN
  -- Add a group
                oac$ansible_rest_utl.add_group(p_inventory_id => g_default_inventory_id , p_group_name => l_group_name, p_response => c_response);
                SELECT
                    oac$ansible_rest_utl.get_group_id(l_group_name)
                INTO l_group_id
                FROM
                    dual;

            ELSE
  --group does exists Hmmm add a diff group?
                NULL;
            END IF;
-- DBMS_OUTPUT.PUT_LINE ('The group id ' ||l_group_id);
 --
 -- Passed in value from the select list could be multiple hosts

            l_hosts_a := apex_util.string_to_table(replace(c1.host_name,',',':'));
  -- Loop thru the passed in list of hosts
            FOR i IN 1..l_hosts_a.count LOOP
                SELECT
 --                   oac$ansible_rest_utl.get_host_id(l_hosts_a(i)
 --                                                    || g_tower_domain)
                    oac$ansible_rest_utl.get_host_id(l_hosts_a(i))
                                                     

                INTO l_host_id
                FROM
                    dual;

  /*
                SELECT
                    MAX(host_code)
                INTO l_host_code
                FROM
                    v_host_inv_tbl
                WHERE
                    host_name = l_hosts_a(i);
  */
    -- DBMS_OUTPUT.PUT_LINE (l_hosts_a(i));
     --Is the Host in tower if not add it

                IF l_host_id IS NULL THEN
                    oac$ansible_rest_utl.add_host(p_host_name => l_hosts_a(i), p_response => c_response);
                    SELECT
                        oac$ansible_rest_utl.get_host_id(l_hosts_a(i))
                                                    --     || g_tower_domain)
                    INTO l_host_id
                    FROM
                        dual;

                END IF;
     --Add the Host to the group  
   --  DBMS_OUTPUT.PUT_LINE (l_hosts_a(i)||g_tower_domain||' - The host id ' ||l_host_id);

                oac$ansible_rest_utl.create_host_to_group(p_inventory_id => g_default_inventory_id, p_group_id => l_group_id,
                p_host_name => l_hosts_a

                (i), p_host_description => l_hosts_a(i), p_enabled => NULL, p_instance_id => l_host_id, p_variables => NULL, p_response

                => c_response);
    /*  add_host_to_group (  P_GROUP_ID => l_GROUP_ID,
       P_HOST_ID => l_HOST_ID,
       P_RESPONSE => c_RESPONSE) ;  */

            END LOOP;
    -- Loookup ID from V_ANSIBLE_TEMPLATE_STORE
    --mssql-cluster-install-withDB
    --mssql-standalone-install-withDB
  
   
            v_workflow_id := oac$ansible_utl.get_template_id(c1.template_name);
    --v_workflow_id := 321 ;

  
if lower(c1.template_name) like 'mssql-cluster%' then

  v_param_json :=
  --     '"oracle_db_home": "'       || p_oracle_db_home || '.techlab.com",
  --	    '"host": "'       || p_host_name ||'.'||g_tower_domain|| '",
  -- NOt sure what the Host_code should be
  -- "host_code": "'       || case when :P44_CLUSTERED = 'YES' then v_host_name_list else  :P44_CLUSTER_HOST end || '",
	    '"host": "'       || l_group_name || '",
		"Envl": "'       || c1.environment|| '",
		"DC": "'       || c1.data_center|| '",
		"Domain": "'       || c1.domain || '",
		"SqlVersion": "'       ||c1.sql_version || '",
        "BuPath": "'       ||c1.backups_drive || '",
        "DataPath": "' ||c1.data_drive || '",
        "LogPath": "'       || c1.logs_drive || '",
        "SystemPath": "'       || c1.system_drive || '",
        "TempdbPath": "'       || c1.temp_drive || '",
        "nameWSFC": "'       || c1.aag_cluster_name || '",
        "node1": "'       || c1.aag_primary || '",
        "node2": "'       || c1.aag_secondary || '",
        "node3": "'       || c1.aag_drreplica || '",
        "PrimaryReplica": "'       || c1.aag_primary || '",
        "SecondaryReplica": "'       || c1.aag_secondary || '",
        "DrReplica": "'       || c1.aag_drreplica || '",
        "EndPointPort": "'       || c1.AAG_ENDPOINTPORT || '",
        "AvailabilityGroup": "'       || c1.AAG_AVAILABILITYGROUP || '",
        "Listener": "'       || c1.aag_listener || '",
        "IPListener": "'       || c1.aag_listenerip || '",
        "ListenerPort": "'       || c1.aag_listnerport || '",
        "ListenerSubnet": "'       || c1.aag_listnersubnet || '",
		"TowerPath": "/ansible"';
 /*             aag_cluster_name,
                aag_cluster_type,AAG_ENDPOINTPORT,
   AAG_AVAILABILITYGROUP,
                aag_node_count,
                vmware_cluster_template,
    aag_primary,
    aag_secondary,
    aag_drreplica,
    aag_ipaddr,
    aag_listnerip_2,
    aag_listnersubnet_2 */
else

  v_param_json :=
  --     '"oracle_db_home": "'       || p_oracle_db_home || '.techlab.com",
  --	    '"host": "'       || p_host_name ||'.'||g_tower_domain|| '",
  -- NOt sure what the Host_code should be
  -- "host_code": "'       || case when :P44_CLUSTERED = 'YES' then v_host_name_list else  :P44_CLUSTER_HOST end || '",
	    '"host": "'       || l_group_name || '",
		"Envl": "'       || c1.environment|| '",
		"DC": "'       || c1.data_center|| '",
		"Domain": "'       || c1.domain || '",
		"SqlVersion": "'       ||c1.sql_version || '",
        "BuPath": "'       ||c1.backups_drive || '",
        "DataPath": "' ||c1.data_drive || '",
        "LogPath": "'       || c1.logs_drive || '",
        "SystemPath": "'       || c1.system_drive || '",
        "TempdbPath": "'       || c1.temp_drive || '",
		"TowerPath": "/ansible"';
end if;
/*
                
'"host": "'       || l_group_name || '",'||
'"Env1": "'       || c1.environment || '",'||
'"DC": "'       || c1.data_center || '",'||
'"Domain": "'       || c1.domain || '",'||
'"SqlVersion": "'       || c1.sql_version || '",'||
'"BuPath": "' ||c1.backups_drive  || '",'||
'"DataPath": "'       || c1.data_drive || '",'||
'"LogPath": "'       || c1.logs_drive || '",'||
'"SystemPath": "'       || c1.system_drive || '",'||
'"TempdbPath": "'       || c1.temp_drive || '"';
 */
      --
      --  Pass back the extra vars to update the request
      --
       p_extra_vars := v_param_json;
   /*
 
   */
    -- make a rest call.

            dbms_output.put_line('v_param_json: ' || v_param_json);
            -- Fix issue with the tamplate launch type template_type
            /*oac$ansible_rest_utl.make_rest_call(p_flag => g_playbook, p_id => v_workflow_id, p_param_json => v_param_json, p_response
            => v_response);*/
            oac$ansible_rest_utl.make_rest_call(p_flag => c1.template_type, p_id => v_workflow_id, p_param_json => v_param_json, p_response
            => v_response);

            dbms_output.put_line('v_response: ' || v_response);    

   -- parse and store response
            oac$ansible_rest_utl.parse_and_store_resp(p_request_type => v_request_type, p_job_name => v_job_name, p_ticket_ref =>
            c1.ticket_ref, p_target_name => c1.host_name, p_resp_clob => v_response, p_id => v_job_id, p_request_id => p_self_service_id
            );

            dbms_output.put_line('v_job_id: ' || v_job_id);
            dbms_output.put_line('p_request_id: ' || p_request_id);
        END LOOP;

        p_job_id := v_job_id;
    
     --
     -- Complete the reference
     --   
        update charter2_inv.V_SELF_SERVICE_STATUS s   
         set s.req_queue_id = p_request_id
        where s.request_id =  p_self_service_id;
         
  END do_mssql_install_withDB;

END OAC$ANSIBLE_MSSQL_UTL;

/
