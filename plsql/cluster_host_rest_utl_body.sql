set define off
CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."CLUSTER_HOST_REST_UTL" is

    procedure cluster_member_ins  (
        p_id                           out number ,
        p_cluster_name                 in varchar2 default null,
        p_cluster_type                 in varchar2 default null,
        p_gi_version                   in varchar2 default null,
        p_gi_current_patchset          in varchar2 default null,
        p_host_code                    out varchar2 ,
        p_env_source                   in varchar2
    )
    is
    begin
        insert into charter2_inv.v_cluster_member_tbl (
            cluster_name,
            cluster_type,
            gi_version,
            gi_current_patchset,
            env_source
        ) values (
            p_cluster_name,
            p_cluster_type,
            p_gi_version,
            p_gi_current_patchset,
            p_env_source
        ) returning id, v_host_code into p_id,p_host_code;
    end cluster_member_ins; 
    
    
    procedure cluster_member_upd  (
        p_id                           in number,
        p_cluster_name                 in varchar2 default null,
        p_cluster_type                 in varchar2 default null,
        p_gi_version                   in varchar2 default null,
        p_gi_current_patchset          in varchar2 default null
    )
    is
    begin
        update  charter2_inv.v_cluster_member_tbl set
            cluster_name = nvl(p_cluster_name,cluster_name),
            cluster_type = nvl(p_cluster_type,cluster_type),
            gi_version =   nvl(p_gi_version,gi_version),
            gi_current_patchset = nvl(p_gi_current_patchset,gi_current_patchset)
        where id = p_id;
    end cluster_member_upd;
    
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
    )
    is
    begin
        update  charter2_inv.v_host_inv_tbl set
            --id = p_id,
            host_name = nvl(p_host_name,host_name),
            network_type = nvl(p_network_type,network_type),
            core_count = nvl(p_core_count,core_count),
            processor_config_speed = nvl(p_processor_config_speed,processor_config_speed),
            server_model = nvl(p_server_model,server_model),
            hardware_vendor = nvl(p_hardware_vendor,hardware_vendor),
            os_type_version = nvl(p_os_type_version,os_type_version),
            processor_bit = nvl(p_processor_bit,processor_bit),
            server_creation_date = nvl(p_server_creation_date,server_creation_date),
            phy_virt = nvl(p_phy_virt,phy_virt),
            dc_location = nvl(p_dc_location,dc_location),
            global_zone_solaris = nvl(p_global_zone_solaris,global_zone_solaris),
            phy_memory = nvl(p_phy_memory,phy_memory),
            server_monitoring_tool = nvl(p_server_monitoring_tool,server_monitoring_tool),
            clustered = nvl(p_clustered,clustered),
            os_type = nvl(p_os_type,os_type)
        where id = p_id;
    end host_inv_upd;    
    
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
      ) is
       p_exists  number;
    begin
      -- Not Used 
      --p_host_code := :host_code;
      --p_db_id := :db_id;
      --p_cluster_id := :cluster_id;
       -- Consolidate for both Standalone and cluster,  the gaol is this page manegers both v_host_inv_tbl and v_cluster_member
       --  If p_cluster_name is not null then lookup it up on cluster table
       if p_cluster_name is not null  then
         select max(v_host_code) into p_host_code from v_cluster_member_tbl where cluster_name = p_cluster_name ;
         if  p_host_code is null then
           p_host_code := GET_HOST_CODE('CHR');
          insert into charter2_inv.v_cluster_member_tbl (
                cluster_name,
                cluster_type,
                gi_version,
                gi_current_patchset,
                v_host_code
    
            ) values (
                p_cluster_name,
                p_cluster_type,
                p_gi_version,
                p_gi_current_patchset,
                p_host_code
            );
         end if;
       else    
        p_host_code :=  GET_HOST_CODE('CHR');
       end if;
       --    if we find a record in v_cluster_member table then grab this host code
       --    if we dont find a record in v_cluster_member then we need to insert a host records get the host code 
       --    finally do then insert a member into the cluster member table if its clustered
          -- Does the record Exist
    
          select count(*), max(ID) into p_exists,p_id from charter2_inv.v_host_inv_tbl
           where host_name = p_host_name and dc_location = p_dc_location;
          if nvl(p_exists,0) <= 0 then
    
          insert into charter2_inv.v_host_inv_tbl (
                host_name,
                network_type,
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
                clustered,
                os_type,
                env_source            
            ) values (
                p_host_name,
                p_network_type,
                p_core_count,
                p_processor_config_speed,
                p_server_model,
                p_hardware_vendor,
                p_os_type_version,
                p_processor_bit,
                p_server_creation_date,
                p_phy_virt,
                p_dc_location,
                p_global_zone_solaris,
                p_phy_memory,
                p_server_monitoring_tool,
                p_host_code,
                p_clustered,
                p_os_type,
                p_env_source
            ) returning id into p_id;
    
        end if;
    end;    

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
    )
    is
    begin
        insert into charter2_inv.v_application_details_tbl (
           -- id,                   -- We need to populate it using trigger.
            application_name,
            business_unit,
            technical_contact,
            tech_contact_email,
            app_desc,
            app_owner,
            app_owner_email,
            ref_app_id
        ) values (
          --  p_id,                 -- We need to populate it using trigger.
            p_application_name,
            p_business_unit,
            p_technical_contact,
            p_tech_contact_email,
            p_app_desc,
            p_app_owner,
            p_app_owner_email,
            p_ref_app_id
        ) returning id into p_id;
    end application_details_ins;

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
    )
    is
    begin
        update  charter2_inv.v_application_details_tbl set
            application_name   =  nvl(p_application_name,application_name),
            business_unit      =  nvl(p_business_unit,business_unit),
            technical_contact  =  nvl(p_technical_contact,technical_contact),
            tech_contact_email =  nvl(p_tech_contact_email,tech_contact_email),
            app_desc           =  nvl(p_app_desc,app_desc),
            app_owner          =  nvl(p_app_owner,app_owner),
            app_owner_email    =  nvl(p_app_owner_email,app_owner_email),
           ref_app_id          =  nvl(p_ref_app_id,ref_app_id)
        where id = p_id;
    end application_details_upd;

end "CLUSTER_HOST_REST_UTL";

/
