set define off
CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."LICENSE_MGR" AS

  procedure Load_license_data(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) AS
   l_baseline number;
  BEGIN
   --grab the active basline
   select max(baseline_id) into l_baseline from v_lic_baseline where status = 'Active';
  
  if p_action = 'DEMODATA' then
   --  select max(baseline_id) into l_baseline from v_lic_baseline where baseline_name = 'Demo License Pool';
   --
   -- 2 Baselines are setup with compare_key of COMP1 and COMP2, We load 2 sets of Lic Data so we can Compare
   -- Populate the temp_list_map the Dbs in temp_list_map_comp1
   -- load the demo data
   -- Populate the temp_list_map the Dbs in temp_list_map_comp1
    --if 1 = 2 then
    --Load COMP1 Demo Data
    select max(baseline_id) into l_baseline from v_lic_baseline where compare_key = 'COMP1';
    delete from temp_list_map ;
    insert into temp_list_map select * from temp_list_map_comp1;
    demo_data(p_baseline => l_baseline );
    --end if;
    --Load COMP2 Demo Data
    select max(baseline_id) into l_baseline from v_lic_baseline where compare_key = 'COMP2';
    delete from temp_list_map ;
    insert into temp_list_map select * from temp_list_map_comp2;
    demo_data(p_baseline => l_baseline );
    commit;
  elsif p_action = 'LOAD_JSON' then   
    -- Called from APex 
    load_json(
        p_action  => p_action ,
        p_baseline => p_baseline,
        p_host => p_host,
        p_parm1 => p_parm1,
        p_parm2 => p_parm2,
        p_debug  => p_debug);
        
        
  end if;
 


  
  END Load_license_data;
  
  procedure demo_data(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,      
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) as

begin
 null;
 delete from v_lic_db_inventory where baseline_id = p_baseline;
 delete from v_lic_host_inv where baseline_id = p_baseline;
 delete from v_lic_feature_usage where baseline_id = p_baseline;
 delete from v_lic_product_usage where baseline_id = p_baseline;
 --
 --Map data from demo hosts to charter hosts
 --
for c1 in (

SELECT
    invid,
    database_name,
    database_role,
    oracle_version,
    v_host_code,
    host_name,
    usageid,
    db_name,
    host
FROM
    temp_list_map
union
SELECT
    invid,
    database_name,
    database_role,
    oracle_version,
    v_host_code,
    host_name,
    usageid,
    db_name,
    host
FROM
TEMP_LIST_MAP_EXADATA
) loop
-- Load v_lic_db_inventory

INSERT INTO v_lic_db_inventory (
    baseline_id,
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
    db_home,
    sw_csi,
    ref_app_id
)
select
    p_baseline,
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
    db_home,
    sw_csi,
    ref_app_id
 from v_db_inventory i
 where
 i.database_name = c1.database_name
 and i.database_role = c1.database_role
 and not exists
 (
 select 1 from v_lic_db_inventory l where 
 i.database_name = l.database_name 
 and i.database_role = l.database_role
 and l.baseline_id = p_baseline
 );   

INSERT INTO v_lic_product_usage (
    baseline_id,
    host_name,
    instance_name,
    database_name,
    open_mode,
    database_role,
    dbcreated,
    dbid,
    version,
    banner,
    gid,
    con_id,
    con_name,
    product,
    usage,
    last_sample_date,
    first_usage_date,
    last_usage_date
) 
SELECT
    p_baseline,
    c1.host_name,
    c1.database_name,
    c1.database_name,
    open_mode,
    c1.database_role,
    created,
    dbid,
    version,
    banner,
    gid,
    con_id,
    con_name,
    product,
    usage,
    last_sample_date,
    first_usage_date,
    last_usage_date
FROM
    v_license_product_usage i
where
i.database_name = c1.db_name; 


INSERT INTO v_lic_feature_usage (
    baseline_id,
    host_name,
    instance_name,
    database_name,
    open_mode,
    database_role,
    dbcreated,
    dbid,
    version,
    banner,
    product,
    feature_being_used,
    usage,
    last_sample_date,
    detected_usages,
    total_samples,
    currently_used,
    first_usage_date,
    last_usage_date,
    extra_feature_info
)
SELECT
    p_baseline,
    c1.host_name,
    c1.database_name,
    c1.database_name,
    open_mode,
    c1.database_role,
    created,
    dbid,
    version,
    banner,
    product,
    feature_being_used,
    usage,
    last_sample_date,
    detected_usages,
    total_samples,
    currently_used,
    first_usage_date,
    last_usage_date,
    extra_feature_info
FROM
    v_license_feature_usage i
where
i.database_name = c1.db_name; 

-- Load V_LIC_HOST_INV
INSERT INTO v_lic_host_inv (
    baseline_id,
    host_name,
    network_type,
    lic_core,
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
    db_id,
    cluster_id,
    clustered,
    os_type,
    env_source,
    hw_csi
    ) 
    select
    P_baseline,
    host_name,
    network_type,
    core_count,
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
    db_id,
    cluster_id,
    clustered,
    os_type,
    env_source,
    hw_csi
   from v_host_inv_tbl i
   where
   host_code = c1.v_host_code
 and not exists
 (
 select 1 from v_lic_host_inv l where 
 i.host_code = l.host_code
 and i.host_name = l.host_name
  and l.baseline_id = p_baseline
 );   
-- Load V_LIC_DB_INVENTORY
 
end loop;
end ;

 procedure load_json(
        p_action   IN VARCHAR2 DEFAULT NULL,
          p_baseline in NUMBER default null,      
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) as
 date_mask varchar2(255) := 'DD-MON-YYYY HH24:MI:SS';
 l_host_code varchar2(255);
 l_database_id number;
 l_sqlerrm varchar2(4000);
begin
 null;
 /*
 V_LIC_BASELINE_JSONLOAD
 */
 
null;
/*
 delete from v_lic_db_inventory where baseline_id = p_baseline;
 delete from v_lic_host_inv where baseline_id = p_baseline;
 delete from v_lic_feature_usage where baseline_id = p_baseline;
 delete from v_lic_product_usage where baseline_id = p_baseline;
*/
 --
 --Map data from demo hosts to charter hosts
 --
for c1 in (

SELECT
STATUS_ID,
host_name,
    database_name,
    max(version) database_version,
    max(p.database_name) database_role,
    max(record_created) last_collected
    
FROM
    v_lic_jsonload_product_vw p
where
 record_created >= trunc(sysdate)  - nvl(p_parm1,'30')
--
--Only load records that we have not already loaded into this baseline
--
and not exists (
select 1
   from V_LIC_BASELINE_JSONLOAD j
 where   
   BASELINE_ID  = p_baseline
 and   j.STATUS_ID = p.STATUS_ID

) 
group by
STATUS_ID,
host_name,
    database_name
) loop

--
-- Insert a record into the tracking table for license uploads from JSON
--
INSERT INTO v_lic_baseline_jsonload (
    baseline_id,
    status_id,
    database_name,
    host_name

) VALUES (
p_baseline
,c1.status_id
,c1.database_name
,c1.host_name
);


-- Delete Previous upload in this baseline
-- delete from v_lic_host_inv where baseline_id = p_baseline
-- and host_name = c1.host_name
-- ;

-- Load V_LIC_HOST_INV
INSERT INTO v_lic_host_inv (
    baseline_id,
    host_name,
    network_type,
    lic_core,
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
    db_id,
    cluster_id,
    clustered,
    os_type,
    env_source,
    hw_csi
    ) 
    select
    P_baseline,
    host_name,
    network_type,
    core_count,
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
    db_id,
    cluster_id,
    clustered,
    os_type,
    env_source,
    hw_csi
   from v_host_inv_tbl i
   where
   host_name = c1.host_name
 and not exists
 (
 select 1 from v_lic_host_inv l where 
 i.host_code = l.host_code
 and i.host_name = l.host_name
  and l.baseline_id = p_baseline
 );   

-- Check that the host was created
select
max(host_code) into
l_host_code
 from v_lic_host_inv i
   where
   host_name = c1.host_name ;
--
-- If we didnt find the HOST in Inventory Add something
--
if l_host_code is null  then
-- Load v_lic_db_inventory
l_host_code := GET_HOST_CODE;
INSERT INTO v_lic_host_inv (
    baseline_id,
    host_name,
    host_code,
    lic_core,
    core_count
     
) values (
p_baseline
,c1.host_name
,l_host_code
,1
,1
)
;   

end if;


 
 
 --Cleanup the database and license sturtures for the DB
 delete from v_lic_db_inventory where baseline_id = p_baseline and database_name = c1.database_name;
 delete from v_lic_feature_usage where baseline_id = p_baseline and database_name = c1.database_name;
 delete from v_lic_product_usage where baseline_id = p_baseline and database_name = c1.database_name;

-- Load v_lic_db_inventory
INSERT INTO v_lic_db_inventory (
    baseline_id,
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
    db_home,
    sw_csi,
    ref_app_id
)
select
    p_baseline,
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
    db_home,
    sw_csi,
    ref_app_id
 from v_db_inventory i
 where
 i.database_name = c1.database_name
 --and i.database_role = c1.database_role
 and not exists
 (
 select 1 from v_lic_db_inventory l where 
 i.database_name = l.database_name 
 and i.database_role = l.database_role
 and l.baseline_id = p_baseline
 );   

--Check that the DB exists
select
max(database_id ) into
l_database_id
 from v_lic_db_inventory i
 where
 i.database_name = c1.database_name
;
--
-- If we didnt find the DB in Inventory Add something
--
if l_database_id is null  then
-- Load v_lic_db_inventory
INSERT INTO  v_lic_db_inventory (
    baseline_id,
    database_name,
    database_role,
    oracle_version,
    v_host_code,
    comments
) values (
p_baseline
,c1.database_name
,c1.database_role
,c1.database_version
,l_host_code
,'Unregistred Database on '||c1.host_name
 );   

end if;

begin

INSERT INTO v_lic_product_usage (
    baseline_id,
    host_name,
    instance_name,
    database_name,
    open_mode,
    database_role,
    dbcreated,
    dbid,
    version,
    banner,
    gid,
    con_id,
    con_name,
    product,
    usage,
    last_sample_date,
    first_usage_date,
    last_usage_date
) 
SELECT
    p_baseline,
    host_name,
    database_name,
    database_name,
    open_mode,
    database_role,
    created,
    dbid,
    version,
    banner,
    gid,
    con_id,
    con_name,
    product,
    usage,
    to_date(last_sample_date,date_mask),
    to_date(first_usage_date,date_mask),
    to_date(last_usage_date,date_mask)
FROM
    --v_license_product_usage i
    v_lic_jsonload_product_vw i
where
i.database_name = c1.database_name; 

exception
when others then
 if p_debug = 'Y' then
 l_sqlerrm := sqlerrm;
   dbms_output.put_line(substr(l_sqlerrm,255)|| ' on Insert v_lic_product_usage'  );
 end if;

end;

Begin
INSERT INTO v_lic_feature_usage (
    baseline_id,
    host_name,
    instance_name,
    database_name,
    open_mode,
    database_role,
    dbcreated,
    dbid,
    version,
    banner,
    product,
    feature_being_used,
    usage,
    last_sample_date,
    detected_usages,
    total_samples,
    currently_used,
    first_usage_date,
    last_usage_date,
    extra_feature_info
)
SELECT
    p_baseline,
    host_name,
    database_name,
    database_name,
    open_mode,
    database_role,
    created,
    dbid,
    version,
    banner,
    product,
    feature_being_used,
    usage,
    to_date(last_sample_date,date_mask),
    detected_usages,
    total_samples,
    currently_used,
    to_date(first_usage_date,date_mask),
    to_date(last_usage_date,date_mask),
    extra_feature_info
FROM
    v_lic_jsonload_feature_vw i
where
i.database_name = c1.database_name
; 

exception
when others then
 if p_debug = 'Y' then
 l_sqlerrm := sqlerrm;
   dbms_output.put_line(substr(l_sqlerrm,255)|| ' on Insert v_lic_feature_usage'  );
 end if;

end;
 
end loop;
 
end ;

procedure check_schedule(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
) as
l_start_on date;
l_plus_days number := 7;
begin
  null;
  --
  -- Look at the discovery schedule 
  -- 1) Reschedule any schedules that have executed
  -- 2) Update the Stats
 for c1 in (
 SELECT
    lic_schedule_id,
    schedule_name,
    schedule_type,
    ticket_ref,
    host_name,
    filter_parms,
    execute_interval,
    schedule_start_date,
    schedule_start_hr,
    last_run_time ,
    current_run_time ,
    number_of_runs,
    current_schedule_id,
    last_schedule_id,
    status
FROM
    v_lic_discovery_schedule_vw
  where
  status = 'Active'
  and execute_interval in ('DAILY','WEEKLY','MONTHLY','QUARTERLY')
  and current_run_time <= sysdate
 ) loop
 -- For all Active schedules
 -- That have executed, need to look at there execution interval
 -- re-schedule the based on there execute_interval
   null;
   
 if c1.execute_interval = 'DAILY' then
  l_plus_days := 1;
 elsif  c1.execute_interval = 'DAILY' then
  l_plus_days := 7;
 elsif  c1.execute_interval = 'MONTHLY' then
  l_plus_days := 30;
 elsif  c1.execute_interval = 'QUARTERLY' then
  l_plus_days := 90;
 end if;
 --Setup for next run
 l_start_on := c1.schedule_start_date + l_plus_days;
  update  v_lic_discovery_schedule 
    set   schedule_start_date = l_start_on,
   last_schedule_id = current_schedule_id  ,
    number_of_runs = nvl(number_of_runs,0) + 1
 where
 lic_schedule_id = c1.lic_schedule_id ;
 
  STANDARD_TASK_MGR.save_task(
        p_action =>   'LICENSE_DISCOVERY',
        p_page  =>  '2250',
        p_parm1  => c1.lic_schedule_id
  );

 
 end loop;
  
  
end ;


END LICENSE_MGR;

/
