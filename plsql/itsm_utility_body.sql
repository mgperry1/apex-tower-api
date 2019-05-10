set define off
CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."ITSM_UTILITY" AS


  procedure LOAD_ITSM_DATA(p_action in varchar2 default 'LOAD',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
)  AS

    l_clob           CLOB;
    v_id             NUMBER;
    v_url            VARCHAR2(1000) ;
    v_status         VARCHAR2(1000);
   /* p_username       VARCHAR2(255) ;
    p_password       VARCHAR2(255) ;
    g_endpoint_prefix  VARCHAR2(1000);
    g_wallet_path    VARCHAR2(255) := 'file:/home/oracle/app/oracle/product/12.2.0/dbhome_1/user';
    g_wallet_pass    VARCHAR2(255) := 'oracle123';
    g_content_type   VARCHAR2(255) := 'application/json';
    g_itsm_url  VARCHAR2(1000); */
     l_finish       boolean          := false;
     next_url varchar2(1000);
     l_run_id number := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
     l_table_interface varchar2(255) := nvl(upper(p_parm1),'ALL');
    BEGIN
    -- Purpose:
    -- Load ITSM into Data tables so that we can use them to create LOVs and update appliction info
    -- The Procedure make Rest calls to extract and import data
    --  It takes the result sand loads them into tables, Only add records that are missing, 
    -- So  it can be called reptable in case we need to refresh Could add deletes to the tables..    
     --  https://onepointdemo.service-now.com/api/now/table/cmdb_ci_appl
     --  https://onepointdemo.service-now.com/api/now/table/sys_user
     --  https://onepointdemo.service-now.com/api/now/table/sys_user_group

     -- Get the config for the Service now install     
     config ('INIT_SNOW');
 /*    p_username :=ITSM_UTILITY.p_username;
     p_password := ITSM_UTILITY.p_password;
     g_wallet_path   := ITSM_UTILITY.g_wallet_path ;
     g_wallet_pass  := ITSM_UTILITY.g_wallet_pass;
     g_endpoint_prefix  := ITSM_UTILITY.g_endpoint_prefix;
     g_itsm_url := ITSM_UTILITY.g_itsm_url;
     --If the URl ends in / then remove it as the next URLs begin with the /
 */
     if  substr(g_itsm_url,-1) = '/' then
        g_itsm_url := substr(g_itsm_url,1,length(g_itsm_url) -1 );
     end if;   
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := g_content_type; --'application/json'; 


if p_action = 'LOAD' then

 if l_table_interface in ('ALL','CI_APPL') then
   delete from v_itsm_ci_appl; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'cmdb_ci_appl';
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

INSERT INTO v_itsm_ci_appl (
    name,
    sys_id,
    owned_by_sys_id,
    managed_by_sys_id,
    u_application_id,
    company,
    used_for,
    unverified,
    install_directory,
    install_date,
    asset_tag,
    operational_status,
    change_control_group,
    delivery_date,
    install_status,
    subcategory,
    assignment_group,
    edition,
    po_number,
    department,
    comments,
    gl_account,
    invoice_number,
    warranty_expiration,
    cost_cc,
    order_date,
    schedule,
    due,
    location,
    category,
    lease_id,
    u_vrr_rating,
    u_sciencelogic_correlation,
    u_sciencelogic_id,
    u_data_category,
    u_sciencelogic_status,
    u_data_classification,
    u_ip_netmask,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
)
select
    name,
    sys_id,
    owned_by_sys_id,
    managed_by_sys_id,
    u_application_id,
    company,
    used_for,
    unverified,
    install_directory,
    install_date,
    asset_tag,
    operational_status,
    change_control_group,
    delivery_date,
    install_status,
    subcategory,
    assignment_group,
    edition,
    po_number,
    department,
    comments,
    gl_account,
    invoice_number,
    warranty_expiration,
    cost_cc,
    order_date,
    schedule,
    due,
    location,
    category,
    lease_id,
    u_vrr_rating,
    u_sciencelogic_correlation,
    u_sciencelogic_id,
    u_data_category,
    u_sciencelogic_status,
    u_data_classification,
    u_ip_netmask,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%appl%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
     name VARCHAR2(1000) PATH 'name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , owned_by_sys_id VARCHAR2(255) PATH 'owned_by/value'
    , managed_by_sys_id VARCHAR2(255) PATH 'managed_by/value'    
    , u_application_id VARCHAR2(255) PATH 'u_application_id'
    , company VARCHAR2(255) PATH 'company'
    , used_for VARCHAR2(255) PATH 'used_for'
    , unverified VARCHAR2(255) PATH 'unverified'
    , install_directory VARCHAR2(255) PATH 'install_directory'
    , install_date VARCHAR2(255) PATH 'install_date'
    , asset_tag VARCHAR2(255) PATH 'asset_tag'
    , operational_status VARCHAR2(255) PATH 'operational_status'
    , change_control_group VARCHAR2(255) PATH 'change_control/value'
    , delivery_date VARCHAR2(255) PATH 'delivery_date'
    , install_status VARCHAR2(255) PATH 'install_status'
    , subcategory VARCHAR2(255) PATH 'subcategory'
    , assignment_group VARCHAR2(255) PATH 'assignment_group'
    , edition VARCHAR2(255) PATH 'edition'
    , po_number VARCHAR2(255) PATH 'po_number'
    , department VARCHAR2(255) PATH 'department'
    , comments VARCHAR2(255) PATH 'comments'
    , gl_account VARCHAR2(255) PATH 'gl_account'
    , invoice_number VARCHAR2(255) PATH 'invoice_number'
    , warranty_expiration VARCHAR2(255) PATH 'warranty_expiration'
    , cost_cc VARCHAR2(255) PATH 'cost_cc'
    , order_date VARCHAR2(255) PATH 'order_date'
    , schedule VARCHAR2(255) PATH 'schedule'
    , due VARCHAR2(255) PATH 'due'
    , location VARCHAR2(255) PATH 'location'
    , category VARCHAR2(255) PATH 'category'
    , lease_id VARCHAR2(255) PATH 'lease_id'
    , u_vrr_rating VARCHAR2(255) PATH 'u_vrr_rating'
    , u_sciencelogic_correlation VARCHAR2(255) PATH 'u_sciencelogic_correlation'
    , u_sciencelogic_id VARCHAR2(255) PATH 'u_sciencelogic_id'
    , u_data_category VARCHAR2(255) PATH 'u_data_category'
    , u_sciencelogic_status VARCHAR2(255) PATH 'u_sciencelogic_status'
    , u_data_classification VARCHAR2(255) PATH 'u_data_classification'
    , u_ip_netmask VARCHAR2(255) PATH 'u_ip_netmask'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    ) x
;

end if; 


 if l_table_interface in ('ALL','USER','SYS_USER_GROUP') then
  delete from v_itsm_sys_user_group; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'sys_user_group';
--https://onepointdemo.service-now.com/api/now/table/sys_user_group
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

INSERT INTO v_itsm_sys_user_group (
    sys_id,
    name,
    active,
    manager,
    company,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
) 
select
x.sys_id,
    x.name,
    x.active,
    x.manager,
    x.company,
    x.sys_created_by,
    x.sys_created_on,
    x.sys_updated_by,
    x.sys_updated_on
from
(SELECT
    request_id,
    request_type,
    call_url,
    response,
    created,
    created_by,
    updated,
    updated_by,
    body
FROM
    v_itsm_api_result
 where
 call_url like '%sys_user_group%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
    sys_id VARCHAR2(255) PATH 'sys_id'
    , name VARCHAR2(1000) PATH 'name'
    , active VARCHAR2(255) PATH 'active'
    , manager VARCHAR2(255) PATH 'manager'
    , company VARCHAR2(255) PATH 'company'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    ) x;
 end if; 
 
 
 if l_table_interface in ('ALL','USER','SYS_USER') then
  delete from v_itsm_sys_user; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'sys_user';
--https://onepointdemo.service-now.com/api/now/table/sys_user_group
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

 INSERT INTO v_itsm_sys_user (
    name,
    first_name,
    last_name,
    sys_id,
    vip,
    street,
    city,
    state,
    zip,
    active,
    mobile_phone,
    phone,
    home_phone,
    title,
    cost_center,
    employee_number,
    email,
    gender,
    user_name,
    company,
    department,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
)
select
    name,
    first_name,
    last_name,
    sys_id,
    vip,
    street,
    city,
    state,
    zip,
    active,
    mobile_phone,
    phone,
    home_phone,
    title,
    cost_center,
    employee_number,
    email,
    gender,
    user_name,
    company,
    department,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%sys_user'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
     name VARCHAR2(255) PATH 'name'
    , first_name VARCHAR2(255) PATH 'first_name'
    , last_name VARCHAR2(255) PATH 'last_name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , vip VARCHAR2(255) PATH 'vip'
    , street VARCHAR2(1000) PATH 'street'
    , city VARCHAR2(255) PATH 'city'
    , state VARCHAR2(255) PATH 'state'
    , zip VARCHAR2(255) PATH 'zip'
    , active VARCHAR2(255) PATH 'active'
    , mobile_phone VARCHAR2(255) PATH 'mobile_phone'
    , phone VARCHAR2(255) PATH 'home'
    , home_phone VARCHAR2(255) PATH 'home_phone'
    , title VARCHAR2(255) PATH 'title'
    , cost_center VARCHAR2(255) PATH 'cost_center'
    , employee_number VARCHAR2(255) PATH 'employee_number'
    , email VARCHAR2(255) PATH 'email'
    , gender VARCHAR2(255) PATH 'gender'
    , user_name VARCHAR2(255) PATH 'user_name'
    , company VARCHAR2(255) PATH 'company'
    , department VARCHAR2(255) PATH 'department'    
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    ) x
;

 end if;
 if l_table_interface in ('ALL','USER','SYS_USER_GRMEMBER') then

  delete from v_itsm_sys_user_grmember; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'sys_user_grmember';
--https://onepointdemo.service-now.com/api/now/table/sys_user_group
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

 INSERT INTO v_itsm_sys_user_grmember (
   user_sys_id
    ,group_sys_id 
    , sys_created_by
    , sys_created_on
    , sys_updated_by
    , sys_updated_on
)
select
   user_sys_id
    ,group_sys_id 
    , sys_created_by
    , sys_created_on
    , sys_updated_by
    , sys_updated_on
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%sys_user_grmember%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
    user_sys_id VARCHAR2(255) PATH 'user/value'
    ,group_sys_id VARCHAR2(255) PATH 'group/value'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    ) x
;

end if;

 if l_table_interface in ('ALL','REQUEST','SC_REQUEST') then

  delete from v_itsm_sc_request; 

  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'sc_request';
--https://onepointdemo.service-now.com/api/now/table/sc_request?sysparm_query=assignment_group=db520ed1db9763408ccd89584b961950
--  while not l_finish loop
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;
   
   INSERT INTO v_itsm_sc_request (
    name,
    sys_id,
    ticket_id,
    description,
    assignment_group,
    state,
    closed_at,
    active,
    priority,
    business_service,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    short_description,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    assigned_to,
    comments,
    approval,
    sla_due,
    comments_and_work_notes,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
) 
select
    name,
    sys_id,
    ticket_id,
    description,
    assignment_group,
    state,
    closed_at,
    active,
    priority,
    business_service,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    short_description,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    assigned_to,
    comments,
    approval,
    sla_due,
    comments_and_work_notes,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%sc_request%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
      name VARCHAR2(1000) PATH 'name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , ticket_id VARCHAR2(255) PATH 'number'
    , description clob PATH 'description'
    , assignment_group VARCHAR2(255) PATH 'assignment_group/value'
    , state VARCHAR2(255) PATH 'state'
    , closed_at VARCHAR2(255) PATH 'closed_at'
    , active VARCHAR2(255) PATH 'active'
    , priority VARCHAR2(255) PATH 'priority'
    , business_service VARCHAR2(255) PATH 'business_service'
    , opened_at VARCHAR2(255) PATH 'opened_at'
    , parent VARCHAR2(255) PATH 'parent'
    , special_instructions VARCHAR2(4000) PATH 'special_instructions'
    , work_notes clob PATH 'work_notes'
    , short_description VARCHAR2(4000) PATH 'short_description'
    , work_start VARCHAR2(255) PATH 'work_start'
    , work_notes_list VARCHAR2(255) PATH 'work_notes_list'
    , company VARCHAR2(255) PATH 'company'
    , requested_date VARCHAR2(255) PATH 'requested_date'
    , urgency VARCHAR2(255) PATH 'urgency'
    , contact_type VARCHAR2(255) PATH 'contact_type'
    , closed_by VARCHAR2(255) PATH 'closed_by'
    , close_notes VARCHAR2(255) PATH 'close_notes'
    , assigned_to VARCHAR2(255) PATH 'assigned_to'
    , comments clob PATH 'comments'
    , approval VARCHAR2(255) PATH 'approval'
    , sla_due VARCHAR2(255) PATH 'sla_due'
    , comments_and_work_notes clob PATH 'comments_and_work_notes'
    , due_date VARCHAR2(255) PATH 'due_date'
    , request_state VARCHAR2(255) PATH 'request_state'
    , stage VARCHAR2(255) PATH 'stage'
    , escalation VARCHAR2(255) PATH 'escalation'
    , upon_approval VARCHAR2(255) PATH 'upon_approval'
    , opened_by VARCHAR2(255) PATH 'opened_by/value'
    , skills VARCHAR2(255) PATH 'skills'
    , requested_for VARCHAR2(255) PATH 'requested_for/value'
    , made_sla VARCHAR2(255) PATH 'made_sla'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    , owned_by_sys_id VARCHAR2(255) PATH 'owned_by/value'
    , managed_by_sys_id VARCHAR2(255) PATH 'managed_by/value'    
    ) x;

end if;

 if l_table_interface in ('ALL','REQUEST','SC_REQ_ITEM') then

 delete from v_itsm_sc_req_item; 

  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'sc_req_item';
--https://onepointdemo.service-now.com/api/now/table/sc_request?sysparm_query=assignment_group=db520ed1db9763408ccd89584b961950
--  while not l_finish loop
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

INSERT INTO v_itsm_sc_req_item (
    name,
    sys_id,
    ticket_id,
    request_sys_id,
    short_description,
    description,
    assignment_group,
    state,
    closed_at,
    active,
    priority,
    business_service,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    assigned_to,
    comments,
    approval,
    sla_due,
    comments_and_work_notes,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
)
select
     name,
    sys_id,
    ticket_id,
    request_sys_id,
    short_description,
    description,
    assignment_group,
    state,
    closed_at,
    active,
    priority,
    business_service,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    assigned_to,
    comments,
    approval,
    sla_due,
    comments_and_work_notes,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
 from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%sc_req_item%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
      name VARCHAR2(1000) PATH 'name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , ticket_id VARCHAR2(255) PATH 'number'
    , request_sys_id VARCHAR2(255) PATH 'request/value'
    , short_description VARCHAR2(4000) PATH 'short_description'
    , description clob PATH 'description'
    , assignment_group VARCHAR2(255) PATH 'assignment_group/value'
    , state VARCHAR2(255) PATH 'state'
    , closed_at VARCHAR2(255) PATH 'closed_at'
    , active VARCHAR2(255) PATH 'active'
    , priority VARCHAR2(255) PATH 'priority'
    , business_service VARCHAR2(255) PATH 'business_service'
    , opened_at VARCHAR2(255) PATH 'opened_at'
    , parent VARCHAR2(255) PATH 'parent'
    , special_instructions VARCHAR2(4000) PATH 'special_instructions'
    , work_notes clob PATH 'work_notes'
    , work_start VARCHAR2(255) PATH 'work_start'
    , work_notes_list VARCHAR2(255) PATH 'work_notes_list'
    , company VARCHAR2(255) PATH 'company'
    , requested_date VARCHAR2(255) PATH 'requested_date'
    , urgency VARCHAR2(255) PATH 'urgency'
    , contact_type VARCHAR2(255) PATH 'contact_type'
    , closed_by VARCHAR2(255) PATH 'closed_by'
    , close_notes VARCHAR2(255) PATH 'close_notes'
    , assigned_to VARCHAR2(255) PATH 'assigned_to'
    , comments clob PATH 'comments'
    , approval VARCHAR2(255) PATH 'approval'
    , sla_due VARCHAR2(255) PATH 'sla_due'
    , comments_and_work_notes clob PATH 'comments_and_work_notes'
    , due_date VARCHAR2(255) PATH 'due_date'
    , request_state VARCHAR2(255) PATH 'request_state'
    , stage VARCHAR2(255) PATH 'stage'
    , escalation VARCHAR2(255) PATH 'escalation'
    , upon_approval VARCHAR2(255) PATH 'upon_approval'
    , opened_by VARCHAR2(255) PATH 'opened_by/value'
    , skills VARCHAR2(255) PATH 'skills'
    , requested_for VARCHAR2(255) PATH 'requested_for/value'
    , made_sla VARCHAR2(255) PATH 'made_sla'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    , owned_by_sys_id VARCHAR2(255) PATH 'owned_by/value'
    , managed_by_sys_id VARCHAR2(255) PATH 'managed_by/value'    

    ) x;

  end if;

 if l_table_interface in ('ALL','CHANGE_REQUEST') then

 delete from v_itsm_change_request; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'change_request';
--https://onepointdemo.service-now.com/api/now/table/change_request
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

INSERT INTO v_itsm_change_request (
    name,
    sys_id,
    change_id,
    description,
    test_plan,
    implementation_plan,
    change_plan,
    backout_plan,
    assignment_group,
    state,
    phase,
    impact,
    cmdb_ci_sys_id,
    closed_at,
    active,
    priority,
    production_system,
    requested_by,
    assigned_to,
    business_service,
    review_date,
    start_date,
    end_date,
    conflict_status,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    short_description,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    comments_and_work_notes,
    approval,
    sla_due,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
) select
    name,
    sys_id,
    change_id,
    description,
    test_plan,
    implementation_plan,
    change_plan,
    backout_plan,
    assignment_group,
    state,
    phase,
    impact,
    cmdb_ci_sys_id,
    closed_at,
    active,
    priority,
    production_system,
    requested_by,
    assigned_to,
    business_service,
    review_date,
    start_date,
    end_date,
    conflict_status,
    opened_at,
    parent,
    special_instructions,
    work_notes,
    short_description,
    work_start,
    work_notes_list,
    company,
    requested_date,
    urgency,
    contact_type,
    closed_by,
    close_notes,
    comments_and_work_notes,
    approval,
    sla_due,
    due_date,
    request_state,
    stage,
    escalation,
    upon_approval,
    opened_by,
    skills,
    requested_for,
    made_sla,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on,
    owned_by_sys_id,
    managed_by_sys_id
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%change_request%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
     name VARCHAR2(1000) PATH 'name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , change_id VARCHAR2(255) PATH 'number'
    , description VARCHAR2(255) PATH 'description'
    , test_plan VARCHAR2(1000) PATH 'test_plan'
    , implementation_plan VARCHAR2(1000) PATH 'implementation_plan'
    , change_plan VARCHAR2(1000) PATH 'change_plan'
    , backout_plan VARCHAR2(1000) PATH 'backout_plan'
    , assignment_group VARCHAR2(255) PATH 'assignment_group/value'
    , state VARCHAR2(255) PATH 'state'
    , phase VARCHAR2(255) PATH 'phase'
    , impact VARCHAR2(255) PATH 'impact'
    , cmdb_ci_sys_id VARCHAR2(255) PATH 'cmdb_ci/value'
    , closed_at VARCHAR2(255) PATH 'closed_at'
    , active VARCHAR2(255) PATH 'active'
    , priority VARCHAR2(255) PATH 'priority'
    , production_system VARCHAR2(255) PATH 'production_system'
    , requested_by VARCHAR2(255) PATH 'requested_by/value'
    , assigned_to VARCHAR2(255) PATH 'assigned_to/value'
    , business_service VARCHAR2(255) PATH 'business_service'
    , review_date VARCHAR2(255) PATH 'review_date'
    , start_date VARCHAR2(255) PATH 'start_date'
    , end_date VARCHAR2(255) PATH 'end_date'
    , conflict_status VARCHAR2(255) PATH 'conflict_status'
    , opened_at VARCHAR2(255) PATH 'opened_at'
    , parent VARCHAR2(255) PATH 'parent'
    , special_instructions VARCHAR2(255) PATH 'special_instructions'
    , work_notes VARCHAR2(255) PATH 'work_notes'
    , short_description VARCHAR2(255) PATH 'short_description'
    , work_start VARCHAR2(255) PATH 'work_start'
    , work_notes_list VARCHAR2(255) PATH 'work_notes_list'
    , company VARCHAR2(255) PATH 'company'
    , requested_date VARCHAR2(255) PATH 'requested_date'
    , urgency VARCHAR2(255) PATH 'urgency'
    , contact_type VARCHAR2(255) PATH 'contact_type'
    , closed_by VARCHAR2(255) PATH 'closed_by'
    , close_notes VARCHAR2(255) PATH 'close_notes'
    , comments_and_work_notes VARCHAR2(255) PATH 'comments_and_work_notes'
    , approval VARCHAR2(255) PATH 'approval'
    , sla_due VARCHAR2(255) PATH 'sla_due'
    , due_date VARCHAR2(255) PATH 'due_date'
    , request_state VARCHAR2(255) PATH 'request_state'
    , stage VARCHAR2(255) PATH 'stage'
    , escalation VARCHAR2(255) PATH 'escalation'
    , upon_approval VARCHAR2(255) PATH 'upon_approval'
    , opened_by VARCHAR2(255) PATH 'opened_by/value'
    , skills VARCHAR2(255) PATH 'skills'
    , requested_for VARCHAR2(255) PATH 'requested_for/value'
    , made_sla VARCHAR2(255) PATH 'made_sla'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    , owned_by_sys_id VARCHAR2(255) PATH 'owned_by/value'
    , managed_by_sys_id VARCHAR2(255) PATH 'managed_by/value'    
    ) x;

 end if;
 
  if l_table_interface in ('ALL','CMDB_CI') then

   delete from v_itsm_cmdb_ci; 
  l_finish  := false;
  v_url    := g_endpoint_prefix|| 'cmdb_ci';
--https://onepointdemo.service-now.com/api/now/table/change_request
--  while not l_finish loop
  
      do_rest_call (  P_URL => v_url,
       P_HTTP_METHOD => 'GET',
       P_CONTENT_TYPE => g_content_type,
       P_RUN_ID => l_run_id,
       P_RESPONSE => l_clob) ; 

   -- 
   --Added a commit for tracing
   --
   commit;

INSERT INTO v_itsm_cmdb_ci (
    name,
    sys_id,
    owned_by_sys_id,
    managed_by_sys_id,
    u_application_id,
    company,
    used_for,
    unverified,
    install_directory,
    install_date,
    asset_tag,
    operational_status,
    change_control_group,
    delivery_date,
    install_status,
    subcategory,
    assignment_group,
    edition,
    po_number,
    department,
    comments,
    gl_account,
    invoice_number,
    warranty_expiration,
    cost_cc,
    order_date,
    schedule,
    due,
    location,
    category,
    lease_id,
    ip_address,
    u_vrr_rating,
    u_sciencelogic_correlation,
    u_sciencelogic_id,
    u_data_category,
    u_sciencelogic_status,
    u_data_classification,
    u_ip_netmask,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
)
select
    name,
    sys_id,
    owned_by_sys_id,
    managed_by_sys_id,
    u_application_id,
    company,
    used_for,
    unverified,
    install_directory,
    install_date,
    asset_tag,
    operational_status,
    change_control_group,
    delivery_date,
    install_status,
    subcategory,
    assignment_group,
    edition,
    po_number,
    department,
    comments,
    gl_account,
    invoice_number,
    warranty_expiration,
    cost_cc,
    order_date,
    schedule,
    due,
    location,
    category,
    lease_id,
    ip_address,
    u_vrr_rating,
    u_sciencelogic_correlation,
    u_sciencelogic_id,
    u_data_category,
    u_sciencelogic_status,
    u_data_classification,
    u_ip_netmask,
    sys_created_by,
    sys_created_on,
    sys_updated_by,
    sys_updated_on
from
(SELECT
    response
FROM
    v_itsm_api_result
 where
 call_url like '%cmdb_ci%'
 and run_id = l_run_id
 )tp
 , XMLTABLE(
    '/json/result/row' PASSING apex_json.to_xmltype(tp.response) 
    COLUMNS 
     name VARCHAR2(1000) PATH 'name'
    ,sys_id VARCHAR2(255) PATH 'sys_id'
    , owned_by_sys_id VARCHAR2(255) PATH 'owned_by/value'
    , managed_by_sys_id VARCHAR2(255) PATH 'managed_by/value'    
    , u_application_id VARCHAR2(255) PATH 'u_application_id'
    , company VARCHAR2(255) PATH 'company'
    , used_for VARCHAR2(255) PATH 'used_for'
    , unverified VARCHAR2(255) PATH 'unverified'
    , install_directory VARCHAR2(255) PATH 'install_directory'
    , install_date VARCHAR2(255) PATH 'install_date'
    , asset_tag VARCHAR2(255) PATH 'asset_tag'
    , operational_status VARCHAR2(255) PATH 'operational_status'
    , change_control_group VARCHAR2(255) PATH 'change_control/value'
    , delivery_date VARCHAR2(255) PATH 'delivery_date'
    , install_status VARCHAR2(255) PATH 'install_status'
    , subcategory VARCHAR2(255) PATH 'subcategory'
    , assignment_group VARCHAR2(255) PATH 'assignment_group'
    , edition VARCHAR2(255) PATH 'edition'
    , po_number VARCHAR2(255) PATH 'po_number'
    , department VARCHAR2(255) PATH 'department'
    , comments VARCHAR2(255) PATH 'comments'
    , gl_account VARCHAR2(255) PATH 'gl_account'
    , invoice_number VARCHAR2(255) PATH 'invoice_number'
    , warranty_expiration VARCHAR2(255) PATH 'warranty_expiration'
    , cost_cc VARCHAR2(255) PATH 'cost_cc'
    , order_date VARCHAR2(255) PATH 'order_date'
    , schedule VARCHAR2(255) PATH 'schedule'
    , due VARCHAR2(255) PATH 'due'
    , location VARCHAR2(255) PATH 'location'
    , category VARCHAR2(255) PATH 'category'
    , lease_id VARCHAR2(255) PATH 'lease_id'
    , ip_address VARCHAR2(255) PATH 'ip_address'
    , u_vrr_rating VARCHAR2(255) PATH 'u_vrr_rating'
    , u_sciencelogic_correlation VARCHAR2(255) PATH 'u_sciencelogic_correlation'
    , u_sciencelogic_id VARCHAR2(255) PATH 'u_sciencelogic_id'
    , u_data_category VARCHAR2(255) PATH 'u_data_category'
    , u_sciencelogic_status VARCHAR2(255) PATH 'u_sciencelogic_status'
    , u_data_classification VARCHAR2(255) PATH 'u_data_classification'
    , u_ip_netmask VARCHAR2(255) PATH 'u_ip_netmask'
    , sys_created_by VARCHAR2(255) PATH 'sys_created_by'
    , sys_created_on VARCHAR2(255) PATH 'sys_created_on'
    , sys_updated_by VARCHAR2(255) PATH 'sys_updated_by'
    , sys_updated_on VARCHAR2(255) PATH 'sys_updated_on'
    ) x
;
 end if;


end if; -- p_action = 'LOAD'    


 
    end;



 
PROCEDURE do_rest_call (
    p_url            IN VARCHAR2,
    p_http_method    IN VARCHAR2 DEFAULT 'GET',
    p_content_type   IN VARCHAR2 DEFAULT g_content_type,
    p_body           IN CLOB DEFAULT NULL,
    p_run_id         IN NUMBER,
    p_response       OUT CLOB
)
    AS
BEGIN
    apex_web_service.g_request_headers(1).name    := 'Content-Type';
    apex_web_service.g_request_headers(1).value   := p_content_type;
    
    /*
    dbms_output.put_line('inside p_content_type: ' ||p_content_type);
    dbms_output.put_line('inside p_url: ' ||p_url);
    dbms_output.put_line('inside p_http_method: ' ||p_http_method);
    dbms_output.put_line('inside p_username: ' ||p_username);
    dbms_output.put_line('inside p_password: ' ||p_password);
    dbms_output.put_line('inside g_wallet_path: ' ||g_wallet_path);
    dbms_output.put_line('inside g_wallet_pass: ' ||g_wallet_pass);
    dbms_output.put_line('inside p_body: ' ||p_body);
    */

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

  INSERT INTO v_itsm_api_result (
     request_type,
     call_url,
     response,
     body,
     run_id
    ) values (
    p_http_method,
    p_url,
     p_response,
     p_body,
     p_run_id
    );
    
--EXCEPTION
--    WHEN OTHERS THEN
--        dbms_output.put_line('Error inside do_rest_call: ' ||p_url ||'' ||sqlerrm);
--        p_response   := sqlerrm;
END do_rest_call;
  

  procedure config(p_action in varchar2 default 'INIT_SNOW',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
)  AS
  BEGIN
   null;
   -- Set the standard globals for this Oracle install 
   if p_action = 'INIT_SNOW' then
   for c1 in (
   select
   setting_value
   ,setting_category 
   ,setting_name
   from V_APP_SETTINGS
   where
   setting_category in (
   'SERVICENOW.AUTH.BASIC','SERVICENOW.URL','SERVICENOW.ENDPOINT','ORACLE_WALLET_PATH','WALLET_PASSWORD'
     )  
   ) loop
     null;
     if  upper(c1.setting_name) like    '%USERNAME%' then
       p_username := c1.setting_value;
     end if;
     if c1.setting_category = 'SERVICENOW.AUTH.BASIC' and   upper(c1.setting_name) like    '%PASSWORD%' then
     -- dbms_output.put_line( 'p_password: '||  c1.setting_value);
       p_password := oac$ansible_utl.decrypt(c1.setting_value);
--       p_password := c1.setting_value;
     end if;     
     if  c1.setting_category =    'SERVICENOW.URL' then
       g_itsm_url:= c1.setting_value;
     end if;
     if  c1.setting_category =    'SERVICENOW.ENDPOINT' then
       g_endpoint_prefix := c1.setting_value;
     end if;
     if  c1.setting_category =    'ORACLE_WALLET_PATH' then
       g_wallet_path := c1.setting_value;
     end if;
 --    if  c1.setting_category =    'TOWER DOMAIN' then
 --      g_itsm_domain := c1.setting_value;
--     end if;
     if  c1.setting_category =    'WALLET_PASSWORD' then
       g_wallet_pass := oac$ansible_utl.decrypt(c1.setting_value);
     end if;

   end loop;
 
  elsif p_action = 'PRINT' then
     dbms_output.put_line( rpad('## V_APP_SETTINGS #',70,'#'));
     dbms_output.put_line( 'p_username: '||   p_username);
    -- dbms_output.put_line( 'p_password: '||   p_password);
     dbms_output.put_line( 'g_endpoint_prefix: '||   g_endpoint_prefix);
 --    dbms_output.put_line( 'g_itsm_domain: '||   g_itsm_domain);
     dbms_output.put_line( 'g_wallet_path: '||   g_wallet_path);
  --   dbms_output.put_line( 'g_wallet_pass: '||   g_wallet_pass);
     dbms_output.put_line( 'g_itsm_url: '||   g_itsm_url);     
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


  END config;


END ITSM_UTILITY;

/
