set define off
CREATE OR REPLACE PACKAGE "CHARTER2_INV"."OAC$ANSIBLE_REST_UTL" AS 

/**
-----------------------------------------------------------------------------------------------------------------------------
  This package contains the utility functions and procedure to call the Ansible Tower web service.
  Author: Jaydipsinh Raulji
  www.oracleapexconsultant.com
-----------------------------------------------------------------------------------------------------------------------------
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

 /* g_endpoint_prefix         varchar2(100) := 'https://tower.techlab.com/api/v2/' ;
  g_wallet_path             varchar2(100) := 'file:/home/oracle/app/oracle/product/12.2.0/dbhome_1/user';
  g_wallet_pass             varchar2(50)  := 'oracle123';
  p_username                varchar2(50)  :=  'apex' ;
  p_password                varchar2(50)  :=  'apex1234';--'0rac!3' ;
  g_default_inventory       varchar2(50) := 'charter-oracle-inventory';
  g_default_inventory_id    number  := 24;
  g_tower_domain            varchar2(100):= '.techlab.com';
  */

  g_endpoint_prefix         varchar2(100) ;
  g_wallet_path             varchar2(100) ;
  g_wallet_pass             varchar2(50)  ;
  p_username                varchar2(50)  ;
  p_password                varchar2(50)  ;
  g_default_inventory       varchar2(50) ;
  g_default_inventory_id    number  ;
  g_tower_domain            varchar2(100);
  g_tower_url               varchar2(100);

--   function make_rest_call();
-- this procedure intakes the required parameters and make request call to tower api and return back with valid response.
 procedure make_rest_call   (p_flag in varchar2 default g_flag
                            ,p_id in number
                            ,p_param_json in varchar2
                            --,p_job_id out number
                            ,p_response out clob);

    /*
    author: Jaydipsinh Raulji
    */
    PROCEDURE do_rest_call (
        p_url            IN VARCHAR2,
        p_http_method    IN VARCHAR2 DEFAULT 'GET',
        p_content_type   IN VARCHAR2 DEFAULT g_content_type,
        p_body           IN CLOB DEFAULT NULL,
        p_response       OUT CLOB
    );
-- this procedure intake the returned response from above call & other required parameter, then do parsing & log the response to the table.
procedure parse_and_store_resp (p_request_type in varchar2, -- e.g. provisioning
                                p_job_name in varchar2,     -- e.g. oracleprechecks
                                p_ticket_ref in varchar2,   -- e.g. 
                                p_target_name in varchar2,  -- e.g. this can be cluster name when cluster type or host name when host/standalone req. made
                                p_resp_clob in clob,
                                p_id out number,
                                p_request_id out number) ;

-- this the procedure we need to call from the cluster workflow page process.                                
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
                                    );   

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
                                    );


-- this the procedure we need to call from the cluster workflow page process.                                
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
                                    );   

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
                                    );


-- this procedure add host to the given inventory.
procedure add_host (p_inventory_id in number default g_default_inventory_id, p_host_name in varchar2,p_response out clob);

procedure add_group (p_inventory_id in number default g_default_inventory_id, p_group_name in varchar2,p_response out clob);

procedure delete_group (p_group_id in number, p_response out clob);

/**
author: Jaydipsinh Raulji
Purpose: Delete the given host from the tower inventory.
*/
procedure delete_host (p_host_id in number, p_response out clob) ;

/**
--author: Jaydipsinh Raulji
Purpose: Addding/Association of the existing hosts to the given group.
*/
PROCEDURE add_host_to_group (
    p_group_id   IN NUMBER,
    p_host_id    IN NUMBER,
    p_response   OUT CLOB
);

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
);

-- This function intake url and get the id for the playbook/workflows.
function get_id ( p_url VARCHAR2 ) RETURN NUMBER ; 

-- this function intake type - workflow or playbook & name of the same and return ID.
FUNCTION get_id ( p_workflow_playbook in varchar2 default g_workflow , p_name in VARCHAR2 ) RETURN NUMBER ;

FUNCTION get_playbook_id ( p_name IN VARCHAR2 ) RETURN NUMBER;

FUNCTION get_workflow_id ( p_name IN VARCHAR2 ) RETURN NUMBER;

FUNCTION get_workflow_id_old ( p_name IN VARCHAR2 ) RETURN NUMBER;


FUNCTION get_inventory_id ( p_name IN VARCHAR2 DEFAULT g_default_inventory ) RETURN NUMBER;

FUNCTION get_host_id ( p_name IN VARCHAR2 ) RETURN NUMBER;

FUNCTION get_group_id ( p_name IN VARCHAR2 ) RETURN NUMBER;


-- **********  Procedure for Oracle Precheck  **********

procedure do_oracle_precheck_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );


-- **********  Procedure Oracle - Run Cluster Verify  **********

procedure do_oracle_run_cluster_verify_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );


-- **********  Procedure for Oracle - Install 12c Grid Standalone  **********  

procedure do_oracle_install_12c_grid_standalone_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );


-- **********  Procedure for Oracle - Install 12c Database  **********

procedure do_oracle_install_12c_database_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
									  p_rac_install in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );


-- **********  Procedure for Oracle upgrade from 11g  to 12c database  **********

procedure do_oracle_upgrade_from_11g_to_12c_database_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_oracle_db_home in varchar2,
									  p_oracle_db_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );        


-- **********  Procedure for Oracle - Create DB Instance  **********

procedure do_oracle_create_db_instance_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_oracle_db_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );                


-- **********  Procedure for Oracle - Install 12c Grid Cluster  **********

procedure do_oracle_install_12c_grid_cluster_rest (  p_host_name in varchar2,
                                      p_ticket_ref in varchar2,
									  p_env_source in  varchar2,
                                      p_dc_location in varchar2,
                                      p_cluster_name in varchar2,

                                      p_job_id out number,
                                      p_request_id out number
                                    );           


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
                                    );        


-- **********  Procedure for RDBMS-PSU-apply  **********

procedure do_psu_apply_rest (       P_PATCH_REQUEST_ID in number,
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
                                    );        


-- **********  Procedure for Get Playbook  call when press REFRESH Button  **********

procedure get_playbook (  p_endpoint in varchar2,

                                      p_job_id out number,
									  p_url out varchar2,
									  p_job_status out varchar2,
									  p_stdout out varchar2,
									  p_response out varchar2
                                    );    


-- **********  Procedure for inserting data in REQUEST_QUEUE table (cluster and standalone detail) *************

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
                                    --  p_env_category in varchar2,
                                      p_storage_type in varchar2,
                                      p_db_monitoring_tool in varchar2,
                                      p_appliance in varchar2,
                                      p_pci_required in varchar2,
                                      p_sox_required in varchar2,
                                      p_encryption_required in varchar2,
                                      p_backup_enabled in varchar2,
                                      p_monitoring in varchar2
                                 );*/
                                 -- **********  Config **********                                 
-- p_action INIT - Set the  package globals from the table                                 
procedure config(p_action in varchar2 default 'INIT',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
) ;          

function setup_oracle_patch_vars(
 p_patch_file in varchar2
) return varchar2;

-- This function intake url and get the name for the playbook/workflows template.
FUNCTION get_name ( p_url VARCHAR2 ) RETURN VARCHAR2;

-- This function intake url and get the name for the playbook/workflows template.
FUNCTION get_name (
    p_template_type   IN VARCHAR2 DEFAULT g_workflow,
    p_id              IN VARCHAR2
) RETURN VARCHAR2;

-- This procedure set the ask variable value.
PROCEDURE set_ask_variable (
    p_url    VARCHAR2,
    p_name   IN VARCHAR2,
    p_flag   IN VARCHAR DEFAULT 'true'
);

END OAC$ANSIBLE_REST_UTL;

/
