CREATE OR REPLACE  PACKAGE BODY "CHARTER2_INV"."STANDARD_TASK_MGR" AS


procedure task_queue(
        p_action   IN VARCHAR2 DEFAULT 'CHECK_SCHEDULE',
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
)
as
Begin
  null;
  If p_action = 'CHECK_SCHEDULE' then
  
   null;
   
    for s1 in (
    
    SELECT
    schedule_id,
    schedule_type,
    schedule_process,
    task_id,
    approval_process_id,
    approval_required,
    ticket_ref,
    unique_grp,
    req_queue_id,
    self_service_request_id,
    host_name,
    task_parms,
    request_start_time_c,
    request_start_time,
    process_start_time,
    status,
    created,
    created_by,
    updated,
    updated_by
FROM
    v_schedule_queue
    where
    status = 'OPEN'
    and nvl(request_start_time,sysdate) <= sysdate
    
    ) loop
    
      null;
     dbms_output.put_line('Executing: '||s1.schedule_process );
     dbms_output.put_line('created_by: '||s1.created_by );
     dbms_output.put_line('To Be run After: '||s1.request_start_time_c );
     
     run_tower_task(p_schedule_id => s1.schedule_id);
     
     
       
    update v_schedule_queue d
     set  d.status = 'CLOSED'
    where
      d.schedule_id = s1.schedule_id;
  
     
    end loop;
    
    
    
  end if;
  
End;


  procedure         run_tower_task (   p_schedule_id in number
                                    /* , p_job_id out number,
                                      p_self_service_id out number 
                                     */ 
                                    ) AS
                                    
 p_job_id  number ;
p_self_service_id NUMBER;
v_request_queue_id NUMBER;
v_param_json    clob;
v_response      clob;
v_job_id        number;
v_request_type  varchar2(50) := 'PROVISIONING';
--v_request_type  varchar2(50) := 'PATCHING';
--v_job_name      varchar2(50):= 'Grid-PSU-apply';

v_job_name      varchar2(50):= 'standalone-install';
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

 -- Setup for Inventory
 oac$ansible_rest_utl.config('INIT');
 dbms_output.put_line('After Init');
 g_tower_domain :=  oac$ansible_rest_utl.g_tower_domain;
 g_default_inventory_id := oac$ansible_rest_utl.g_default_inventory_id;
 --g_default_inventory_id := 26;
 dbms_output.put_line('Inventory: '||g_default_inventory_id);
    --
    --  Get a list of the tower tasks that need to be 
    --  run for the schedule
    --
        FOR c1 IN (
        SELECT
    q.schedule_detail_id,
    q.schedule_id,
    q.task_id,
    q.step_id,
    q.template_type,
    q.template_name,
    q.job_name,
    q.job_no,
    q.ticket_ref,
    q.unique_grp,
    q.extra_vars,
    q.host_name,
    q.task_parms,
    q.process_start_time,
    q.status,
    q.template_id,
    s.schedule_process,
    case
     when t.privilege_role like 'ORACLE%' then
      'ORACLE-'||replace(s.schedule_process,' ')
     when t.privilege_role like 'OPEN%' then
      'OPEN-'||replace(s.schedule_process,' ') 
     when t.privilege_role like 'MS%' then
      'MSSQL-'||replace(s.schedule_process,' ') 
    else
      'OP-'||replace(s.schedule_process,' ')
    end request_type 
FROM
    v_schedule_queue_detail q
    ,v_schedule_queue s
    ,v_schedule_task t
    WHERE
    q.schedule_id = p_schedule_id
    and q.schedule_id = s.schedule_id
    and s.task_id = t.task_id
    
    --Only Exec if Open Status and Playbook or Workflow
    and q.status = 'OPEN'
    and q.template_type in ('P','W')
        ) LOOP

 
     INSERT INTO v_request_queue (   
      template_type,
      template_name,
      job_name,
      request_type,
      ticket_ref,
      status,
      extra_vars,
     HOST_NAME
     ) VALUES (
      c1.template_type,
      c1.template_name,
      c1.job_name,
      c1.schedule_process,
      c1.ticket_ref,
      'E',
      c1.extra_vars,
      c1.host_name
    ) RETURNING ID INTO v_request_queue_id;


      v_job_name := c1.job_name;
      v_request_type := c1.request_type;
      --
      -- Set the group to the Cluster name or to the Ticket_ref
      --
       l_group_name :=  c1.unique_grp ;
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


     v_workflow_id := c1.template_id;
     v_param_json := c1.extra_vars||', "TowerPath": "/ansible"';
      --
      --  Pass back the extra vars to update the request
      --
      v_param_json := replace(v_param_json,chr(10));      

  -- Setting Ask variable true.
    begin
    v_job_name_tower := oac$ansible_rest_utl.get_name(c1.template_type,v_workflow_id);
    oac$ansible_rest_utl.set_ask_variable(oac$ansible_rest_utl.g_endpoint_prefix|| case when c1.template_type = 'W' then g_workflow_template else g_playbook_template end || v_workflow_id ||'/',v_job_name_tower,'true');
    exception
    when others then
     null;
    end; 

    -- make a rest call.

            oac$ansible_rest_utl.make_rest_call(p_flag => c1.template_type, p_id => v_workflow_id, p_param_json => v_param_json, p_response
            => v_response);

            dbms_output.put_line('v_response: ' || v_response);    

   -- parse and store response
            oac$ansible_rest_utl.parse_and_store_resp(p_request_type => v_request_type, p_job_name => v_job_name, p_ticket_ref =>
            c1.ticket_ref, p_target_name => c1.host_name, p_resp_clob => v_response, p_id => v_job_id, p_request_id => p_self_service_id
            );

            dbms_output.put_line('v_job_id: ' || v_job_id);
            dbms_output.put_line('p_schedule_id: ' || p_schedule_id);


        p_job_id := v_job_id;

     --
     --  Need the group its not passed back so update the record
     --

     --
     -- Complete the references on the various tables
     --   
        update  v_request_queue q
          set q.group_id = l_group_id
            WHERE
          q.id = v_request_queue_id;

        update V_SELF_SERVICE_STATUS s   
         set s.req_queue_id = v_request_queue_id
        where s.request_id =  p_self_service_id;
    
    update v_schedule_queue_detail d
     set REQ_QUEUE_ID = v_request_queue_id, 
	    SELF_SERVICE_REQUEST_ID = p_self_service_id ,
        GROUP_ID = l_group_id,
        JOB_NO = v_job_id ,
        STATUS = 'CLOSED'
    where
      d.schedule_detail_id = c1.schedule_detail_id;
      
    update v_schedule_queue d
     set  d.process_start_time = sysdate
    where
      d.schedule_id = c1.schedule_id;
  
END LOOP;

  END run_tower_task;


  procedure save_task(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) AS
 l_SCHEDULE_ID number;
 c number := 1;
 l_extra_vars varchar2(32000);
  BEGIN
    --  Get the Globals Setup from the Page Values
    set_globals(p_page => p_page,p_task_key =>p_task_key, p_task_id =>p_task_id, p_parm1 => p_parm1  );
    for c1 in (
    SELECT
    t.task_id,
    t.task_name,
    t.task_icon,
    t.task_type,
    t.execution_mode,
    t.description,
    t.privilege_role,
    t.approval_process_id,
    t.approval_required,
    t.job_name,
    t.show_database,
    t.show_db_home,
    t.show_dc_location,
    t.show_app_id,
    t.show_project,
    t.show_db_config,
    t.show_cluster,
    t.show_db_version,
    t.show_grid_version,
    t.show_domain,
    t.show_environment,
    t.show_schedule,
    s.step_id, 
    s.step_name,
    s.step_type,
    s.template_type,
    s.template_name,
    s.template_id,
    s.extra_vars,
    s.step_seq
FROM
    v_schedule_task t
    ,v_schedule_task_step s
   where
  -- t.task_id = G_TASK_ID
  t.task_key = G_TASK_KEY
  and t.task_id = s.task_id 
  and s.step_type = 'TOWER_TEMPLATE'
  order by s.step_seq
  )  loop 
 -- our loop gets both header and detail info about the task
 -- so we only insert the header record the first time thru the loop
 if c = 1 then 
    INSERT INTO  v_schedule_queue (
    schedule_type,
    schedule_process,
    task_id,
    approval_process_id,
    approval_required,
    ticket_ref,
    unique_grp,
  --  req_queue_id,
  --  self_service_request_id,
    host_name,
    task_parms,
    request_start_time,
   request_start_time_c,
    status
) VALUES (
    'ONLINE',
    c1.task_name,
    c1.task_id,
    c1.approval_process_id,
    c1.approval_required,
    G_ticket_ref,
    g_unique_grp,
    g_host_list,
    g_parm_list,
  to_date(G_EXECUTE_ON,'DD-MON-YYYY HH24:MI') ,
  G_EXECUTE_ON,
    'OPEN'
) returning schedule_id into l_schedule_id ;

 end if; 
    NULL;
   --
   -- Parse in the values from the Task into the place holders in the extra vars
   -- we loop thru all hthe parms in the task and replce &PARM& string with 
   --what was supplied in the call
   l_extra_vars := g_extra_var||
           '"execute_on": "'||G_EXECUTE_ON|| '",'||
           '"standard_task_id": "'||l_schedule_id|| '"'          
           
;
--   l_extra_vars := g_extra_var||
--           '"execute_on": "'||G_EXECUTE_ON|| '"'
--         ;  


   INSERT INTO v_schedule_queue_detail (
    schedule_id,
    task_id,
    step_id,
    template_type,
    template_id,
    template_name,
    job_name,
    ticket_ref,
    unique_grp,
    extra_vars,
    host_name,
    task_parms,
    status
) VALUES (
    l_schedule_id,
    c1.task_id,
    c1.step_id,
    c1.template_type,
    c1.template_id,
    c1.template_name,
    c1.job_name,
    g_ticket_ref,
    g_unique_grp,
    l_extra_vars,
    G_HOST_LIST,
    G_PARM_LIST,
    'OPEN'
);

--  if nvl(c1.show_schedule,'NO') = 'NO' then
  --   run_tower_task( p_schedule_id => l_schedule_id);
--  end if;
 end loop; 
 --
 -- Check to see if the task we just saved needs to be executed
 --
   task_queue( p_action => 'CHECK_SCHEDULE');
  if p_action = 'LICENSE_DISCOVERY' then
    --update the 
    update v_lic_discovery_schedule s
    set     current_schedule_id = l_schedule_id
    where
    lic_schedule_id = p_parm1;
  end if;
  END save_task;

procedure set_globals(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) as

G_PROJECT_ID varchar2(255);
G_APP_ID varchar2(255);
G_DC_LOCATION varchar2(255);
G_ENVIRONMENT varchar2(255);
G_DOMAIN varchar2(255); 
G_DATABASE_NAME varchar2(255);
G_CLUSTER varchar2(255);
G_DB_VERSION varchar2(255);
G_GRID_VERSION varchar2(255);
G_DB_HOME varchar2(255);
TASK_PARM1 varchar2(1000);
TASK_PARM2 varchar2(1000);
TASK_PARM3 varchar2(1000);
TASK_PARM4 varchar2(1000);
TASK_PARM5 varchar2(1000);
TASK_PARM6 varchar2(1000);
TASK_PARM7 varchar2(1000);
TASK_PARM8 varchar2(1000);
TASK_PARM9 varchar2(1000);
TASK_NAME_PARM1 varchar2(1000);
TASK_NAME_PARM2 varchar2(1000);
TASK_NAME_PARM3 varchar2(1000);
TASK_NAME_PARM4 varchar2(1000);
TASK_NAME_PARM5 varchar2(1000);
TASK_NAME_PARM6 varchar2(1000);
TASK_NAME_PARM7 varchar2(1000);
TASK_NAME_PARM8 varchar2(1000);
TASK_NAME_PARM9 varchar2(1000);

l_extra_vars varchar2(32000);
begin

select listagg(trim(c001), ',') within group (order by 1) into G_HOST_LIST from apex_collections where collection_name ='HOST_NAME_COLLECTION';


if nvl(p_page,'850') = '850' then
--Globals
null;
G_TASK_ID := v('P850_TASK_ID');
G_TASK_KEY := v('P850_TASK_KEY');


G_EXECUTE_ON := v('P850_EXECUTE_ON');
G_TICKET_REF := v('P850_TICKET_REF');
G_PROJECT_ID := v('P850_PROJECT_ID');
G_APP_ID := v('P850_APP_ID');
G_DC_LOCATION := v('P850_DC_LOCATION');
G_ENVIRONMENT := v('P850_ENVIRONMENT');
G_DOMAIN := v('P850_DOMAIN'); 
G_CLUSTER := v('P850_DOMAIN'); 
G_DATABASE_NAME := v('P850_DATABASE_NAME');
G_DB_VERSION := v('P850_DB_VERSION');
G_GRID_VERSION := v('P850_GRID_VERSION');
G_DB_HOME := v('P850_DB_HOME');

--
-- FOr each Parms there is a potential for test select or pop up, we use coalesce to filter the non-null entry
--
TASK_PARM1 := coalesce(v('P850_PARM1_T'),v('P850_PARM1_S'),v('P850_PARM1_P'));
TASK_PARM2 := coalesce(v('P850_PARM2_T'),v('P850_PARM2_S'),v('P850_PARM2_P'));
TASK_PARM3 := coalesce(v('P850_PARM3_T'),v('P850_PARM3_S'),v('P850_PARM3_P'));
TASK_PARM4 := v('P850_');
TASK_PARM5 := v('P850_');
TASK_PARM6 := v('P850_');
TASK_PARM7 := v('P850_');
TASK_PARM8 := v('P850_');
TASK_PARM9 := v('P850_');
TASK_NAME_PARM1 := v('P850_PARM1_NAME');
TASK_NAME_PARM2 := v('P850_PARM2_NAME');
TASK_NAME_PARM3 := v('P850_PARM3_NAME');
TASK_NAME_PARM4 := v('P850_');
TASK_NAME_PARM5 := v('P850_');
TASK_NAME_PARM6 := v('P850_');
TASK_NAME_PARM7 := v('P850_');
TASK_NAME_PARM8 := v('P850_');
TASK_NAME_PARM9 := v('P850_');

--Setup a json object with the parms and there values
G_PARM_LIST := '['||
--Row Parm 1
'{"parm_name" : "'||TASK_NAME_PARM1||'", "parm_value" : "'|| TASK_PARM1||'"},'||
'{"parm_name" : "'||TASK_NAME_PARM2||'", "parm_value" : "'|| TASK_PARM2||'"},'||
'{"parm_name" : "'||TASK_NAME_PARM3||'", "parm_value" : "'|| TASK_PARM3||'"}'||
']';


    g_unique_grp := g_ticket_ref||'-'||to_char(sysdate,'HH24-MI-SS');


  for c1 in (
    SELECT
    t.task_id,
    t.task_name,
    t.task_icon,
    t.task_type,
    t.execution_mode,
    t.description,
    t.privilege_role,
    t.approval_process_id,
    t.approval_required,
    t.job_name,
    t.show_database,
    t.show_db_home,
    t.show_dc_location,
    t.show_app_id,
    t.show_project,
    t.show_db_config,
    t.show_cluster,
    t.show_db_version,
    t.show_grid_version,
    t.show_domain,
    t.show_environment,
    s.step_id, 
    s.step_name,
    s.step_type,
    s.template_type,
    s.template_name,
    s.template_id,
    s.extra_vars,
    s.step_seq
FROM
    v_schedule_task t
    ,v_schedule_task_step s
   where
  -- t.task_id = G_TASK_ID
  t.task_key = G_TASK_KEY
  and t.task_id = s.task_id 
 -- and s.template_type = 'TOWER_TEMPLATE'
  order by s.step_seq
  )  loop 
 -- our loop gets both header and detail info about the task
 -- so we only insert the header record the first time thru the loop
    NULL;
   --
   -- Parse in the values from the Task into the place holders in the extra vars
   -- we loop thru all hthe parms in the task and replce &PARM& string with 
   --what was supplied in the call
   l_extra_vars := c1.extra_vars;
 for p1 in (   
    SELECT
    tp.task_parms,
    x.parm_name,
    x.parm_value,
    tp.parm_var,
    tp.parse_key
    FROM
    (
        SELECT
            G_PARM_LIST task_parms,
            p.parm_name,
            p.parm_var,
            '&'||p.parm_var||'&' parse_key
        FROM
            v_schedule_task_parms p
        WHERE
            p.task_id = c1.task_id
    ) tp,
    XMLTABLE (
                --'/json/items/row'
     '/json/row' PASSING apex_json.to_xmltype(tp.task_parms) COLUMNS parm_name VARCHAR2(255) PATH 'parm_name', parm_value VARCHAR2(1000
    ) PATH 'parm_value' ) x
    WHERE
    tp.parm_name = x.parm_name (+)  
    )  loop  
    
    l_extra_vars := replace(l_extra_vars,p1.parse_key,p1.parm_value);
    end loop;
     l_extra_vars := replace(l_extra_vars,chr(10));  
     l_extra_vars := replace(l_extra_vars,chr(13));  
   -- template we setup in the tasks defnition
   l_extra_vars := l_extra_vars ||
   	    '"host": "'       || g_unique_grp || '",'||
        '"ticket_ref": "'|| g_ticket_ref || '",'||
        '"unique_grp": "'|| g_unique_grp || '",'||
/*        '"task_area": "'||c1.job_name||'",'||
        '"task_key": "'||g_host_list||'",'||
        '"task_status": "IN-PROGESS",'||
        '"task_message": "Starting Task",'||*/
case when c1.show_db_home = 'YES' then '"db_home":'||'"'||G_DB_HOME||'",' else null  end||
case when c1.show_db_home = 'YES' then '"oracle_db_home":'||'"'||G_DB_HOME||'",' else null  end||
case when c1.show_dc_location = 'YES' then '"dc":'||'"'||G_DC_LOCATION||'",' else null  end||
case when c1.show_database = 'YES' then '"database":'||'"'||G_database_name||'",' else null  end||
case when c1.show_database = 'YES' then '"oracle_db_name":'||'"'||G_database_name||'",' else null  end||
case when c1.show_project = 'YES' then '"project_id":'||'"'||G_project_id||'",' else null  end||
case when c1.show_db_version = 'YES' then '"oracle_version":'||'"'||G_DB_VERSION||'",' else null  end||
case when c1.show_grid_version = 'YES' then '"grid_version":'||'"'||G_GRID_VERSION||'",' else null  end||
case when c1.show_cluster = 'YES' then '"cluster":'||'"'||G_CLUSTER||'",' else null  end||
case when c1.show_domain = 'YES' then '"domain":'||'"'||G_DOMAIN||'",' else null  end||
case when c1.show_environment = 'YES' then '"env":'||'"'||G_ENVIRONMENT||'",' else null  end||
case when c1.show_app_id = 'YES' then '"app_id":'||'"'||G_APP_ID||'",' else null  end

        ;		
       /* 
     Not done yet  
    t.show_db_config,
   
   */


end loop;

G_EXTRA_VAR := l_extra_vars;

elsif nvl(p_page,'26') = '26' then
--Globals
null;
--
-- Task for Provision OPen Source DB

SELECT TASK_ID, TASK_KEY INTO 
G_TASK_ID 
,G_TASK_KEY
FROM
V_SCHEDULE_TASK
where
task_key = P_TASK_KEY;

G_EXECUTE_ON := to_char(sysdate ,'DD-MON-YYYY HH24:MI');
G_TICKET_REF := v('P26_TICKET_REF');
G_PROJECT_ID := v('P26_PROJECT_ID');
G_APP_ID := v('P26_APP_ID');
G_DC_LOCATION := v('P26_DC_LOCATION');
G_ENVIRONMENT := v('P26_ENVIRONMENT');
G_DOMAIN := v('P26_DOMAIN'); 
G_DATABASE_NAME := v('P26_DATABASE_NAME');
--G_GRID_VERSION := v('P850_GRID_VERSION');
--G_DB_HOME := v('P850_DB_HOME');

--
-- FOr each Parms there is a potential for test select or pop up, we use coalesce to filter the non-null entry
--
TASK_PARM1 := v('P26_DATABASE_VENDOR');
TASK_PARM2 := v('P26_DATABASE_VERSION');
TASK_PARM3 := v('P26_DATABASE_ENGINE');
TASK_NAME_PARM1 := 'Database Vendor';
TASK_NAME_PARM2 := 'Database Version';
TASK_NAME_PARM3 := 'Database Engine';

--Setup a json object with the parms and there values
G_PARM_LIST := '['||
--Row Parm 1
'{"parm_name" : "'||TASK_NAME_PARM1||'", "parm_value" : "'|| TASK_PARM1||'"},'||
'{"parm_name" : "'||TASK_NAME_PARM2||'", "parm_value" : "'|| TASK_PARM2||'"},'||
'{"parm_name" : "'||TASK_NAME_PARM3||'", "parm_value" : "'|| TASK_PARM3||'"}'||
']';



   g_unique_grp := g_ticket_ref||'-'||to_char(sysdate,'HH24-MI-SS');
   l_extra_vars := l_extra_vars ||
   	    '"host": "'       || g_unique_grp || '",'||
        '"ticket_ref": "'|| g_ticket_ref || '",'||
        '"unique_grp": "'|| g_unique_grp || '",'||
        p_parm1;

  l_extra_vars := replace(l_extra_vars,chr(10));  
  l_extra_vars := replace(l_extra_vars,chr(13)); 
     
  G_EXTRA_VAR := l_extra_vars;
elsif nvl(p_page,'26') = '2250' then
--Globals
null;
--
-- Task for Provision OPen Source DB

SELECT TASK_ID
, TASK_KEY 
INTO 
G_TASK_ID 
,G_TASK_KEY
FROM
V_SCHEDULE_TASK
where
task_key = 'LOAD_DB_FEATURE';

--
-- Have to get the host list from the saved record
--  We use License_mgr.check_schedule to reschedule which doesnt have the collection
--setup
SELECT
    replace(schedule_name,' ','-')||'-'||execute_interval,
    to_char(schedule_start_date,'DD-MON-RRRR HH24:MI'),
    host_name
    into
    G_TICKET_REF,
    G_EXECUTE_ON,
    G_HOST_LIST
  from v_lic_discovery_schedule 
 where lic_schedule_id = P_PARM1;



--G_GRID_VERSION := v('P850_GRID_VERSION');
--G_DB_HOME := v('P850_DB_HOME');

--
-- FOr each Parms there is a potential for test select or pop up, we use coalesce to filter the non-null entry
--

--Setup a json object with the parms and there values
G_PARM_LIST := '['||
--Row Parm 1
'{"parm_name" : "schedule_name", "parm_value" : "'|| G_TICKET_REF||'"}'||
']';



   g_unique_grp := g_ticket_ref||'-'||to_char(sysdate,'HH24-MI-SS');
   l_extra_vars := l_extra_vars ||
   	    '"host": "'       || g_unique_grp || '",'||
        '"ticket_ref": "'|| g_ticket_ref || '",'||
        '"unique_grp": "'|| g_unique_grp || '",'
        ;

  l_extra_vars := replace(l_extra_vars,chr(10));  
  l_extra_vars := replace(l_extra_vars,chr(13)); 
     
  G_EXTRA_VAR := l_extra_vars;
  
  
end if;


end;


END STANDARD_TASK_MGR;

/
