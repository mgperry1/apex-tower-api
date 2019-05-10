CREATE OR REPLACE PACKAGE BODY "CHARTER2_SQL"."OAC$ANSIBLE_MSSQL_UTL" AS

  procedure     do_mssql_install_withDB (   p_request_id in number,
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
v_job_name_tower      varchar2(255);

--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number ;--:= get_id(g_playbook,v_job_name) ;
l_hosts_a APEX_APPLICATION_GLOBAL.VC_ARR2;
l_host_id number; -- tower host id
l_group_id number; -- tower group id
l_group_name varchar2(255) ;
l_host_code varchar2(255);
l_unq_grp varchar2(255) := to_char(sysdate,'HH24_MI_SS');
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
    aag_listnersubnet_2,
        AAG_DR_FLAG,
     AAG_SECONDARY_2,
     AAG_SECONDARY_3,
     D_DISK,
     E_DISK,
     F_DISK,
     G_DISK,
     H_DISK,
     I_DISK,
     J_DISK,
     K_DISK,
     L_DISK,
     pci_required,
     sox_required,
     BUSNIESS_UNIT_LEADER ,
     VIRTUAL_CLUSTER_NAME ,
     RED_OR_BLUE,
     NETWORK__VLAN__ZONE
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
       --l_group_name :=  c1.aag_cluster_name;
       l_group_name :=  c1.aag_cluster_name||'_'||l_unq_grp ;
      else
       --l_group_name :=  replace(c1.ticket_ref,' ','_');
       l_group_name :=  replace(c1.ticket_ref,' ','_')||'_'||l_unq_grp ;
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
	    '"host": "'       || l_group_name || '",
		"Env1": "'       || c1.environment|| '",
		"DC": "'       || c1.data_center|| '",
		"Domain": "'       || c1.domain || '",
        "ticket_ref": "'       || c1.ticket_ref || '",
		"SqlVersion": '       ||c1.sql_version || ' ,
        "SSMSVersion": "v'       ||c1.sql_version || '",
        "BuPath": "'       ||c1.backups_drive || '",
        "DataPath": "' ||c1.data_drive || '",
        "LogPath": "'       || c1.logs_drive || '",
        "SystemPath": "'       || c1.system_drive || '",
        "TempdbPath": "'       || c1.temp_drive || '",
        "expected_ram": "'       || c1.mem || '",
        "expected_cpu_processor_core": "'       || c1.cores || '",
        "expected_c_drive_size": "'       || c1.os_disk || '",
        "expected_d_drive_size": "'       || c1.D_DISK || '",
        "expected_e_drive_size": "'       || c1.e_DISK || '",
        "expected_f_drive_size": "'       || c1.f_DISK || '",
        "expected_g_drive_size": "'       || c1.g_DISK || '",
        "expected_h_drive_size": "'       || c1.h_DISK || '",
        "expected_i_drive_size": "'       || c1.i_DISK || '",
        "expected_j_drive_size": "'       || c1.j_DISK || '",
        "expected_userdomain": "'       || c1.domain || '",
        "PrjId": "'       || c1.PROJECT_ID || '",
        "AppId": "'       || c1.APPLICATION_REFERENCE || '",
        "SecurityZone": "'       || c1.NETWORK__VLAN__ZONE || '",
        "RedorBlue": "'       || c1.RED_OR_BLUE || '",
        "OSName": "'       || c1.OPERATING_SYSTEM || '",  
        "IsVM": "'       || c1.phy_vert || '",
        "Audit": "'       ||case when c1.pci_required = 'YES' then 'PCI' when c1.sox_required = 'YES' then 'SOX' else 'N/A' end || '",
        "BUL": "'       || c1.BUSNIESS_UNIT_LEADER || '",  
        "VCName": "'       || c1.VIRTUAL_CLUSTER_NAME || '",
        "nameWSFC": "'       || c1.aag_cluster_name || '",
        "node1": "'       || c1.aag_primary || '",
        "node2": "'       || case when c1.aag_secondary is null then c1.aag_drreplica else c1.aag_secondary  end || '",
        "node3": "'       || case when c1.aag_secondary_2 is not null then c1.aag_secondary_2 else c1.aag_drreplica end || '",
        "node4": "'       || case when c1.aag_drreplica is null and c1.aag_secondary_2 is not null then  c1.aag_secondary_3 when c1.aag_drreplica is not null and c1.aag_secondary_2 is not null and c1.aag_secondary_3 is null then  c1.aag_drreplica else null end || '",
        "node5": "'       || case when c1.aag_drreplica is not null and c1.aag_secondary_3 is not null then  c1.aag_drreplica else null end || '",
        "PrimaryReplica": "'       || c1.aag_primary || '",
        "SecondaryReplica": "'       || c1.aag_secondary || '",
        "DrReplica": "'       || c1.aag_drreplica || '",
        "Dr_Flag": '       || c1.aag_dr_flag || ',
        "EndPointPort": "'       || c1.AAG_ENDPOINTPORT || '",
        "AvailabilityGroup": "'       || c1.AAG_AVAILABILITYGROUP || '",
        "Listener": "'       || c1.aag_listener || '",
        "IPListener": "'       || c1.aag_listenerip || '",
        "ListenerPort": "'       || c1.aag_listnerport || '",
        "ListenerSubnet": "'       || c1.aag_listnersubnet || '",
        "IPListener2": "'       || case when lower(c1.aag_dr_flag) = 'true' then c1.aag_listnerip_2 else null end || '",
        "ListenerSubnet2": "'       ||  case when lower(c1.aag_dr_flag) = 'true' then c1.aag_listnersubnet_2 else null end || '",
		"TowerPath": "/ansible"';
 /*
 expected_userdomain: TECHLAB
expected_c_drive_size:
expected_c_drive_size:
expected_cpu_processor_core
aag_cluster_name,
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
--		"SqlVersion": "'       ||c1.sql_version || '",

	    '"host": "'       || l_group_name || '",
        "ticket_ref": "'       || c1.ticket_ref || '",
		"Env1": "'       || c1.environment|| '",
		"DC": "'       || c1.data_center|| '",
		"Domain": "'       || c1.domain || '",
		"SqlVersion": '       ||c1.sql_version || ',
        "SSMSVersion": "v'       ||c1.sql_version || '",
        "BuPath": "'       ||c1.backups_drive || '",
        "DataPath": "' ||c1.data_drive || '",
        "LogPath": "'       || c1.logs_drive || '",
        "SystemPath": "'       || c1.system_drive || '",
        "TempdbPath": "'       || c1.temp_drive || '",
        "expected_ram": "'       || c1.mem || '",
        "expected_cpu_processor_core": "'       || c1.cores || '",
        "expected_c_drive_size": "'       || c1.os_disk || '",
        "expected_d_drive_size": "'       || c1.D_DISK || '",
        "expected_e_drive_size": "'       || c1.e_DISK || '",
        "expected_f_drive_size": "'       || c1.f_DISK || '",
        "expected_g_drive_size": "'       || c1.g_DISK || '",
        "expected_h_drive_size": "'       || c1.h_DISK || '",
        "expected_i_drive_size": "'       || c1.i_DISK || '",
        "expected_j_drive_size": "'       || c1.j_DISK || '",
        "expected_userdomain": "'       || c1.domain || '",
        "PrjId": "'       || c1.PROJECT_ID || '",
        "AppId": "'       || c1.APPLICATION_REFERENCE || '",
        "SecurityZone": "'       || c1.NETWORK__VLAN__ZONE || '",
        "RedorBlue": "'       || c1.RED_OR_BLUE || '",
        "OSName": "'       || c1.OPERATING_SYSTEM || '",  
        "IsVM": "'       || c1.phy_vert || '",
        "Audit": "'       ||case when c1.pci_required = 'YES' then 'PCI' when c1.sox_required = 'YES' then 'SOX' else 'N/A' end || '",
        "BUL": "'       || c1.BUSNIESS_UNIT_LEADER || '",  
        "VCName": "'       || c1.VIRTUAL_CLUSTER_NAME || '",
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
      v_param_json := replace(v_param_json,chr(10));   
       p_extra_vars :=  v_param_json;   

  -- Setting Ask variable true.
    begin
    v_job_name_tower := oac$ansible_rest_utl.get_name(c1.template_type,v_workflow_id);
    oac$ansible_rest_utl.set_ask_variable(g_endpoint_prefix|| case when c1.template_type = 'W' then g_workflow_template else g_playbook_template end || v_workflow_id ||'/',v_job_name_tower,'true');
    exception
    when others then
     null;
    end; 

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
     --  Need the group its not passed back so update the record
     --

           update  v_request_queue q
          set q.group_id = l_group_id
            WHERE
                q.id = p_request_id;

     --
     -- Complete the reference
     --   
        update charter2_inv.V_SELF_SERVICE_STATUS s   
         set s.req_queue_id = p_request_id

        where s.request_id =  p_self_service_id;

  END do_mssql_install_withDB;

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
            dbms_output.put_line('Remove Group for request response:'||substr(v_response,1,250));
            IF   nvl(instr(v_response,'Error'),0) <= 0     THEN
                UPDATE v_request_queue
                    SET
                        status = 'O'
                WHERE
                    id = p_req_id;

                COMMIT;
            else
             dbms_output.put_line('Error during remove:' || instr(v_response,'Error'));            

            END IF;


            v_response   := NULL;
        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Remove Group for request' || sqlerrm);
    END;

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
            dbms_output.put_line('Remove group Ticket Ref/Job:'||i.TICKET_REF||'/'||i.job_name);
            oac$ansible_mssql_utl.remove_group(i.req_queue_id);
        END LOOP;


    END; 


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
  /*
   setup_batch_job(  p_search => upper('%OAC$ANSIBLE_MSSQL_UTL.remove_job_groups%'),
    p_what => upper('OAC$ANSIBLE_MSSQL_UTL.remove_job_groups ();'),
    p_start => sysdate + 15/(24 *60)  , 
    p_interval => 'sysdate + 15/(24 *60)' );
  */
   setup_batch_job(  p_search => upper('%OAC$ANSIBLE_MSSQL_UTL.remove_job_groups%'),
    p_what => upper('OAC$ANSIBLE_MSSQL_UTL.remove_job_groups ();'),
    p_start => sysdate + .1/24  , 
    p_interval => 'sysdate + 8/24' );

  elsif p_action in ('REMOVE','DELETE','DROP') then
    remove_batch_job(  p_search =>upper('%OAC$ANSIBLE_MSSQL_UTL.remove_job_groups%'));
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

END OAC$ANSIBLE_MSSQL_UTL;

/
