set fine off
CREATE OR REPLACE EDITIONABLE PACKAGE "CHARTER2_INV"."CLUSTER_HOST_REST_UTL" as
/*
    -- Purpose: Holding ORDS REST Call API supporting objects for cluster, host application details.
    -- Created On: 12 FEB 2019     
*/

    -- cluster member tbl insert
    procedure cluster_member_ins  (
        p_id                           out number ,
        p_cluster_name                 in varchar2 default null,
        p_cluster_type                 in varchar2 default null,
        p_gi_version                   in varchar2 default null,
        p_gi_current_patchset          in varchar2 default null,
        p_host_code                    out varchar2 ,
        p_env_source                   in varchar2
    );
    
    -- cluster member tbl update
    procedure cluster_member_upd  (
        p_id                           in number,
        p_cluster_name                 in varchar2 default null,
        p_cluster_type                 in varchar2 default null,
        p_gi_version                   in varchar2 default null,
        p_gi_current_patchset          in varchar2 default null
    );
    
    -- host inventory update
    procedure host_inv_upd (
        p_id                           in number,
        p_host_name                    in varchar2 default null,
        p_network_type                 in varchar2 default null,
        p_core_count                   in number default null,
        p_processor_config_speed       in varchar2 default null,
        p_server_model                 in varchar2 default null,
        p_hardware_vendor              in varchar2 default null,
        p_os_type_version              in varchar2 default null,
        p_processor_bit                in varchar2 default null,
        p_server_creation_date         in varchar2 default null,
        p_phy_virt                     in varchar2 default null,
        p_dc_location                  in varchar2 default null,
        p_global_zone_solaris          in varchar2 default null,
        p_phy_memory                   in varchar2 default null,
        p_server_monitoring_tool       in varchar2 default null,
        p_clustered	                   in varchar2 default null,
        p_os_type	                   in varchar2 default null           
    );
    
    -- host inventory insert.
    procedure host_inv_ins (
      p_host_name in varchar2,
      p_network_type in varchar2,
      p_core_count in number,
      p_processor_config_speed in varchar2,
      p_server_model in varchar2,
      p_hardware_vendor in varchar2,
      p_os_type_version in varchar2,
      p_processor_bit in varchar2,
      p_server_creation_date in varchar2,
      p_phy_virt in varchar2,
      p_dc_location in varchar2,
      p_global_zone_solaris in varchar2,
      p_phy_memory in varchar2,
      p_server_monitoring_tool in varchar2,
      p_db_id in number,
      p_cluster_id in number,
      p_clustered in varchar2,
      p_cluster_name in varchar2,
      p_os_type in varchar2,
      p_env_source in varchar2,
      p_cluster_type in varchar2,
      p_gi_version in varchar2,
      p_gi_current_patchset in varchar2,
      p_id out number,
      p_host_code out VARCHAR2
      ) ;
      
    procedure application_details_ins  (
        p_id                           out number ,
        p_application_name             in varchar2 default null,
        p_business_unit                in varchar2 default null,
        p_technical_contact            in varchar2 default null,
        p_tech_contact_email           in varchar2 default null,
        p_app_desc                     in varchar2 default null,
        p_app_owner                    in varchar2 default null,
        p_app_owner_email              in varchar2 default null,
        p_ref_app_id                   in  varchar2 default null
    );
    
    procedure application_details_upd  (
        p_id                           in number ,
        p_application_name             in varchar2 default null,
        p_business_unit                in varchar2 default null,
        p_technical_contact            in varchar2 default null,
        p_tech_contact_email           in varchar2 default null,
        p_app_desc                     in varchar2 default null,
        p_app_owner                    in varchar2 default null,
        p_app_owner_email              in varchar2 default null,
        p_ref_app_id                   in varchar2 default null
    );    
    
end;

/
