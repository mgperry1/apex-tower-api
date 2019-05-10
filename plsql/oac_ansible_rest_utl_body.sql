CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$ANSIBLE_REST_UTL" as

/*
author: Jaydipsinh Raulji
*/
PROCEDURE do_rest_call (
    p_url            IN VARCHAR2,
    p_http_method    IN VARCHAR2 DEFAULT 'GET',
    p_content_type   IN VARCHAR2 DEFAULT g_content_type,
    p_body           IN CLOB DEFAULT NULL,
    p_response       OUT CLOB
)
    AS
BEGIN
    apex_web_service.g_request_headers(1).name    := 'Content-Type';
    apex_web_service.g_request_headers(1).value   := p_content_type;
    
    dbms_output.put_line('inside p_content_type: ' ||p_content_type);
    dbms_output.put_line('inside p_url: ' ||p_url);
    dbms_output.put_line('inside p_http_method: ' ||p_http_method);
    dbms_output.put_line('inside p_username: ' ||p_username);
    dbms_output.put_line('inside p_password: ' ||p_password);
    dbms_output.put_line('inside g_wallet_path: ' ||g_wallet_path);
    dbms_output.put_line('inside g_wallet_pass: ' ||g_wallet_pass);
    dbms_output.put_line('inside p_body: ' ||p_body);
    

    IF
        p_body IS NOT NULL
    THEN
        dbms_output.put_line('with p_body: ');

        p_response   := apex_web_service.make_rest_request(
            p_url           => p_url,
            p_http_method   => p_http_method,
            p_username      => p_username,
            p_password      => p_password,
            p_wallet_path   => g_wallet_path,
            p_wallet_pwd    => g_wallet_pass,
            p_body          => p_body
        );
    ELSE
        dbms_output.put_line('without p_body: ');

        p_response   := apex_web_service.make_rest_request(
            p_url           => p_url,
            p_http_method   => p_http_method,
            p_username      => p_username,
            p_password      => p_password,
            p_wallet_path   => g_wallet_path,
            p_wallet_pwd    => g_wallet_pass
        );
    END IF;
--dbms_output.put_line('inside do_rest_call: ' ||p_response);

  INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response,
     body
    ) values (
    p_http_method,
    p_url,
     p_response,
     p_body
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside do_rest_call: ' ||p_url ||'' ||sqlerrm);
        p_response   := sqlerrm;
END do_rest_call;
   
 procedure make_rest_call   (p_flag in varchar2 default g_flag
                            ,p_id in number
                            ,p_param_json in varchar2
                            --,p_job_id out number
                            ,p_response out clob)
 as
  l_buffer         varchar2(32767);
  l_amount         number := 32000 ;
  l_offset         number := 1;
  l_clob           clob;
  v_id number;
  v_url varchar2(100);
  v_status varchar2(100);
  v_result_stdout clob;
  v_job_name varchar2(255);
 begin
  /*
  dbms_output.put_line('In make rest:'||substr(p_param_json,1,800) );
  dbms_output.put_line('In make rest flag:'||p_flag );
  dbms_output.put_line('Make URL:'||g_endpoint_prefix|| case when p_flag = 'W' then g_workflow_template else g_playbook_template end || p_id ||'/launch/');
  */
  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := g_content_type ; --'application/json'; 
  -- host should be dbtest04.techlab.com 
  /***/
  -- Setting Ask variable true.
    v_job_name:= oac$ansible_rest_utl.get_name(p_flag,p_id);
    set_ask_variable(g_endpoint_prefix|| case when p_flag = 'W' then g_workflow_template else g_playbook_template end || p_id ||'/',v_job_name,'true');
    
  
  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| case when p_flag = 'W' then g_workflow_template else g_playbook_template end || p_id ||'/launch/',
              p_http_method => 'POST',
              p_username => p_username ,
              p_password => p_password ,      
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => '{ 
                           "extra_vars": {
                             ' || p_param_json ||'
                             }
                          }'
              );
              
              INSERT INTO v_ansible_api_result (
     request_type,
     call_url,
     response,
     body
    ) values (
    'POST',
    g_endpoint_prefix|| case when p_flag = 'W' then g_workflow_template else g_playbook_template end || p_id ||'/launch/',
     l_clob,
     '{ 
                           "extra_vars": {
                             ' || p_param_json ||'
                             }
                          }'
    );
   /* Changed MGP to ask for extra vars
  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| case when p_flag = 'W' then g_workflow_template else g_playbook_template end || p_id ||'/launch/',
              p_http_method => 'POST',
              p_username => p_username ,
              p_password => p_password ,      
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => '{
                           "extra_vars": {
                             ' || p_param_json ||'
                             }
                          }'
              );
  */
        -- we have separate function to parse data      
 /*   begin
        loop
            dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );

            apex_json.parse(l_buffer);
            p_job_id := apex_json.get_varchar2(p_path => 'id')   ;  
            -- here we do parse response in order to enter into table.
             v_id := apex_json.get_varchar2(p_path => 'id')   ;     
             v_url := apex_json.get_varchar2(p_path => 'url')   ; 
             v_status := apex_json.get_varchar2(p_path => 'status')   ;     
             v_result_stdout := apex_json.get_varchar2(p_path => 'result_stdout');            

            --htp.p('ID : ' || apex_json.get_varchar2(p_path => 'id'));
            --htp.p('<br>');
            --htp.p(l_buffer);
            l_offset := l_offset + l_amount;
            l_amount := 32000;
        end loop;
    exception
        when no_data_found then
            null;
    end;

    */

    -- insert into the table.
       -- insert into V_SELF_SERVICE_STATUS (REQUEST_TYPE,JOB_NAME,JOB_NO,JOB_RESULT,TICKET_REF,TARGET_NAME,JOB_URL,RESULT_STDOUT)
       -- values ('PROVISIONING','Oracle Prechecks', v_id, v_status,:p20_TICKET_REF,:p20_CLUSTER_HOST, v_url, v_result_stdout);    
    p_response  := l_clob;    

 end make_rest_call;


procedure parse_and_store_resp (p_request_type in varchar2, -- e.g. provisioning
                                p_job_name in varchar2,     -- e.g. oracleprechecks
                                p_ticket_ref in varchar2,   -- e.g. 
                                p_target_name in varchar2,  -- e.g. this can be cluster name when cluster type or host name when host/standalone req. made
                                p_resp_clob in clob,
                                p_id out number,
                                p_request_id out number) 
as
  l_clob clob;
  l_buffer         varchar2(32767);
  l_amount         number;
  l_offset         number;
  l_response       clob;
--  l_endpoint       varchar2 (255) := 'https://tower.techlab.com/api/v2/job_templates/252/launch/';
  v_id number;
  v_request_id  number;
  v_url varchar2(100);
  v_status varchar2(100);
  v_result_stdout clob;
  v_sqlerrm varchar2(4000);
begin
    l_amount    := 32000;
    l_offset    := 1;
    l_clob      := p_resp_clob;
    begin
        loop
            dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );
             apex_json.parse(l_buffer);                  
             v_id := apex_json.get_varchar2(p_path => 'id')   ;     
             v_url := apex_json.get_varchar2(p_path => 'url')   ; 
             v_status := apex_json.get_varchar2(p_path => 'status')   ;     
             v_result_stdout := apex_json.get_varchar2(p_path => 'result_stdout');

            l_offset := l_offset + l_amount;
            l_amount := 32000;
        end loop;        
    exception
      when no_data_found then
         null;
    end;
    -- assign the id parsed from the response.
        p_id := v_id;
        -- log the response entry.
        begin
         insert into V_SELF_SERVICE_STATUS (REQUEST_TYPE,JOB_NAME,JOB_NO,JOB_RESULT,TICKET_REF,TARGET_NAME,JOB_URL,RESULT_STDOUT)
         values (p_request_type,p_job_name, v_id, v_status,p_ticket_ref,p_target_name,v_url, v_result_stdout) 
            returning request_id into v_request_id ;
        exception when others then null;
          v_sqlerrm := SQLERRM;
          dbms_output.put_line('StoreFailed:'||v_sqlerrm);
        end;   
       -- assign the request record id created in table. 
        p_request_id := v_request_id; 

end parse_and_store_resp;

procedure do_cluster_workflow_rest (  p_job_name in varchar2,
                                      p_host_name in varchar2,
                                      p_cluster_name in varchar2,
                                      p_cluster_type in varchar2,
                                      p_gi_version in varchar2,
                                      p_env_source in  varchar2,
                                      p_ticket_ref in varchar2,
                                      p_application_name in varchar2,
                                      p_business_unit in varchar2,
                                      p_network_type in varchar2,
                                      p_oracle_version in varchar2,
                                      p_os_type in varchar2,
                                      p_os_type_version in varchar2,
                                      p_phy_vert in varchar2,
                                      p_clustered in varchar2,
                                      p_dc_location in varchar2,
                                      p_server_monitoring_tool in varchar2,
                                      p_oracle_db_name in varchar2,
                                      p_db_environment in varchar2,
                                      p_rac_type in varchar2,
                                      p_database_role in varchar2,
                                      p_env_category in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2,
                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
--v_job_name      varchar2(50):= 'oracle-rac-install';
v_job_name varchar2(50) := p_job_name; 
v_workflow_id   number ;-- := get_id(g_workflow,v_job_name) ;
--v_workflow_id   number := 258 ;


begin

v_workflow_id   := get_id(g_workflow,v_job_name) ;
null;
    v_param_json :=
       '"host": "'       || p_host_name || '" ,
       "cluster_name": "'    || p_cluster_name || '",
       "cluster_type": "'    || p_cluster_type ||'",
       "gi_version": "'      || p_gi_version ||'",
       "env_source": "'      || p_env_source ||'",
       "application_name":"'  || p_application_name ||'",
       "business_unit": "'   || p_business_unit ||'",
       "network_type": "'    || p_network_type || '",
       "oracle_version": "'  || p_oracle_version ||'",
       "os_type": "'         || p_os_type ||'",
       "os_type_version": "' || p_os_type_version ||'",
       "phy_virt": "'        || p_phy_vert ||'",
       "clustered": "'       || p_clustered ||'",
       "dc_location": "'     || p_dc_location ||'",
       "server_monitoring_tool":"' || p_server_monitoring_tool ||'",
       "oracle_db_name": "'  || p_oracle_db_name ||'",
       "db_environment": "'  || p_db_environment || '",
       "rac_type": "'        || p_rac_type ||'",
       "database_role": "'   || p_database_role ||'",
       "env_category": "'    || p_env_category ||'",
       "storage_type": "'    || p_storage_type ||'",
       "db_monitoring_tool":"' || p_db_monitoring_tool ||'",
       "appliance": "'       || p_appliance ||'",
       "pci_required": "'    || p_pci_required ||'",
       "sox_required": "'    || p_sox_required ||'",
       "encryption_required": "' || p_encryption_required ||'",
       "backup_enabled": "'  || p_backup_enabled ||'",
       "monitoring": "'      || p_monitoring ||'"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => 'W',
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_cluster_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_cluster_workflow_rest;

procedure do_standalone_workflow_rest(p_job_name in varchar2,
                                      p_host_name in varchar2,
                                      p_oracle_version in varchar2,
                                      p_os_type in varchar2,
                                      p_os_type_version in varchar2,
                                      p_env_source in  varchar2,
                                      p_ticket_ref in varchar2,
                                      p_network_type in varchar2,
                                      p_dc_location in varchar2,
                                      p_server_monitoring_tool in varchar2,
                                      p_phy_vert in varchar2,
									  p_database_name in varchar2,
                                      p_db_environment in varchar2,
                                      p_rac_type in varchar2,
                                      p_database_role in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2,
                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name varchar2(50) := p_job_name;
--v_job_name      varchar2(50):= 'oracle-standalone-install';
--v_workflow_id   number := 249 ;
v_workflow_id   number ;--:= get_id(g_workflow,v_job_name) ;

begin
/*
if p_db_option = 'DB' then
    v_job_name  := 'Standalone-withDB';
else
    v_job_name  := 'Standalone-none-DB-Creation';
end if;
*/

v_workflow_id   := get_id(g_workflow,v_job_name) ;
null;
    v_param_json :=
       '"host": "'        || p_host_name || '" ,
       "oracle_version": "'    || p_oracle_version || '",
       "os_type": "'           || p_os_type ||'",
       "os_type_version": "'   || p_os_type_version ||'",
       "env_source": "'      || p_env_source ||'",
       "p_ticket_ref": "'      || p_ticket_ref || '",
       "network_type": "'      || p_network_type ||'",
       "dc_location":"'         || p_dc_location ||'",
       "server_monitoring_tool": "' || p_server_monitoring_tool ||'",
       "phy_virt": "'               || p_phy_vert || '",
       "oracle_db_name": "'          || p_database_name ||'",
       "db_environment": "'         || p_db_environment ||'",
       "rac_type": "'               || p_rac_type||'",
       "database_role": "'          || p_database_role ||'",
       "storage_type": "'           || p_storage_type ||'",
       "db_monitoring_tool": "'     || p_db_monitoring_tool ||'",
       "appliance":"'                || p_appliance ||'",
       "pci_required": "'           || p_pci_required ||'",
       "sox_required": "'           || p_sox_required ||'",
       "encryption_required": "'    || p_encryption_required ||'",
       "backup_enabled": "'         || p_backup_enabled ||'",
       "monitoring": "'             || p_monitoring ||'"';

    -- make a rest call.

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => 'W',
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    
      dbms_output.put_line('v_response: ' ||v_response);
   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

      p_job_id := v_job_id;

end do_standalone_workflow_rest;


procedure do_cluster_workflow_rest (  p_host_name in varchar2,
                                      p_cluster_name in varchar2,
                                      p_cluster_type in varchar2,
                                      p_gi_version in varchar2,
                                      p_env_source in  varchar2,
                                      p_ticket_ref in varchar2,
                                      p_application_name in varchar2,
                                      p_business_unit in varchar2,
                                      p_network_type in varchar2,
                                      p_oracle_version in varchar2,
                                      p_os_type in varchar2,
                                      p_os_type_version in varchar2,
                                      p_phy_vert in varchar2,
                                      p_clustered in varchar2,
                                      p_dc_location in varchar2,
                                      p_server_monitoring_tool in varchar2,
                                      p_oracle_db_name in varchar2,
                                      p_db_environment in varchar2,
                                      p_rac_type in varchar2,
                                      p_database_role in varchar2,
                                      p_env_category in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2,
                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'oracle-rac-install';
v_workflow_id   number := 258 ;
begin
null;
    v_param_json :=
       '"host": "'       || p_host_name || '" ,
       "cluster_name": "'    || p_cluster_name || '",
       "cluster_type": "'    || p_cluster_type ||'",
       "gi_version": "'      || p_gi_version ||'",
       "env_source": "'      || p_env_source ||'",
       "application_name":"'  || p_application_name ||'",
       "business_unit": "'   || p_business_unit ||'",
       "network_type": "'    || p_network_type || '",
       "oracle_version": "'  || p_oracle_version ||'",
       "os_type": "'         || p_os_type ||'",
       "os_type_version": "' || p_os_type_version ||'",
       "phy_virt": "'        || p_phy_vert ||'",
       "clustered": "'       || p_clustered ||'",
       "dc_location": "'     || p_dc_location ||'",
       "server_monitoring_tool":"' || p_server_monitoring_tool ||'",
       "oracle_db_name": "'  || p_oracle_db_name ||'",
       "db_environment": "'  || p_db_environment || '",
       "rac_type": "'        || p_rac_type ||'",
       "database_role": "'   || p_database_role ||'",
       "env_category": "'    || p_env_category ||'",
       "storage_type": "'    || p_storage_type ||'",
       "db_monitoring_tool":"' || p_db_monitoring_tool ||'",
       "appliance": "'       || p_appliance ||'",
       "pci_required": "'    || p_pci_required ||'",
       "sox_required": "'    || p_sox_required ||'",
       "encryption_required": "' || p_encryption_required ||'",
       "backup_enabled": "'  || p_backup_enabled ||'",
       "monitoring": "'      || p_monitoring ||'"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => 'W',
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_cluster_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_cluster_workflow_rest;

procedure do_standalone_workflow_rest(p_host_name in varchar2,
                                      p_oracle_version in varchar2,
                                      p_os_type in varchar2,
                                      p_os_type_version in varchar2,
                                      p_env_source in  varchar2,
                                      p_ticket_ref in varchar2,
                                      p_network_type in varchar2,
                                      p_dc_location in varchar2,
                                      p_server_monitoring_tool in varchar2,
                                      p_phy_vert in varchar2,
									  p_database_name in varchar2,
                                      p_db_environment in varchar2,
                                      p_rac_type in varchar2,
                                      p_database_role in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2,
                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'oracle-standalone-install';
v_workflow_id   number := 249 ;

begin
null;
    v_param_json :=
       '"host": "'        || p_host_name || '" ,
       "oracle_version": "'    || p_oracle_version || '",
       "os_type": "'           || p_os_type ||'",
       "os_type_version": "'   || p_os_type_version ||'",
       "env_source": "'      || p_env_source ||'",
       "p_ticket_ref": "'      || p_ticket_ref || '",
       "network_type": "'      || p_network_type ||'",
       "dc_location":"'         || p_dc_location ||'",
       "server_monitoring_tool": "' || p_server_monitoring_tool ||'",
       "phy_virt": "'               || p_phy_vert || '",
       "oracle_db_name": "'          || p_database_name ||'",
       "db_environment": "'         || p_db_environment ||'",
       "rac_type": "'               || p_rac_type||'",
       "database_role": "'          || p_database_role ||'",
       "storage_type": "'           || p_storage_type ||'",
       "db_monitoring_tool": "'     || p_db_monitoring_tool ||'",
       "appliance":"'                || p_appliance ||'",
       "pci_required": "'           || p_pci_required ||'",
       "sox_required": "'           || p_sox_required ||'",
       "encryption_required": "'    || p_encryption_required ||'",
       "backup_enabled": "'         || p_backup_enabled ||'",
       "monitoring": "'             || p_monitoring ||'"';

    -- make a rest call.

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => 'W',
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

      p_job_id := v_job_id;

end do_standalone_workflow_rest;

procedure add_host (p_inventory_id in number default g_default_inventory_id, p_host_name in varchar2,p_response out clob)
as 

  v_param_json    clob;
  l_clob           clob;

/*  v_response      clob;
  l_buffer         varchar2(32767);
  l_amount         number := 32000 ;
  l_offset         number := 1;
  l_clob           clob;
  v_id number;
  v_url varchar2(100);
  v_status varchar2(100);
  v_result_stdout clob;*/
begin
    null;

   --"name": "'|| p_host_name || g_tower_domain ||'" ,  
   -- MGP 18-NOV Took off addng the domain when adding the host
    v_param_json :=
       '{
       "name": "'|| p_host_name ||'" ,
       "description": "",
       "inventory": "'|| p_inventory_id ||'",
       "enabled": "true",
       "instance_id": "",
       "variables":""
       }';


  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := g_content_type ; --'application/json'; 
  -- host should be dbtest04.techlab.com 
  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| g_host_template  ,
              p_http_method => 'POST',
              p_username => p_username ,
              p_password => p_password ,
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => v_param_json
              /*p_body => '{
                           "extra_vars": {
                             ' || v_param_json ||'
                             }
                          }'*/
              );
        -- we have separate function to parse data      
 /*   begin
        loop
            dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );

            apex_json.parse(l_buffer);
            p_job_id := apex_json.get_varchar2(p_path => 'id')   ;  
            -- here we do parse response in order to enter into table.
             v_id := apex_json.get_varchar2(p_path => 'id')   ;     
             v_url := apex_json.get_varchar2(p_path => 'url')   ; 
             v_status := apex_json.get_varchar2(p_path => 'status')   ;     
             v_result_stdout := apex_json.get_varchar2(p_path => 'result_stdout');            

            --htp.p('ID : ' || apex_json.get_varchar2(p_path => 'id'));
            --htp.p('<br>');
            --htp.p(l_buffer);
            l_offset := l_offset + l_amount;
            l_amount := 32000;
        end loop;
    exception
        when no_data_found then
            null;
    end;

    */
    p_response  := l_clob;
 exception 
    when others then null;  
end add_host;

-- This function intake url and get the id for the playbook/workflows.
FUNCTION get_id ( p_url VARCHAR2 ) RETURN NUMBER IS
    v_id       NUMBER;
    l_clob     CLOB;
    l_amount   NUMBER;
    l_offset   NUMBER;
    l_buffer   VARCHAR2(32767);
BEGIN
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type;
    l_clob := apex_web_service.make_rest_request(
        p_url           => p_url,
        p_http_method   => 'GET',
        p_username      => p_username,
        p_password      => p_password,
        p_wallet_path   => g_wallet_path,
        p_wallet_pwd    => g_wallet_pass
    );
    dbms_output.put_line('URL is : ' || p_url);
    dbms_output.put_line('Response  is : ' || l_clob);
    l_amount := 32000;
    l_offset := 1;
                dbms_output.put_line(' Function: ' || l_clob);

    BEGIN
        LOOP
            dbms_lob.read(
                l_clob,
                l_amount,
                l_offset,
                l_buffer
            );
            apex_json.parse(l_buffer);
            v_id := apex_json.get_varchar2(
                p_path   => 'results[1].id'
            );
            l_offset := l_offset + l_amount;
            l_amount := 32000;
            dbms_output.put_line('v_id: ' || v_id);
        END LOOP;
    EXCEPTION
        WHEN no_data_found THEN null;
        htp.p(sqlerrm);
            dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);
    END;
       RETURN v_id;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);
                htp.p('Error inside GET_ID Function: ' || sqlerrm);  

        RETURN v_id;

END get_id;



FUNCTION get_id ( p_workflow_playbook in varchar2 default g_workflow , p_name in VARCHAR2 ) RETURN NUMBER IS
    v_id       NUMBER;
    l_clob     CLOB;
    l_amount   NUMBER;
    l_offset   NUMBER;
    l_buffer   VARCHAR2(32767);
BEGIN
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type;
    dbms_output.put_line(' URL: ' || g_endpoint_prefix|| case when p_workflow_playbook = 'W' then g_workflow_template else g_playbook_template end 
    || '?name='|| p_name);
    l_clob := apex_web_service.make_rest_request(
        p_url           => g_endpoint_prefix|| case when p_workflow_playbook = 'W' then g_workflow_template 
                                                    when p_workflow_playbook = 'I' then g_inventory_template
                                                    when p_workflow_playbook = 'P' then g_playbook_template   
                                                    when p_workflow_playbook = g_host then g_host_template
                                                    when p_workflow_playbook = g_group then g_group_template 
                                                    end || '?name='|| p_name ,
        p_http_method   => 'GET',
        p_username      => p_username,
        p_password      => p_password,
        p_wallet_path   => g_wallet_path,
        p_wallet_pwd    => g_wallet_pass
    );

    l_amount := 32000;
    l_offset := 1;
                dbms_output.put_line(' Function: ' || l_clob);

    BEGIN
        LOOP
            dbms_lob.read(
                l_clob,
                l_amount,
                l_offset,
                l_buffer
            );
            apex_json.parse(l_buffer);
            v_id := apex_json.get_varchar2(
                p_path   => 'results[1].id'
            );
             dbms_output.put_line('v_id: ' || v_id);

            l_offset := l_offset + l_amount;
            l_amount := 32000;
        END LOOP;
    EXCEPTION
        WHEN no_data_found THEN null;
            --dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);
    END;
       RETURN v_id;
EXCEPTION
    WHEN OTHERS THEN raise;
        dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);  
        RETURN v_id;
END get_id;



FUNCTION get_playbook_id ( p_name IN VARCHAR2 ) RETURN NUMBER
    AS
BEGIN
    RETURN oac$ansible_rest_utl.get_id(
        p_workflow_playbook   => g_playbook,
        p_name                => p_name
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_playbook_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_playbook_id;


FUNCTION get_workflow_id ( p_name IN VARCHAR2 ) RETURN NUMBER
    AS
  template_id number;
BEGIN
 SELECT
    max(template_id)
    into
    template_id
FROM
    v_ansible_template_store
    where
    template_name = p_name
    ;
    RETURN  template_id;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_workflow_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_workflow_id;



FUNCTION get_workflow_id_old ( p_name IN VARCHAR2 ) RETURN NUMBER
    AS
BEGIN
    RETURN oac$ansible_rest_utl.get_id(
        p_workflow_playbook   => g_workflow,
        p_name                => p_name
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_workflow_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_workflow_id_old;

FUNCTION get_inventory_id ( p_name IN VARCHAR2 DEFAULT g_default_inventory ) RETURN NUMBER
    AS
BEGIN
    RETURN oac$ansible_rest_utl.get_id(
        p_workflow_playbook   => g_inventory,
        p_name                => p_name
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_inventory_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_inventory_id;


FUNCTION get_host_id ( p_name IN VARCHAR2 ) RETURN NUMBER
    AS
BEGIN
    RETURN oac$ansible_rest_utl.get_id(
        p_workflow_playbook   => g_host,
        p_name                => p_name
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_host_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_host_id;

FUNCTION get_group_id ( p_name IN VARCHAR2 ) RETURN NUMBER
    AS
BEGIN
    RETURN oac$ansible_rest_utl.get_id(
        p_workflow_playbook   => g_group,
        p_name                => p_name
    );
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error in get_group_id for : '
         || p_name
         || ' '
         || sqlerrm);
        RETURN NULL;
END get_group_id;

procedure add_group (p_inventory_id in number default g_default_inventory_id, p_group_name in varchar2,p_response out clob)
as 

  v_param_json    clob;
  l_clob          clob;

/*  v_response      clob;
  l_buffer         varchar2(32767);
  l_amount         number := 32000 ;
  l_offset         number := 1;
  l_clob           clob;
  v_id number;
  v_url varchar2(100);
  v_status varchar2(100);
  v_result_stdout clob;*/
begin
    null;

    v_param_json :=
       '{
       "name": "'|| p_group_name  || '" ,
       "inventory": "'|| p_inventory_id ||'"
       }';


  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := g_content_type ; --'application/json'; 
  -- host should be dbtest04.techlab.com 
  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| g_group_template  ,
              p_http_method => 'POST',
              p_username => p_username ,
              p_password => p_password ,
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => v_param_json
              /*p_body => '{
                           "extra_vars": {
                             ' || v_param_json ||'
                             }
                          }'*/
              );
        -- we have separate function to parse data      
 /*   begin
        loop
            dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );

            apex_json.parse(l_buffer);
            p_job_id := apex_json.get_varchar2(p_path => 'id')   ;  
            -- here we do parse response in order to enter into table.
             v_id := apex_json.get_varchar2(p_path => 'id')   ;     
             v_url := apex_json.get_varchar2(p_path => 'url')   ; 
             v_status := apex_json.get_varchar2(p_path => 'status')   ;     
             v_result_stdout := apex_json.get_varchar2(p_path => 'result_stdout');            

            --htp.p('ID : ' || apex_json.get_varchar2(p_path => 'id'));
            --htp.p('<br>');
            --htp.p(l_buffer);
            l_offset := l_offset + l_amount;
            l_amount := 32000;
        end loop;
    exception
        when no_data_found then
            null;
    end;

    */

    p_response  := l_clob;
 exception 
    when others then null;  
end add_group;

procedure delete_group (p_group_id in number, p_response out clob)
as 
  v_param_json    clob;
  l_clob          clob;
begin

  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := g_content_type ; --'application/json'; 

  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| g_group_template || p_group_id || '/' ,
              p_http_method => 'DELETE',
              p_username => p_username ,
              p_password => p_password ,
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => v_param_json
              );

    p_response  := l_clob;
 exception 
    when others then 
    dbms_output.put_line('Error inside delete_group '||sqlerrm);  
    p_response := p_response || 'Error in deleting Group '||p_group_id || ' . '||sqlerrm;
end delete_group;

/**
author: Jaydipsinh Raulji
Purpose: Delete the given host from the tower inventory.
*/
procedure delete_host (p_host_id in number, p_response out clob)
as 
  v_param_json    clob;
  l_clob          clob;
begin

  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := g_content_type ; --'application/json'; 

  l_clob := apex_web_service.make_rest_request(
              p_url => g_endpoint_prefix|| g_host_template || p_host_id || '/' ,
              p_http_method => 'DELETE',
              p_username => p_username ,
              p_password => p_password ,
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass ,
              p_body => v_param_json
              );

    p_response  := l_clob;
 exception 
    when others then 
    dbms_output.put_line('Error inside delete_host '||sqlerrm);  
end delete_host;

/**
--author: Jaydipsinh Raulji
Purpose: Addding/Association of the existing hosts to the given group.
*/
PROCEDURE add_host_to_group (
    p_group_id   IN NUMBER,
    p_host_id    IN NUMBER,
    p_response   OUT CLOB
) AS
    v_param_json   CLOB;
    l_clob         CLOB;
BEGIN
    v_param_json := '{
       "id": ' || p_host_id|| '
       }';   -- adding host id in json body
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type; --'application/json'; 
    l_clob := apex_web_service.make_rest_request(
        p_url           => g_endpoint_prefix
         || g_group_template
         || p_group_id
         || '/'
         || g_host_template,
        p_http_method   => 'POST',
        p_username      => p_username,
        p_password      => p_password,
        p_wallet_path   => g_wallet_path,
        p_wallet_pwd    => g_wallet_pass,
        p_body          => v_param_json
    );

    p_response := l_clob;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside add_host_to_group ' || sqlerrm);
END add_host_to_group;

/**
--author: Jaydipsinh Raulji
Purpose: creating new host and adding to the given group.
*/
PROCEDURE create_host_to_group (
    p_inventory_id       IN NUMBER,
    p_group_id           IN NUMBER,
    p_host_name          IN VARCHAR2,
    p_host_description   IN VARCHAR2 DEFAULT '',
    p_enabled            IN VARCHAR2 DEFAULT 'True',--True/False
    p_instance_id        IN NUMBER DEFAULT '',
    p_variables          IN VARCHAR2 DEFAULT '',
    p_response           OUT CLOB
) AS
    v_param_json   CLOB;
    l_clob         CLOB;
BEGIN


--      MGP nov-18 Took Out appending domain to host
--       "name": "'|| p_host_name || g_tower_domain ||'" ,

    v_param_json :=
       '{
       "name": "'|| p_host_name ||'" ,
       "description": "'||p_host_description||'",
       "inventory": "'|| p_inventory_id ||'",
       "enabled": "'||p_enabled||'",
       "instance_id": "'||p_instance_id||'",
       "variables":"'||p_variables||'"
       }';   -- adding host id in json body

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type; --'application/json'; 
    l_clob := apex_web_service.make_rest_request(
        p_url           => g_endpoint_prefix
         || g_group_template
         || p_group_id
         || '/'
         || g_host_template,
        p_http_method   => 'POST',
        p_username      => p_username,
        p_password      => p_password,
        p_wallet_path   => g_wallet_path,
        p_wallet_pwd    => g_wallet_pass,
        p_body          => v_param_json
    );

    p_response := l_clob;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside create_host_to_group ' || sqlerrm);
END create_host_to_group;

-- **********  Procedure for Oracle Precheck  **********

procedure do_oracle_precheck_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle_prereqs';
--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prifix,g_playbook_template),v_job_name), '/');
v_workflow_id   number;-- := get_id(g_playbook,v_job_name) ;
begin
null;
    v_workflow_id  := get_id(g_playbook,v_job_name) ;

    v_param_json := '"host": "'|| p_host_name || g_tower_domain || '" ';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_precheck_rest;


-- **********  Procedure Oracle - Run Cluster Verify  **********

procedure do_oracle_run_cluster_verify_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle - Run Cluster Verify';
--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prifix,g_playbook_template), v_job_name), '/');
v_workflow_id   number;-- := get_id(g_playbook,v_job_name);
begin
null;
    v_workflow_id  := get_id(g_playbook,v_job_name);
    v_param_json :=  '"host": "'|| p_host_name || g_tower_domain ||'" ';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;
end do_oracle_run_cluster_verify_rest;


-- **********  Procedure for Oracle - Install 12c Grid Standalone  **********  

procedure do_oracle_install_12c_grid_standalone_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle - Install 12c Grid Standalone';
v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number ;--:= get_id(g_playbook,v_job_name);
begin
null;
    v_workflow_id  := get_id(g_playbook,v_job_name);

    v_param_json := '"host": "'|| p_host_name || g_tower_domain ||'",
		             "env_source": "'|| p_env_source ||'" ';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_install_12c_grid_standalone_rest;


-- **********  Procedure for Oracle - Install 12c Database  **********

procedure do_oracle_install_12c_database_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
									  p_rac_install in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle - Install 12c Database';
v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number;-- := get_id(g_playbook,v_job_name) ;
begin
null;
    v_workflow_id := get_id(g_playbook,v_job_name) ;

    v_param_json := '"host": "'|| p_host_name || g_tower_domain ||'"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_install_12c_database_rest;


-- **********  Procedure for Oracle upgrade from 11g  to 12c database  **********

procedure do_oracle_upgrade_from_11g_to_12c_database_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_oracle_db_home in varchar2,
									  p_oracle_db_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle upgrade from 11g  to 12c database';
v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/' );
v_workflow_id   number;-- := get_id(g_playbook,v_job_name) ;
begin
null;
    v_workflow_id  := get_id(g_playbook,v_job_name) ;

    v_param_json := '"host": "'|| p_host_name || g_tower_domain ||'"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_upgrade_from_11g_to_12c_database_rest;


-- **********  Procedure for Oracle - Create DB Instance  **********


procedure do_oracle_create_db_instance_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_oracle_db_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle - Create DB Instance';
v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number;-- := get_id(g_playbook,v_job_name) ;
begin
null;
    v_workflow_id  := get_id(g_playbook,v_job_name) ;

    v_param_json := '"host": "'|| p_host_name || g_tower_domain ||'",
	                "oracle_db_name": "'|| p_oracle_db_name || '"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_create_db_instance_rest;


-- **********  Procedure for Oracle - Install 12c Grid Cluster  **********

procedure do_oracle_install_12c_grid_cluster_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_cluster_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as

v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
v_job_name      varchar2(50):= 'Oracle - Install 12c Grid Cluster';
v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number;-- := get_id(g_playbook,v_job_name) ;
begin
    v_workflow_id  := get_id(g_playbook,v_job_name) ;

    v_param_json := '"host": "' || p_host_name || g_tower_domain ||'"';

    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_cluster_name,            --since cluster_name is there
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_oracle_install_12c_grid_cluster_rest;


-- **********  Procedure for Grid-PSU-apply  **********

procedure do_grid_psu_apply_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_patch_type in varchar2,
									  p_patch_file in varchar2,
									  p_oracle_db_home in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    )
as
v_param_json    clob;
v_response      clob;
v_job_id        number;
--v_request_type  varchar2(50) := 'PROVISIONING';
v_request_type  varchar2(50) := 'PATCHING';
--v_job_name      varchar2(50):= 'Grid-PSU-apply';
v_job_name      varchar2(50):= 'psu-patching-rdbms';

--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number ;--:= get_id(g_playbook,v_job_name) ;
l_hosts_a APEX_APPLICATION_GLOBAL.VC_ARR2;
l_host_id number; -- tower host id
l_group_id number; -- tower group id
l_group_name varchar2(255) := lower(replace(p_ticket_ref,' ','-')) ;
l_host_code varchar2(255);
c_RESPONSE clob; -- Tower host and group reponse
begin
null;
 --
 -- Check the group to see if it exists
 select OAC$ANSIBLE_REST_UTL.get_group_id(l_group_name) into l_group_id from dual;
 if l_group_id is null then
  -- Add a group
   add_group (  
               P_GROUP_NAME => l_group_name,
              P_RESPONSE => c_RESPONSE) ;  

   select OAC$ANSIBLE_REST_UTL.get_group_id(l_group_name) into l_group_id from dual;

 else
  --group does exists Hmmm add a diff group?
  null;
 end if;
-- DBMS_OUTPUT.PUT_LINE ('The group id ' ||l_group_id);
 --
 -- Passed in value from the select list could be multiple hosts
 l_hosts_a := APEX_UTIL.STRING_TO_TABLE(p_host_name);
  -- Loop thru the passed in list of hosts
  FOR i IN 1..l_hosts_a.count 
  LOOP
     select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)||g_tower_domain) into l_host_id from dual;
     select max(host_code) into l_host_code from v_host_inv_tbl where host_name = l_hosts_a(i);
    -- DBMS_OUTPUT.PUT_LINE (l_hosts_a(i));
     --Is the Host in tower if not add it
     if l_host_id is null then
       add_host (  
        P_HOST_NAME => l_hosts_a(i)
       ,P_RESPONSE => c_RESPONSE) ;

       select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)||g_tower_domain) into l_host_id from dual;
     end if;
     --Add the Host to the group  
   --  DBMS_OUTPUT.PUT_LINE (l_hosts_a(i)||g_tower_domain||' - The host id ' ||l_host_id);
      create_host_to_group (  P_INVENTORY_ID => g_default_inventory_id,
       P_GROUP_ID => l_GROUP_ID,
       P_HOST_NAME => l_hosts_a(i),
       P_HOST_DESCRIPTION => l_hosts_a(i),
       P_ENABLED =>null,
      P_INSTANCE_ID => l_host_id,
     P_VARIABLES => null,
      P_RESPONSE => c_RESPONSE) ;
    /*  add_host_to_group (  P_GROUP_ID => l_GROUP_ID,
       P_HOST_ID => l_HOST_ID,
       P_RESPONSE => c_RESPONSE) ;  */


    END LOOP;

    -- Lookup ID from V_ANSIBLE_TEMPLATE_STORE
    v_workflow_id := OAC$ANSIBLE_UTL.GET_TEMPLATE_ID('psu-patching-rdbms-fresh') ;
    --v_workflow_id := 321 ;

    --
    -- Build out all the parms for the PSU by looking up the patch ingo
    --
    for c1 in (
     SELECT
        id,
        patch_file_name,
       patch_type,
      patch_quarter,
      patch_year,
      software_version,
      opatch_version,
      patch_status
     FROM
      v_patch_lookup_tbl 
    where patch_file_name = p_patch_file
    ) loop
    v_param_json :=
  --     '"oracle_db_home": "'       || p_oracle_db_home || '.techlab.com",
  --	    '"host": "'       || p_host_name ||'.'||g_tower_domain|| '",

	    '"host": "'       || l_group_name || '",
		"patch_file": "'       || p_patch_file || '",
		"patch_type": "'       || p_patch_type || '",
		"patch_quarter": "'       || c1.patch_quarter || '",
        "patch_year": "'       || c1.patch_year || '",
        "opatch_version_required": "' ||c1.opatch_version  || '",
        "opatch_util_installer": "'       || p_patch_type || '",
        "db_home": "'       || p_oracle_db_home || '",
        "host_code": "'       || l_host_code || '",
		"oracle_installer_path": "/ansible"';
      end loop;
           /*"patch_file": "p27967747_121020_Linux-x86-64.zip",
	    "host": "oralab1.techlab.com",
		"patch_type": "ORACLE",
		"oracle_installer_path": "/ansible"

        host: the host or group to execute the playbook against. This can also be a Group from the Inventory
patch_file - The full name of the Patch file
patch_type - GRID or ORACLE (if combined use GRID)
patch_quarter - The Patch Quarter to use in 3 char format (e.g. Jul)
patch_year - The Patch Year to use in full format (e.g. 2018)
opatch_version_required - The expected OPatch Version for this PSU (as returned by opatch	version )
opatch_util_installer - The name of the zipfile at '/yum/source/ORACLE_DB/OPATCH/' to install the expected OPatch
version
db_home - database Home for APEX
host_code - for APEX
        */
    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => g_playbook,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    

      p_job_id := v_job_id;

end do_grid_psu_apply_rest;


function setup_oracle_patch_vars(
 p_patch_file in varchar2
) return varchar2 as
  v_param_json varchar2(32000);
Begin
    --
    -- Build out all the parms for the PSU by looking up the patch ingo
    --
    for c1 in (
     SELECT
        id,
        patch_file_name,
       patch_type,
      patch_quarter,
      patch_year,
      software_version,
      opatch_version,
      patch_status,
      opatch_file,
      OJVM_PATCH,
      PSU_VERSION
     FROM
      v_patch_lookup_tbl 
    where patch_file_name = p_patch_file
    ) loop
     --"patch_type": "'       || c1.patch_type || '",
    v_param_json :=
	    
	   '"patch_file": "'       || p_patch_file || '",       
        "patch_quarter": "'       || c1.patch_quarter || '",
        "patch_year": "'       || c1.patch_year || '",
        "psu_version": "'       || c1.PSU_VERSION || '",
        "opatch_version_required": "' ||c1.opatch_version  || '",
        "opatch_util_installer": "'       || c1.opatch_file || '",
        "ojvm_patch": "'       || c1.OJVM_PATCH || '"';
        
      end loop;
     -- Passed back in call so that the request record can be updated 
    
    return  replace(v_param_json,chr(10));   
    dbms_output.put_line('v_param_json: ' ||v_param_json); 

end;
-- **********  Procedure for rdbms-PSU-apply  **********

procedure do_psu_apply_rest (  P_PATCH_REQUEST_ID in number,
                                 p_host_name in varchar2,
                                     p_cluster in varchar2,
                                     p_target_type in varchar2,
                                     p_patch_type in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
									  p_patch_file in varchar2,
									  p_oracle_db_home in varchar2,

                                      p_job_id out number,
                                      p_request_id out number,
                                      p_extra_vars out clob
                                    )
as
v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PATCHING';
v_job_name      varchar2(50):= 'psu-patching-rdbms';

--v_endpoint      varchar2(100) := concat(concat(concat(g_endpoint_prefix,g_playbook_template), v_job_name), '/');
v_workflow_id   number ;--:= get_id(g_playbook,v_job_name) ;
v_playbook_type varchar2(255) := g_workflow;
v_playbook_name varchar2(255) := 'psu-patching-rdbms-fresh'; 
l_hosts_a APEX_APPLICATION_GLOBAL.VC_ARR2;
l_host_id number; -- tower host id
l_group_id number; -- tower group id
l_group_name varchar2(255) := lower(replace(p_ticket_ref,' ','-')) ;
l_host_code varchar2(255);
c_RESPONSE clob; -- Tower host and group reponse
 cluster_host_names varchar2(32000);
begin
null;
 
 DBMS_OUTPUT.PUT_LINE ('Target Type ' ||p_target_type);

 if p_target_type = 'Standalone' then
 -- Passed in value from the select list could be multiple hosts
 l_hosts_a := APEX_UTIL.STRING_TO_TABLE(p_host_name);
else
 --Clustered
 begin
          select listagg(trim(HOST_NAME), ':') within group (order by 1) 
          into cluster_host_names from V_HOST_INV_VW where HOST_CODE = p_cluster;
  exception 
  when others then null;
   cluster_host_names  :='no_cluster_hosts';
  end ; 
end if;
 
 --
 -- Check the group to see if it exists
 select OAC$ANSIBLE_REST_UTL.get_group_id(l_group_name) into l_group_id from dual;
 if l_group_id is null then
  -- Add a group
   add_group (  
               P_GROUP_NAME => l_group_name,
              P_RESPONSE => c_RESPONSE) ;  

   select OAC$ANSIBLE_REST_UTL.get_group_id(l_group_name) into l_group_id from dual;

 else
  --group does exists Hmmm add a diff group?
  null;
 end if;
-- DBMS_OUTPUT.PUT_LINE ('The group id ' ||l_group_id);
 --
  -- Loop thru the passed in list of hosts
  FOR i IN 1..l_hosts_a.count 
  LOOP
  -- Changed so that we do not append domain to host
  --     select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)||g_tower_domain) into l_host_id from dual;
     select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)) into l_host_id from dual;

     select max(host_code) into l_host_code from v_host_inv_tbl where host_name = l_hosts_a(i);
    -- DBMS_OUTPUT.PUT_LINE (l_hosts_a(i));
     --Is the Host in tower if not add it
     if l_host_id is null then
       add_host (  
        P_HOST_NAME => l_hosts_a(i)
       ,P_RESPONSE => c_RESPONSE) ;

  -- Changed so that we do not append domain to host
  --     select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)||g_tower_domain) into l_host_id from dual;
     select OAC$ANSIBLE_REST_UTL.get_host_id(l_hosts_a(i)) into l_host_id from dual;

     end if;
     --Add the Host to the group  
   --  DBMS_OUTPUT.PUT_LINE (l_hosts_a(i)||g_tower_domain||' - The host id ' ||l_host_id);
      create_host_to_group (  P_INVENTORY_ID => g_default_inventory_id,
       P_GROUP_ID => l_GROUP_ID,
       P_HOST_NAME => l_hosts_a(i),
       P_HOST_DESCRIPTION => l_hosts_a(i),
       P_ENABLED =>null,
      P_INSTANCE_ID => l_host_id,
     P_VARIABLES => null,
      P_RESPONSE => c_RESPONSE) ;
    /*  add_host_to_group (  P_GROUP_ID => l_GROUP_ID,
       P_HOST_ID => l_HOST_ID,
       P_RESPONSE => c_RESPONSE) ;  */


    END LOOP;

    -- Lookup ID from V_ANSIBLE_TEMPLATE_STORE
    --v_playbook_type varchar2(255) := g_workflow;
    --v_playbook_name varchar2(255) := 'psu-patching-'||p_patch_type; 
     dbms_output.put_line('Lookup WF: ' ||v_playbook_name); 
    --v_workflow_id := OAC$ANSIBLE_UTL.GET_TEMPLATE_ID(v_playbook_name) ;
    
    --Post Go-Live add the ability to have workflows for diff patch types
    -- v_playbook_name := 'psu-patching-'||p_patch_type; 

    v_workflow_id := OAC$ANSIBLE_UTL.GET_TEMPLATE_ID(v_playbook_name) ;
    
    
    --v_workflow_id := 321 ;

    --
    -- Build out all the parms for the PSU by looking up the patch ingo
    --
    /*
    for c1 in (
     SELECT
        id,
        patch_file_name,
       patch_type,
      patch_quarter,
      patch_year,
      software_version,
      opatch_version,
      patch_status,
      opatch_file,
      OJVM_PATCH
     FROM
      v_patch_lookup_tbl 
    where patch_file_name = p_patch_file
    ) loop
    v_param_json :=
  --     '"oracle_db_home": "'       || p_oracle_db_home || '.techlab.com",
  --	    '"host": "'       || p_host_name ||'.'||g_tower_domain|| '",
  -- opatch_util_installer
  -- NOt sure what the Host_code should be
  --		"patch_type": "'       || p_patch_type || '",
  -- "host_code": "'       || case when :P44_CLUSTERED = 'YES' then v_host_name_list else  :P44_CLUSTER_HOST end || '",
	    '"host": "'       || l_group_name || '",
		"patch_file": "'       || p_patch_file || '",
		"patch_quarter": "'       || c1.patch_quarter || '",
        "patch_year": "'       || c1.patch_year || '",
        "opatch_version_required": "' ||c1.opatch_version  || '",
        "opatch_util_installer": "'       || c1.opatch_file || '",
        "ojvm_patch": "'       || c1.OJVM_PATCH || '",
        "db_home": "'       || p_oracle_db_home || '",
        "host_code": "'       || case when p_target_type = 'Standalone' then replace(p_host_name,':',',') else p_cluster  end || '",
		"oracle_installer_path": "/ansible"';
      end loop;
      */
     -- Passed back in call so that the request record can be updated 
--		"oracle_installer_path": "/ansible",'||

      v_param_json :=
 	    '"host": "'       || l_group_name || '",
        "db_home": "'       || p_oracle_db_home || '",
        "ticket_ref": "'       || p_ticket_ref || '",
        "standard_task_id": "0",
        "host_code": "'       || case when p_target_type = 'Standalone' then replace(p_host_name,':',',') else p_cluster  end || '",'||
         OAC$ANSIBLE_REST_UTL.setup_oracle_patch_vars(p_patch_file ); 
    p_extra_vars := v_param_json;
    -- make a rest call.

    dbms_output.put_line('v_param_json: ' ||v_param_json); 

      OAC$ANSIBLE_REST_UTL.MAKE_REST_CALL(
        P_FLAG => v_playbook_type,
        P_ID => v_workflow_id,
        P_PARAM_JSON => v_param_json,
        P_RESPONSE => v_response
      );    

     dbms_output.put_line('v_response: ' ||v_response);    

   -- parse and store response


      OAC$ANSIBLE_REST_UTL.PARSE_AND_STORE_RESP(
        P_REQUEST_TYPE => v_request_type,
        P_JOB_NAME => v_job_name,
        P_TICKET_REF => p_ticket_ref,
        P_TARGET_NAME => p_host_name,
        P_RESP_CLOB => v_response,
        P_ID => v_job_id,
        p_request_id => p_request_id
      );   

        dbms_output.put_line('v_job_id: ' ||v_job_id);    
        dbms_output.put_line('p_request_id: ' ||p_request_id);    
      p_job_id := v_job_id;
      
  
  
-- Grab the Execution Details so we can link to the log on Page 35
UPDATE  v_patch_request_queue
 set JOB_ID = P_JOB_ID
 ,REQUEST_ID  = P_REQUEST_ID 
,extra_vars = p_extra_vars
, group_id = l_GROUP_ID

where
id =  P_PATCH_REQUEST_ID; 

end do_psu_apply_rest;

--
-- **********  Procedure for Get Playbook  call when press REFRESH Button  **********

procedure get_playbook (  p_endpoint in varchar2,

                                      p_job_id out number,
									  p_url out varchar2,
									  p_job_status out varchar2,
									  p_stdout out varchar2,
									  p_response out varchar2
                                    )
as

  l_clob clob;
  l_amount         number;
  l_offset         number;
  l_buffer         varchar2(32767);
  v_amount         number;
  v_offset         number;

  v_response      clob;
  v_id number;
  v_url varchar2(100);
  v_status varchar2(100);
  v_result_stdout clob;  

begin
  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := 'application/json'; 
  -- host should be dbtest04.techlab.com 

  v_response := apex_web_service.make_rest_request(
              p_url => p_endpoint,
              p_http_method => 'GET',
              p_username => p_username ,
              p_password => p_password ,
              p_wallet_path => g_wallet_path,
              p_wallet_pwd => g_wallet_pass 
              );

    v_amount := 32000;
    v_offset := 1;



    begin
        loop
            dbms_lob.read( v_response, l_amount, l_offset, l_buffer );

            apex_json.parse(l_buffer);
            p_job_id := apex_json.get_varchar2(p_path => 'id')   ;     
            p_url := apex_json.get_varchar2(p_path => 'url')   ;     
            p_job_status := apex_json.get_varchar2(p_path => 'status')   ;     
            p_stdout := apex_json.get_varchar2(p_path => 'result_stdout');

             v_id := apex_json.get_varchar2(p_path => 'id')   ; 
             v_status := apex_json.get_varchar2(p_path => 'status')   ;     
             v_result_stdout := apex_json.get_varchar2(p_path => 'result_stdout');

           --htp.p('ID : ' || apex_json.get_varchar2(p_path => 'id'));
            --htp.p('<br>');
            --htp.p(l_buffer);
            v_offset := l_offset + l_amount;
            v_amount := 32000;
        end loop;
    exception
        when no_data_found then
            dbms_output.put_line('No Data Found......');
    end;


    update v_self_service_status set JOB_RESULT = v_status , RESULT_STDOUT = v_result_stdout  where job_no = (p_job_id);    
    p_response  := v_response;

end get_playbook;

/*
procedure insert_request_queue(  
                                      p_request_id in number,
                                      p_template_name in varchar2,
                                      p_job_id in varchar2,
                                      p_job_name in varchar2,
                                      p_job_url in varchar2,
                                      p_status in varchar2,
                                      p_db_option in varchar2,
                                      p_host_name in varchar2,
                                      p_cluster_name in varchar2,
                                      p_cluster_type in varchar2,
                                      p_gi_version in varchar2,
                                      p_env_source in  varchar2,
                                      p_ticket_ref in varchar2,
                                      p_application_name in varchar2,
                                      p_business_unit in varchar2,
                                      p_network_type in varchar2,
                                      p_oracle_version in varchar2,
                                      p_os_type in varchar2,
                                      p_os_type_version in varchar2,
                                      p_phy_vert in varchar2,
                                      p_clustered in varchar2,
                                      p_dc_location in varchar2,
                                      p_server_monitoring_tool in varchar2,
                                      p_oracle_db_name in varchar2,
                                      p_db_environment in varchar2,
                                      p_rac_type in varchar2,
                                      p_database_role in varchar2,
                                      --p_env_category in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2
                                 )
 as
 host_name_list clob := TO_CLOB(p_host_name);
 begin
         dbms_output.put_line(p_monitoring);
         insert into REQUEST_QUEUE (REQUEST_ID,
                                    TEMPLATE_NAME,
                                    JOB_ID,JOB_NAME,
                                    JOB_URL,
                                    STATUS,
                                    CLUSTER_NAME,
                                    CLUSTER_TYPE,
                                    GI_VERSION,
                                    ENV_SOURCE,
                                    TICKET_REF,
                                    APPLICATION_NAME,
                                    BUSINESS_UNIT,
                                    DB_OPTION,
                                    HOST_NAME,
                                    NETWORK_TYPE,
                                    ORACLE_VERSION,
                                    OS_TYPE,
                                    OS_TYPE_VERSION,
                                    PHY_VERT,
                                    CLUSTERED,
                                    DC_LOCATION,
                                    SERVER_MONITOTING_TOOL,
                                    DATABASE_NAME,
                                    ENVIRONMENT,
                                    RAC_TYPE,
                                    DATABASE_ROLE,
                                    STORAGE_TYPE,
                                    DB_MONITORING_TOOL,
                                    APPLIANCE,
                                    PCI_REQUIRED,
                                    SOX_REQUIRED,
                                    ENCRYPTION_REQUIRED,
                                    BACKUP_REQUIRED,
                                    MONITORING,
                                    CREATED,
                                    CREATED_BY,
                                    UPDATED,
                                   UPDATED_BY
                                   )
                        values (p_request_id
                                ,p_template_name
                                ,p_job_id
                                ,p_job_name
                                ,p_job_url
                                ,p_status
                                ,p_cluster_name
                                ,p_cluster_type
                                ,p_gi_version
                                ,p_env_source
                                ,p_ticket_ref
                                ,p_application_name
                                ,NULL
                                ,p_db_option
                                ,host_name_list
                                ,p_network_type
                                ,p_oracle_version
                                ,p_os_type
                                ,p_os_type_version
                                ,p_phy_vert
                                ,p_clustered
                                ,p_dc_location
                                ,p_server_monitoring_tool
                                ,p_oracle_db_name
                                ,p_db_environment
                                ,p_rac_type
                                ,p_database_role
                                ,p_storage_type
                                ,p_db_monitoring_tool
                                ,p_appliance
                                ,p_pci_required
                                ,p_sox_required
                                ,p_encryption_required
                                ,p_backup_enabled
                                ,p_monitoring
                                ,''
                                ,''
                                ,''
                                ,''
                               );
 end insert_request_queue;*/
-- Provide config options so that globals are set based on V_APP_SETTINGS
 -- Support multiple verbs
 procedure config(p_action in varchar2 default 'INIT',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
 ) 
 as
 Begin
   null;
   -- Set the standard globals for this Oracle install 
   if p_action = 'INIT' then
   for c1 in (
   select
   setting_value
   ,setting_category 
   from V_APP_SETTINGS
   where
   setting_category in (
   'TOWER ACCOUNT','TOWER ACCOUNT PASSWORD','TOWER URL','TOWER ENDPOINT','ORACLE_WALLET_PATH','ORACLE INVENTORY','ORACLE INVENTORY ID','TOWER DOMAIN','WALLET_PASSWORD'
     )  
   ) loop
     null;
     if  c1.setting_category =    'TOWER ACCOUNT' then
       p_username := c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER ACCOUNT PASSWORD' then
       p_password := oac$ansible_utl.decrypt(c1.setting_value);
     end if;     
     if  c1.setting_category =    'TOWER URL' then
       g_tower_url:= c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER ENDPOINT' then
       g_endpoint_prefix := c1.setting_value;
     end if;
     if  c1.setting_category =    'ORACLE_WALLET_PATH' then
       g_wallet_path := c1.setting_value;
     end if;
     if  c1.setting_category =    'ORACLE INVENTORY' then
       g_default_inventory := c1.setting_value;
     end if;
     if  c1.setting_category =    'ORACLE INVENTORY ID' then
       g_default_inventory_id := c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER DOMAIN' then
       g_tower_domain := c1.setting_value;
     end if;
     if  c1.setting_category =    'WALLET_PASSWORD' then
       g_wallet_pass := oac$ansible_utl.decrypt(c1.setting_value);
     end if;

   end loop;
 
  -- Set the standard globals for this MSSQL install 
   elsif p_action = 'INIT_MSSQL' then
   for c1 in (
   select
   setting_value
   ,setting_category 
   from V_APP_SETTINGS
   where
   setting_category in (
   'TOWER ACCOUNT','TOWER ACCOUNT PASSWORD','TOWER URL','TOWER ENDPOINT','ORACLE_WALLET_PATH','MSSQL_INVENTORY','MSSQL_INVENTORY_ID','TOWER DOMAIN','WALLET_PASSWORD'
     )  
   ) loop
     null;
     if  c1.setting_category =    'TOWER ACCOUNT' then
       p_username := c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER ACCOUNT PASSWORD' then
       p_password := oac$ansible_utl.decrypt(c1.setting_value);
     end if;     
     if  c1.setting_category =    'TOWER URL' then
       g_tower_url:= c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER ENDPOINT' then
       g_endpoint_prefix := c1.setting_value;
     end if;
     if  c1.setting_category =    'ORACLE_WALLET_PATH' then
       g_wallet_path := c1.setting_value;
     end if;
     if  c1.setting_category =    'MSSQL_INVENTORY' then
       g_default_inventory := c1.setting_value;
     end if;
     if  c1.setting_category =    'MSSQL_INVENTORY_ID' then
       g_default_inventory_id := c1.setting_value;
     end if;
     if  c1.setting_category =    'TOWER DOMAIN' then
       g_tower_domain := c1.setting_value;
     end if;
     if  c1.setting_category =    'WALLET_PASSWORD' then
       g_wallet_pass := oac$ansible_utl.decrypt(c1.setting_value);
     end if;

   end loop;
 elsif p_action = 'SETPASSWORD' then
  -- Allow for command line set of Passwords in the v_APP_SETTINGS
  null;
  /*  select
   setting_value
   ,setting_category 
   from V_APP_SETTINGS
   where
   setting_category in (
   'TOWER ACCOUNT','TOWER ACCOUNT PASSWORD','TOWER URL','TOWER ENDPOINT','ORACLE_WALLET_PATH','ORACLE INVENTORY','ORACLE INVENTORY ID','TOWER DOMAIN','WALLET_PASSWORD'
     )  
  */
   if upper(p_parm1) = 'TOWER ACCOUNT PASSWORD' and p_parm2 is not null then    
      update V_APP_SETTINGS
      set setting_value = oac$ansible_utl.encrypt(p_parm2)
      where setting_category = 'TOWER ACCOUNT PASSWORD';
     dbms_output.put_line(  p_parm1 ||' Set to :'|| p_parm2);
    elsif upper(p_parm1) = 'WALLET_PASSWORD' and p_parm2 is not null then    
      update V_APP_SETTINGS
      set setting_value = oac$ansible_utl.encrypt(p_parm2)
      where setting_category = 'WALLET_PASSWORD';
      dbms_output.put_line(  p_parm1 ||' Set to :'|| p_parm2); 
    elsif upper(p_parm1) = 'TEST PASSWORD' and p_parm2 is not null then    
      update V_APP_SETTINGS
      set setting_value = oac$ansible_utl.encrypt(p_parm2)
      where setting_category = 'TEST PASSWORD';
     dbms_output.put_line(  p_parm1 ||' Set to :'|| p_parm2); 
   else
   dbms_output.put_line( 'Failed to SETPASSWORD check inputs');
   dbms_output.put_line( 'p_parm1: '||   p_parm1);
   dbms_output.put_line( 'p_parm1: '||   p_parm1);
   end if;
  elsif p_action = 'PRINT' then
     dbms_output.put_line( rpad('## V_APP_SETTINGS #',70,'#'));
     dbms_output.put_line( 'p_username: '||   p_username);
     dbms_output.put_line( 'p_password: '||   p_password);
     dbms_output.put_line( 'g_endpoint_prefix: '||   g_endpoint_prefix);
     dbms_output.put_line( 'g_default_inventory: '||   g_default_inventory);
     dbms_output.put_line( 'g_default_inventory_id: '||   g_default_inventory_id);
     dbms_output.put_line( 'g_tower_domain: '||   g_tower_domain);
     dbms_output.put_line( 'g_wallet_path: '||   g_wallet_path);
     dbms_output.put_line( 'g_wallet_pass: '||   g_wallet_pass);
     dbms_output.put_line( 'g_tower_url: '||   g_tower_url);     
     dbms_output.put_line( rpad('#',70,'#'));

/*       p_password := c1.setting_value;
       g_endpoint_prefix := c1.setting_value;
       g_default_inventory := c1.setting_value;
       g_default_inventory_id := c1.setting_value;
       g_tower_domain := c1.setting_value;
       g_wallet_path := c1.setting_value;
       g_wallet_pass := c1.setting_value;

   dbms_output.put_line( );*/
  end if ; -- Init Action

 End config;   

-- This function intake url and get the name for the playbook/workflows template.
FUNCTION get_name (
    p_template_type   IN VARCHAR2 DEFAULT g_workflow,
    p_id              IN VARCHAR2
) RETURN VARCHAR2 IS

    v_name     VARCHAR2(255);
    l_clob     CLOB;
    l_amount   NUMBER;
    l_offset   NUMBER;
    l_buffer   VARCHAR2(32767);
    l_values   apex_json.t_values;    
BEGIN
    oac$ansible_rest_utl.do_rest_call(
        p_url        => g_endpoint_prefix ||CASE
                WHEN
                    p_template_type = 'W'
                THEN
                    g_workflow_template 
                                                    --when p_template_type = 'I' then g_inventory_template
                WHEN
                    p_template_type = 'P'
                THEN
                    g_playbook_template   
                                                    --when p_template_type = g_host then g_host_template
                                                    --when p_template_type = g_group then g_group_template 
            END ||p_id ||'/',
        p_response   => l_clob
    );

    --dbms_output.put_line(' Function: ' || l_clob);
   /* apex_json.parse(
        p_values   => l_values,
        p_source   => l_clob,
        p_strict => false
    );
    v_name     := apex_json.get_varchar2(
        p_values   => l_values,
        p_path     => 'name'
    );*/
        l_amount   := 32000;
    l_offset   := 1;
    BEGIN
        LOOP
            dbms_lob.read(
                l_clob,
                l_amount,
                l_offset,
                l_buffer
            );
            apex_json.parse(l_buffer);
            v_name     := apex_json.get_varchar2(
                p_path   => 'name'
            );
            dbms_output.put_line('v_name: ' || v_name);
            l_offset   := l_offset + l_amount;
            l_amount   := 32000;
        END LOOP;
    EXCEPTION
        WHEN no_data_found THEN
            NULL;
            --dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);
    END;    
-- dbms_output.put_line('123: '||v_name);   
    RETURN v_name;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
        dbms_output.put_line('Error inside get_name Function: ' || sqlerrm);
        RETURN v_name;
END get_name;

-- This function intake url and get the name for the playbook/workflows.

FUNCTION get_name ( p_url VARCHAR2 ) RETURN VARCHAR2 IS

    v_name     VARCHAR2(255);
    l_clob     CLOB;
    l_amount   NUMBER;
    l_offset   NUMBER;
    l_buffer   VARCHAR2(32767);
    l_values   apex_json.t_values;
BEGIN
    oac$ansible_rest_utl.do_rest_call(
        p_url        => p_url,
        p_response   => l_clob
    );
    dbms_output.put_line('URL is : ' || p_url);
    dbms_output.put_line('Response  is : ' || l_clob);
    l_amount   := 32000;
    l_offset   := 1;
    dbms_output.put_line(' Function: ' || l_clob);
  /*  apex_json.parse(
        p_values   => l_values,
        p_source   => l_clob,
        p_strict => true
    );
    v_name     := apex_json.get_varchar2(
        p_values   => l_values,
        p_path     => 'name'
    );*/
    BEGIN
        LOOP
            dbms_lob.read(
                l_clob,
                l_amount,
                l_offset,
                l_buffer
            );
            apex_json.parse(l_buffer);
            v_name     := apex_json.get_varchar2(
                p_path   => 'name'
            );
            dbms_output.put_line('v_name: ' || v_name);
            l_offset   := l_offset + l_amount;
            l_amount   := 32000;
        END LOOP;
    EXCEPTION
        WHEN no_data_found THEN
            NULL;
            --dbms_output.put_line('Error inside GET_ID Function: ' || sqlerrm);
    END;    
    RETURN v_name;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside get_name Function: ' || sqlerrm);
        htp.p('Error inside get_name Function: ' || sqlerrm);
        RETURN v_name;
END get_name;

-- This procedure set the ask variable value.
PROCEDURE set_ask_variable (
    p_url    VARCHAR2,
    p_name   IN VARCHAR2,
    p_flag   IN VARCHAR DEFAULT 'true'
) IS
    l_clob   CLOB;
BEGIN
    oac$ansible_rest_utl.do_rest_call(
        p_url           => p_url,
        p_http_method   => 'PUT',
        p_body          => '{
                 "name": "' ||p_name ||'",
                 "allow_simultaneous": ' ||p_flag ||',
                 "ask_variables_on_launch": ' ||p_flag ||'
                }',
        p_response      => l_clob
    );

    dbms_output.put_line('URL is : ' || p_url);
    dbms_output.put_line('Response  is : ' || l_clob);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inside set_ask_variable : ' || sqlerrm);
END set_ask_variable;

-- initialize
BEGIN
   --Set Globals based on V_APP_SETTINGS
    config('INIT');
   -- config('PRINT');
   -- g_default_inventory_id := oac$ansible_rest_utl.get_id(g_inventory,g_default_inventory);
   -- config('PRINT');

EXCEPTION
    WHEN OTHERS THEN
        NULL;
END oac$ansible_rest_utl;

/