set define off 
CREATE OR REPLACE PACKAGE "CHARTER2_INV"."STANDARD_TASK_MGR" AS 

procedure task_queue(
        p_action   IN VARCHAR2 DEFAULT 'CHECK_SCHEDULE',
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);

 
procedure save_task(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);

procedure set_globals(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_page   IN VARCHAR2 DEFAULT NULL,
        p_task_key IN VARCHAR2 DEFAULT NULL,
        p_task_id IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);
 procedure     run_tower_task (   p_schedule_id in number
                                   /* , p_job_id out number,
                                      p_self_service_id out number                                      
                                 */
                                    );
--Globals
/*
G_PROJECT_ID varchar2(255);
G_APP_ID varchar2(255);
G_DC_LOCATION varchar2(255);
G_ENVIRONMENT varchar2(255);
G_DOMAIN varchar2(255); 
G_DATABASE_NAME varchar2(255);
G_CLUSTER varchar2(255);
G_DB_VERSION varchar2(255);
G_DB_HOME varchar2(255);
*/
G_HOST_LIST clob;
G_PARM_LIST clob;
G_EXTRA_VAR clob;
--G_TASK_ID number;
G_TASK_ID varchar2(255);
G_TASK_KEY varchar2(255);
G_EXECUTE_ON varchar2(255);
G_TICKET_REF varchar2(255);
g_unique_grp varchar2(255); 


/*
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
*/
/* TODO enter package declarations (types, exceptions, methods etc) here */ 

  g_workflow_template       varchar2(100) := 'workflow_job_templates/' ;
  g_playbook_template       varchar2(100) := 'job_templates/' ;
  g_host_template           varchar2(100) := 'hosts/' ;


  g_inventory_template      varchar2(100) := 'inventories/';  
  g_group_template          varchar2(100) := 'groups/';  



  g_flag                    varchar2(1)   :=  'W' ;  -- W : workflow , P : Playbook
  g_workflow                varchar2(1)   :=  'W';
  g_playbook                varchar2(1)   :=  'P';
  g_inventory               varchar2(1)   :=  'I';  
  g_group                   varchar2(1)   :=  'G';
  g_host                    varchar2(100) :=  'H';
  g_content_type            varchar2(50)  :=  'application/json' ;


 -- oac$ansible_rest_utl
  g_endpoint_prefix         varchar2(100) ;
  g_wallet_path             varchar2(100) ;
  g_wallet_pass             varchar2(50)  ;
  p_username                varchar2(50)  ;
  p_password                varchar2(50)  ;
  g_default_inventory       varchar2(50) ;
  g_default_inventory_id    number  ;
  g_tower_domain            varchar2(100);
  g_tower_url               varchar2(100);
 

END STANDARD_TASK_MGR;

/
