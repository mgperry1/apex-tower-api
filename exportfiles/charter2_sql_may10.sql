--------------------------------------------------------
--  File created - Friday-May-10-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence V_HISTORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHARTER2_SQL"."V_HISTORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence V_REQUIREMENTS_SAMPLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHARTER2_SQL"."V_REQUIREMENTS_SAMPLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table DATABASEINFO
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."DATABASEINFO" 
   (	"SERVERNAME" VARCHAR2(128 BYTE), 
	"INSTANCENAME" VARCHAR2(128 BYTE), 
	"DBNAME" VARCHAR2(128 BYTE), 
	"DBSTATUS" VARCHAR2(20 BYTE), 
	"DBOWNER" VARCHAR2(128 BYTE), 
	"DBCREATEDATE" DATE, 
	"DBSIZEINMB" NUMBER(10,2), 
	"DBSPACEAVAILABLEINMB" NUMBER(10,2), 
	"DBUSEDSPACEINMB" NUMBER(10,2), 
	"DBPCTFREESPACE" VARCHAR2(10 BYTE), 
	"DBDATASPACEUSAGEINMB" NUMBER(10,2), 
	"DBINDEXSPACEUSAGEINMB" NUMBER(10,2), 
	"ACTIVECONNECTIONS" NUMBER(*,0), 
	"COLLATION" VARCHAR2(30 BYTE), 
	"RECOVERYMODEL" VARCHAR2(10 BYTE), 
	"COMPATIBILITYLEVEL" VARCHAR2(30 BYTE), 
	"PRIMARYFILEPATH" VARCHAR2(256 BYTE), 
	"LASTBACKUPDATE" VARCHAR2(128 BYTE), 
	"LASTDIFFERENTIALBACKUPDATE" VARCHAR2(128 BYTE), 
	"LASTLOGBACKUPDATE" VARCHAR2(128 BYTE), 
	"AUTOSHRINK" RAW(1), 
	"AUTOUPDATESTATISTICSENABLED" RAW(1), 
	"ISREADCOMMITTEDSNAPSHOTON" RAW(1), 
	"ISFULLTEXTENABLED" RAW(1), 
	"BROKERENABLED" RAW(1), 
	"READONLY" RAW(1), 
	"ENCRYPTIONENABLED" RAW(1), 
	"ISDATABASESNAPSHOT" RAW(1), 
	"CHANGETRACKINGENABLED" RAW(1), 
	"ISMIRRORINGENABLED" RAW(1), 
	"MIRRORINGPARTNERINSTANCE" VARCHAR2(128 BYTE), 
	"MIRRORINGSTATUS" VARCHAR2(30 BYTE), 
	"MIRRORINGSAFETYLEVEL" VARCHAR2(30 BYTE), 
	"REPLICATIONOPTIONS" VARCHAR2(30 BYTE), 
	"AVAILABILITYGROUPNAME" VARCHAR2(128 BYTE), 
	"NOOFTBLS" NUMBER(*,0), 
	"NOOFVIEWS" NUMBER(*,0), 
	"NOOFSTOREDPROCS" NUMBER(*,0), 
	"NOOFUDFS" NUMBER(*,0), 
	"NOOFLOGFILES" NUMBER(*,0), 
	"NOOFFILEGROUPS" NUMBER(*,0), 
	"NOOFUSERS" NUMBER(*,0), 
	"NOOFDBTRIGGERS" NUMBER(*,0), 
	"DATEADDED" DATE, 
	"DBID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table MV_APPLICATION
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_APPLICATION" 
   (	"ID" NUMBER(10,0), 
	"AppId" NVARCHAR2(25), 
	"ApplicationName" NVARCHAR2(255), 
	"ShortDescription" NVARCHAR2(2000), 
	"SLA" NVARCHAR2(10), 
	"GVP" NVARCHAR2(255), 
	"ApplicationOwner" NVARCHAR2(255), 
	"PTC" NVARCHAR2(255), 
	"STC" NVARCHAR2(255), 
	"SNApprovalGrp" NVARCHAR2(255), 
	"AccessApprovalGrp" NVARCHAR2(255), 
	"BusinessImpact" NVARCHAR2(255), 
	"Critical" NVARCHAR2(10), 
	"PCI" NVARCHAR2(3), 
	"Status" NVARCHAR2(25), 
	"DateAdded" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MV_DATABASEINFO
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_DATABASEINFO" 
   (	"ServerName" NVARCHAR2(128), 
	"InstanceName" NVARCHAR2(128), 
	"DBName" NVARCHAR2(128), 
	"DBStatus" NVARCHAR2(20), 
	"DBOwner" NVARCHAR2(128), 
	"DBCreateDate" DATE, 
	"DBSizeInMB" NUMBER(10,2), 
	"DBSpaceAvailableInMB" NUMBER(10,2), 
	"DBUsedSpaceInMB" NUMBER(10,2), 
	"DBPctFreeSpace" NVARCHAR2(10), 
	"DBDataSpaceUsageInMB" NUMBER(10,2), 
	"DBIndexSpaceUsageInMB" NUMBER(10,2), 
	"ActiveConnections" NUMBER(10,0), 
	"Collation" NVARCHAR2(30), 
	"RecoveryModel" NVARCHAR2(10), 
	"CompatibilityLevel" NVARCHAR2(30), 
	"PrimaryFilePath" NVARCHAR2(256), 
	"LastBackupDate" NVARCHAR2(128), 
	"LastDifferentialBackupDate" NVARCHAR2(128), 
	"LastLogBackupDate" NVARCHAR2(128), 
	"AutoShrink" NUMBER(3,0), 
	"AutoUpdateStatisticsEnabled" NUMBER(3,0), 
	"IsReadCommittedSnapshotOn" NUMBER(3,0), 
	"IsFullTextEnabled" NUMBER(3,0), 
	"BrokerEnabled" NUMBER(3,0), 
	"ReadOnly" NUMBER(3,0), 
	"EncryptionEnabled" NUMBER(3,0), 
	"IsDatabaseSnapshot" NUMBER(3,0), 
	"ChangeTrackingEnabled" NUMBER(3,0), 
	"IsMirroringEnabled" NUMBER(3,0), 
	"MirroringPartnerInstance" NVARCHAR2(128), 
	"MirroringStatus" NVARCHAR2(30), 
	"MirroringSafetyLevel" NVARCHAR2(30), 
	"ReplicationOptions" NVARCHAR2(30), 
	"AvailabilityGroupName" NVARCHAR2(128), 
	"NoOfTbls" NUMBER(5,0), 
	"NoOfViews" NUMBER(5,0), 
	"NoOfStoredProcs" NUMBER(5,0), 
	"NoOfUDFs" NUMBER(5,0), 
	"NoOfLogFiles" NUMBER(3,0), 
	"NoOfFileGroups" NUMBER(3,0), 
	"NoOfUsers" NUMBER(5,0), 
	"NoOfDBTriggers" NUMBER(3,0), 
	"DBID" NUMBER(10,0), 
	"Application" NVARCHAR2(1000), 
	"AppId" NVARCHAR2(50), 
	"DRPriority" NVARCHAR2(255), 
	"AppOwner" NVARCHAR2(1000), 
	"AppDistList" NVARCHAR2(500), 
	"PTC" NVARCHAR2(255), 
	"PTCEmail" NVARCHAR2(500), 
	"STC" NVARCHAR2(255), 
	"STCEmail" NVARCHAR2(500), 
	"DateAdded" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MV_INSTANCEINFO
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_INSTANCEINFO" 
   (	"InstanceID" NUMBER(10,0), 
	"InstanceName" NVARCHAR2(255), 
	"Environment" NVARCHAR2(3), 
	"SQLEdition" NVARCHAR2(50), 
	"SQLVersion" NVARCHAR2(50), 
	"Clustered" NVARCHAR2(3), 
	"WinClusterName" NVARCHAR2(255), 
	"ClusterType" NVARCHAR2(5), 
	"NumberOfNodes" NUMBER(10,0), 
	"NodeNames" NVARCHAR2(500), 
	"Virtual" NVARCHAR2(1), 
	"VMCluster" NVARCHAR2(128), 
	"InstanceActive" NVARCHAR2(1), 
	"DecomDate" DATE, 
	"InstanceAddedDate" DATE, 
	"Audited" NVARCHAR2(3), 
	"SecurityZone" NVARCHAR2(5), 
	"BusinessUnit" VARCHAR2(200 BYTE), 
	"Criticality" NUMBER(10,0), 
	"IPAddress" NVARCHAR2(50), 
	"Port" NVARCHAR2(30), 
	"SQLPatchLevel" NVARCHAR2(30), 
	"IsSPUpToDate" NUMBER(3,0), 
	"SQLVersionNo" NVARCHAR2(50), 
	"Collation" NVARCHAR2(50), 
	"RootDirectory" NVARCHAR2(256), 
	"DefaultDataPath" NVARCHAR2(256), 
	"DefaultLogPath" NVARCHAR2(256), 
	"ErrorLogPath" NVARCHAR2(256), 
	"IsCaseSensitive" NUMBER(3,0), 
	"IsClustered" NUMBER(3,0), 
	"IsFullTextInstalled" NUMBER(3,0), 
	"IsSingleUser" NUMBER(3,0), 
	"IsAlwaysOnEnabled" NUMBER(3,0), 
	"TCPEnabled" NUMBER(3,0), 
	"NamedPipesEnabled" NUMBER(3,0), 
	"ClusterQuorumState" NVARCHAR2(128), 
	"ClusterQuorumType" NVARCHAR2(128), 
	"AlwaysOnStatus" NVARCHAR2(50), 
	"MaxMemInMB" NUMBER(10,0), 
	"MinMemInMB" NUMBER(10,0), 
	"MaxDOP" NUMBER(3,0), 
	"NoOfUsrDBs" NUMBER(5,0), 
	"NoOfJobs" NUMBER(5,0), 
	"NoOfLnkSvrs" NUMBER(5,0), 
	"NoOfLogins" NUMBER(5,0), 
	"NoOfRoles" NUMBER(3,0), 
	"NoOfTriggers" NUMBER(3,0), 
	"NoOfAvailGrps" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table MV_SERVERINFO
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_SERVERINFO" 
   (	"ServerID" NUMBER(10,0), 
	"ServerName" NVARCHAR2(128), 
	"Environment" NVARCHAR2(5), 
	"ServerAddedDate" DATE, 
	"Active" NVARCHAR2(1), 
	"DecomDate" DATE, 
	"VMCluster" NVARCHAR2(128), 
	"WindowsCluster" NVARCHAR2(128), 
	"SecurityZone" NVARCHAR2(5), 
	"REDorBLUE" CHAR(8 BYTE), 
	"DataCenter" VARCHAR2(200 BYTE), 
	"IPAddress" NVARCHAR2(50), 
	"Model" NVARCHAR2(128), 
	"Manufacturer" NVARCHAR2(128), 
	"WMIDescription" NVARCHAR2(128), 
	"SystemType" NVARCHAR2(128), 
	"ActiveNodeName" NVARCHAR2(128), 
	"Domain" NVARCHAR2(128), 
	"DomainRole" NVARCHAR2(128), 
	"PartOfDomain" NUMBER(3,0), 
	"NumberOfProcessors" NUMBER(10,0), 
	"NumberOfLogicalProcessors" NUMBER(10,0), 
	"NumberOfCores" NUMBER(10,0), 
	"IsHyperThreaded" NUMBER(3,0), 
	"CurrentCPUSpeed" NUMBER(10,0), 
	"MaxCPUSpeed" NUMBER(10,0), 
	"IsPowerSavingModeON" NUMBER(3,0), 
	"TotalPhysicalMemoryInGB" NUMBER(10,2), 
	"IsPagefileManagedBySystem" NUMBER(3,0), 
	"IsVM" NUMBER(3,0), 
	"IsClu" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table MV_XREFAPPLICATIONINSTANCE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONINSTANCE" 
   (	"AppInstXID" NUMBER(10,0), 
	"AppID" NVARCHAR2(25), 
	"InstanceID" NUMBER(10,0), 
	"DateAdded" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MV_XREFAPPLICATIONSERVER
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONSERVER" 
   (	"AppServXID" NUMBER(10,0), 
	"AppId" NVARCHAR2(25), 
	"ServerID" NUMBER(10,0), 
	"DateAdded" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MV_XREFSERVERINSTANCE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."MV_XREFSERVERINSTANCE" 
   (	"ServInstXID" NUMBER(10,0), 
	"ServerID" NUMBER(10,0), 
	"InstanceID" NUMBER(10,0), 
	"DateAdded" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table REQUEST_QUEUE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."REQUEST_QUEUE" 
   (	"REQUEST_ID" NUMBER, 
	"TEMPLATE_NAME" VARCHAR2(50 BYTE), 
	"JOB_ID" VARCHAR2(20 BYTE), 
	"JOB_NAME" VARCHAR2(50 BYTE), 
	"JOB_URL" VARCHAR2(75 BYTE), 
	"STATUS" VARCHAR2(20 BYTE), 
	"CLUSTER_NAME" VARCHAR2(50 BYTE), 
	"CLUSTER_TYPE" VARCHAR2(50 BYTE), 
	"GI_VERSION" VARCHAR2(20 BYTE), 
	"ENV_SOURCE" VARCHAR2(20 BYTE), 
	"TICKET_REF" VARCHAR2(50 BYTE), 
	"APPLICATION_NAME" VARCHAR2(100 BYTE), 
	"BUSINESS_UNIT" VARCHAR2(50 BYTE), 
	"DB_OPTION" VARCHAR2(20 BYTE), 
	"HOST_NAME" CLOB, 
	"NETWORK_TYPE" VARCHAR2(20 BYTE), 
	"ORACLE_VERSION" VARCHAR2(20 BYTE), 
	"OS_TYPE" VARCHAR2(20 BYTE), 
	"OS_TYPE_VERSION" VARCHAR2(20 BYTE), 
	"PHY_VERT" VARCHAR2(20 BYTE), 
	"CLUSTERED" VARCHAR2(20 BYTE), 
	"DC_LOCATION" VARCHAR2(20 BYTE), 
	"SERVER_MONITOTING_TOOL" VARCHAR2(50 BYTE), 
	"DATABASE_NAME" VARCHAR2(50 BYTE), 
	"ENVIRONMENT" VARCHAR2(20 BYTE), 
	"RAC_TYPE" VARCHAR2(20 BYTE), 
	"DATABASE_ROLE" VARCHAR2(30 BYTE), 
	"STORAGE_TYPE" VARCHAR2(20 BYTE), 
	"DB_MONITORING_TOOL" VARCHAR2(50 BYTE), 
	"APPLIANCE" VARCHAR2(20 BYTE), 
	"PCI_REQUIRED" VARCHAR2(20 BYTE), 
	"SOX_REQUIRED" VARCHAR2(20 BYTE), 
	"ENCRYPTION_REQUIRED" VARCHAR2(20 BYTE), 
	"BACKUP_REQUIRED" VARCHAR2(20 BYTE), 
	"MONITORING" VARCHAR2(20 BYTE), 
	"CREATED" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(100 BYTE) DEFAULT coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*') , sys_context('userenv','session_user') ), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVERLIST
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."SERVERLIST" 
   (	"ID" NUMBER(*,0), 
	"SERVERNAME" VARCHAR2(128 BYTE), 
	"INSTANCENAME" VARCHAR2(128 BYTE), 
	"ENVIRONMENT" VARCHAR2(5 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"APPLICATION" VARCHAR2(500 BYTE), 
	"DRPRIORITY" VARCHAR2(25 BYTE), 
	"APPOWNER" VARCHAR2(500 BYTE), 
	"APPDISTLIST" VARCHAR2(500 BYTE), 
	"PTC" VARCHAR2(255 BYTE), 
	"PTCEMAIL" VARCHAR2(500 BYTE), 
	"STC" VARCHAR2(255 BYTE), 
	"STCEMAIL" VARCHAR2(500 BYTE), 
	"DATEADDED" DATE, 
	"ACTIVE" VARCHAR2(1 BYTE), 
	"DECOMDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SOURCE_APP_UPDATE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."SOURCE_APP_UPDATE" 
   (	"SOURCE_APP_UPDATE_ID" NUMBER, 
	"APP_VERSION" VARCHAR2(255 BYTE), 
	"RELEASED_DT" DATE, 
	"ACTIVE" VARCHAR2(255 BYTE), 
	"APPLIED_DT" DATE, 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(255 BYTE), 
	"SUMMARY" VARCHAR2(4000 BYTE), 
	"DESCRIPTION" CLOB, 
	"FILE_LIST" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table TEMP_SERVER_INFO
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."TEMP_SERVER_INFO" 
   (	"SERVERNAME" VARCHAR2(128 BYTE), 
	"IPADDRESS" VARCHAR2(50 BYTE), 
	"SYSTEMTYPE" VARCHAR2(128 BYTE), 
	"DOMAIN" VARCHAR2(128 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table V_ANSIBLE_TEMPLATE_STORE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" 
   (	"ID" NUMBER, 
	"TEMPLATE_NAME" VARCHAR2(200 BYTE), 
	"TEMPLATE_TYPE" VARCHAR2(10 BYTE), 
	"TEMPLATE_DESC" VARCHAR2(2000 BYTE), 
	"APEX_FEATURE" VARCHAR2(100 BYTE), 
	"APEX_MENU_ITEM" VARCHAR2(100 BYTE), 
	"CREATED" DATE DEFAULT SYSDATE, 
	"CREATED_BY" VARCHAR2(100 BYTE) DEFAULT coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')                                       , sys_context('userenv','session_user') ), 
	"TEMPLATE_STATUS" VARCHAR2(20 BYTE), 
	"TEMPLATE_ID" NUMBER, 
	"APEX_APP_ID" NUMBER, 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."TEMPLATE_NAME" IS 'ansible template name';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."TEMPLATE_TYPE" IS 'w=workflow , p = playbook';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."APEX_MENU_ITEM" IS 'apex page reference';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."TEMPLATE_STATUS" IS 'A= Active , I =InActive';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."TEMPLATE_ID" IS 'ansible template id';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE"."APEX_APP_ID" IS 'apex app reference';
--------------------------------------------------------
--  DDL for Table V_CHECKLIST_STATUS
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_CHECKLIST_STATUS" 
   (	"STATUS_ID" NUMBER, 
	"TASK_ID" VARCHAR2(255 BYTE), 
	"TASK_KEY" VARCHAR2(1000 BYTE), 
	"TASK_AREA" VARCHAR2(1000 BYTE), 
	"TASK_STATUS" VARCHAR2(255 BYTE), 
	"TASK_MESSAGE" VARCHAR2(4000 BYTE), 
	"FILE_NAME" VARCHAR2(1000 BYTE), 
	"FILE_MIMETYPE" VARCHAR2(255 BYTE), 
	"CREATED_BY" VARCHAR2(100 BYTE), 
	"CREATED" DATE, 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(100 BYTE), 
	"TASK_BODY" CLOB, 
	"FILE_UPLOAD" BLOB, 
	"RECORD_TYPE" VARCHAR2(255 BYTE), 
	"STANDARD_TASK_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table V_DB_PATCH_HISTORY
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_DB_PATCH_HISTORY" 
   (	"ID" NUMBER, 
	"HOST_NAME" VARCHAR2(255 BYTE), 
	"DATABASE" VARCHAR2(255 BYTE), 
	"INSTANCE" VARCHAR2(255 BYTE), 
	"PRODUCT_VERSION" VARCHAR2(255 BYTE), 
	"PATCH_TYPE" VARCHAR2(255 BYTE), 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(60 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table V_DB_SCHEDULE_TBL
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" 
   (	"ID" NUMBER, 
	"SERVERNAME" VARCHAR2(255 BYTE), 
	"INSTANCENAME" VARCHAR2(255 BYTE), 
	"DBNAME" NVARCHAR2(255), 
	"DBID" NUMBER, 
	"MIGRATION_DEST_SERVERNAME" VARCHAR2(255 BYTE), 
	"UPGRADE_START_DATE" DATE, 
	"UPGRADE_END_DATE" DATE, 
	"UPGRADE_VERSION" VARCHAR2(255 BYTE), 
	"MIGRATION_START_DATE" DATE, 
	"MIGRATION_END_DATE" DATE, 
	"UPGRADE_COMPLETION_TIME" VARCHAR2(4000 BYTE), 
	"MIGRATION_COMPLETION_TIME" VARCHAR2(4000 BYTE), 
	"MIGRATION_METHOD" VARCHAR2(255 BYTE), 
	"OUTAGE_WINDOW_HRS" NUMBER, 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(255 BYTE)
   )   NO INMEMORY ;
--------------------------------------------------------
--  DDL for Table V_HISTORY
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_HISTORY" 
   (	"ID" NUMBER, 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"COLUMN_NAME" VARCHAR2(128 BYTE), 
	"ACTION" VARCHAR2(1 BYTE), 
	"ACTION_DATE" DATE, 
	"ACTION_BY" VARCHAR2(255 BYTE), 
	"DATA_TYPE" VARCHAR2(255 BYTE), 
	"PK1" NUMBER, 
	"TAB_ROW_VERSION" NUMBER(*,0), 
	"OLD_VC" VARCHAR2(4000 BYTE), 
	"NEW_VC" VARCHAR2(4000 BYTE), 
	"OLD_NUMBER" NUMBER, 
	"NEW_NUMBER" NUMBER, 
	"OLD_DATE" DATE, 
	"NEW_DATE" DATE, 
	"OLD_TS" TIMESTAMP (6), 
	"NEW_TS" TIMESTAMP (6), 
	"OLD_TSWTZ" TIMESTAMP (6) WITH TIME ZONE, 
	"NEW_TSWTZ" TIMESTAMP (6) WITH TIME ZONE, 
	"OLD_TSWLTZ" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"NEW_TSWLTZ" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"OLD_CLOB" CLOB, 
	"NEW_CLOB" CLOB, 
	"OLD_BLOB" BLOB, 
	"NEW_BLOB" BLOB
   )   NO INMEMORY ;
--------------------------------------------------------
--  DDL for Table V_LOV_TBL
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_LOV_TBL" 
   (	"LOV_ID" NUMBER, 
	"LOV_VALUE" VARCHAR2(255 BYTE), 
	"LOV_CATEGORY" VARCHAR2(255 BYTE), 
	"LOV_ACTIVE" VARCHAR2(255 BYTE), 
	"LOV_PAGE" VARCHAR2(255 BYTE), 
	"LOV_DISPLAY_VALUE" VARCHAR2(255 BYTE)
   )   NO INMEMORY ;
--------------------------------------------------------
--  DDL for Table V_MSSQL_CHECK_LIST
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" 
   (	"ID" NUMBER, 
	"CHECKLIST_TYPE" VARCHAR2(20 BYTE), 
	"DB_INSTALL_STATUS" VARCHAR2(20 BYTE), 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(255 BYTE), 
	"LOG_FILE" BLOB, 
	"FILE_TYPE" VARCHAR2(20 BYTE), 
	"CHECKLIST_CATEGORY" VARCHAR2(100 BYTE), 
	"HOST_NAME" VARCHAR2(200 BYTE), 
	"DB_NAME" VARCHAR2(100 BYTE), 
	"INSTANCE_NAME" VARCHAR2(100 BYTE), 
	"DC_LOCATION" VARCHAR2(20 BYTE), 
	"REQUEST_ID" NUMBER, 
	"TASK_DESC" VARCHAR2(200 BYTE)
   )   NO INMEMORY ;
--------------------------------------------------------
--  DDL for Table V_MSSQL_CHECK_LIST_LOGS
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_LOGS" 
   (	"LOG_ID" NUMBER, 
	"CHECK_LIST_ID" NUMBER, 
	"MIME_TYPE" VARCHAR2(100 BYTE), 
	"FILE_TYPE" VARCHAR2(100 BYTE), 
	"LOG_FILE" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table V_PATCH_LOOKUP_TBL
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_PATCH_LOOKUP_TBL" 
   (	"ID" NUMBER, 
	"PATCH_FILE_NAME" VARCHAR2(100 BYTE), 
	"PATCH_TYPE" VARCHAR2(15 BYTE), 
	"PATCH_QUARTER" VARCHAR2(10 BYTE), 
	"PATCH_YEAR" VARCHAR2(10 BYTE), 
	"PATCH_PRODUCT_VERSION" VARCHAR2(255 BYTE), 
	"SOFTWARE_VERSION" VARCHAR2(10 BYTE), 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(100 BYTE), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(100 BYTE), 
	"PATCH_STATUS" VARCHAR2(10 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table V_PATCH_REQUEST_QUEUE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" 
   (	"ID" NUMBER, 
	"TEMPLATE_TYPE" VARCHAR2(1 BYTE), 
	"TEMPLATE_NAME" VARCHAR2(50 BYTE), 
	"JOB_NAME" VARCHAR2(50 BYTE), 
	"REQUEST_TYPE" VARCHAR2(25 BYTE) DEFAULT 'PATCHING', 
	"HOST_NAME" CLOB, 
	"CLUSTER_NAME" VARCHAR2(255 BYTE), 
	"TICKET_REF" VARCHAR2(255 BYTE), 
	"DC_LOCATION" VARCHAR2(50 BYTE), 
	"SQL_VERSION" VARCHAR2(255 BYTE), 
	"PATCH_FILE_NAME" VARCHAR2(255 BYTE), 
	"PATCH_LOOKUP_ID" NUMBER, 
	"STATUS" VARCHAR2(30 BYTE), 
	"CREATED" DATE DEFAULT SYSDATE, 
	"CREATED_BY" VARCHAR2(100 BYTE) DEFAULT coalesce(sys_context('APEX$SESSION','app_user'),regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'),sys_context('userenv','session_user')), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(50 BYTE), 
	"EXTRA_VARS" CLOB, 
	"JOB_ID" NUMBER, 
	"REQUEST_ID" NUMBER, 
	"PATCH_TYPE" VARCHAR2(255 BYTE), 
	"TARGET_TYPE" VARCHAR2(255 BYTE), 
	"GROUP_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table V_PATCH_SCHEDULE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_PATCH_SCHEDULE" 
   (	"PATCH_SCHED_ID" NUMBER, 
	"PATCH_DATE" DATE, 
	"HOST_NAME" CLOB, 
	"APP_ID" NUMBER, 
	"CREATED_BY" VARCHAR2(100 BYTE), 
	"CREATED" DATE, 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(100 BYTE), 
	"PATCH_TYPE" VARCHAR2(50 BYTE), 
	"PATCH_CATEGORY" VARCHAR2(50 BYTE), 
	"SQL_VERSION" VARCHAR2(50 BYTE), 
	"PATCH_LOOKUP_ID" NUMBER, 
	"TICKET_REF" VARCHAR2(50 BYTE), 
	"DC_LOCATION" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table V_REQUEST_QUEUE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_REQUEST_QUEUE" 
   (	"ID" NUMBER, 
	"TEMPLATE_TYPE" VARCHAR2(1 BYTE), 
	"TEMPLATE_NAME" VARCHAR2(50 BYTE), 
	"JOB_NAME" VARCHAR2(50 BYTE), 
	"REQUEST_TYPE" VARCHAR2(25 BYTE) DEFAULT 'PROVISIONING', 
	"DB_OPTION" VARCHAR2(10 BYTE), 
	"HOST_NAME" CLOB, 
	"APPLICATION_NAME" VARCHAR2(30 BYTE), 
	"APPLICATION_REFERENCE" VARCHAR2(255 BYTE), 
	"TICKET_REF" VARCHAR2(50 BYTE), 
	"DATA_CENTER" VARCHAR2(30 BYTE), 
	"ENVIRONMENT" VARCHAR2(30 BYTE), 
	"PHY_VERT" VARCHAR2(30 BYTE), 
	"SERVER_TYPE" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"QUANTITY" NUMBER, 
	"OPERATING_SYSTEM" VARCHAR2(255 BYTE), 
	"SERVER_SIZE" VARCHAR2(255 BYTE), 
	"CORES" NUMBER, 
	"MEM" NUMBER, 
	"OS_DISK" NUMBER, 
	"D_DISK" NUMBER, 
	"E_DISK" NUMBER, 
	"F_DISK" NUMBER, 
	"G_DISK" NUMBER, 
	"H_DISK" NUMBER, 
	"I_DISK" NUMBER, 
	"J_DISK" NUMBER, 
	"K_DISK" NUMBER, 
	"L_DISK" NUMBER, 
	"VRA_APPLICATION_CODE" VARCHAR2(30 BYTE), 
	"DOMAIN" VARCHAR2(30 BYTE), 
	"UNIX_HOST_GROUP" VARCHAR2(30 BYTE), 
	"ACCESS_INFO_ROLE_GROUP" VARCHAR2(255 BYTE), 
	"ELEVATED_ACCESS" VARCHAR2(255 BYTE), 
	"PRIMARY_HOST_OWNERSHIP" VARCHAR2(255 BYTE), 
	"SECONDARY_HOST_OWNERSHIP" VARCHAR2(255 BYTE), 
	"MAINTENANCE_WINDOW" VARCHAR2(1000 BYTE), 
	"BACKUPS_NEEDED" VARCHAR2(30 BYTE), 
	"BACKUP_TYPE" VARCHAR2(30 BYTE), 
	"DATA_CLASSFICATION" VARCHAR2(30 BYTE), 
	"PCI_REQUIRED" VARCHAR2(30 BYTE), 
	"SOX_REQUIRED" VARCHAR2(30 BYTE), 
	"NETWORK__VLAN__ZONE" VARCHAR2(30 BYTE), 
	"VMWARE_CLUSTER_NAME" VARCHAR2(30 BYTE), 
	"CLUSTERED" VARCHAR2(30 BYTE), 
	"NOTES" VARCHAR2(1000 BYTE), 
	"STATUS" VARCHAR2(255 BYTE), 
	"CREATED" DATE DEFAULT SYSDATE, 
	"CREATED_BY" VARCHAR2(100 BYTE) DEFAULT coalesce(sys_context('APEX$SESSION','app_user'),regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'),sys_context('userenv','session_user')), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(50 BYTE), 
	"EXTRA_VARS" CLOB, 
	"SQL_VERSION" VARCHAR2(255 BYTE), 
	"DATA_DRIVE" VARCHAR2(255 BYTE), 
	"LOGS_DRIVE" VARCHAR2(255 BYTE), 
	"SYSTEM_DRIVE" VARCHAR2(255 BYTE), 
	"TEMP_DRIVE" VARCHAR2(255 BYTE), 
	"BACKUPS_DRIVE" VARCHAR2(255 BYTE), 
	"PROJECT_ID" VARCHAR2(255 BYTE), 
	"AAG_CLUSTER_NAME" VARCHAR2(255 BYTE), 
	"AAG_CLUSTER_TYPE" VARCHAR2(255 BYTE), 
	"AAG_NODE_COUNT" NUMBER, 
	"VMWARE_CLUSTER_TEMPLATE" VARCHAR2(255 BYTE), 
	"DATABASE_NAME" VARCHAR2(255 BYTE), 
	"GROUP_ID" NUMBER, 
	"REQUEST_ID" NUMBER, 
	"JOB_ID" NUMBER, 
	"AAG_PRIMARY" VARCHAR2(225 BYTE), 
	"AAG_SECONDARY" VARCHAR2(255 BYTE), 
	"AAG_DRREPLICA" VARCHAR2(255 BYTE), 
	"AAG_IPADDR" VARCHAR2(255 BYTE), 
	"AAG_LISTENER" VARCHAR2(255 BYTE), 
	"AAG_LISTENERIP" VARCHAR2(255 BYTE), 
	"AAG_LISTNERPORT" VARCHAR2(255 BYTE), 
	"AAG_LISTNERSUBNET" VARCHAR2(255 BYTE), 
	"AAG_LISTNERIP_2" VARCHAR2(255 BYTE), 
	"AAG_LISTNERSUBNET_2" VARCHAR2(255 BYTE), 
	"AAG_AVAILABILITYGROUP" VARCHAR2(255 BYTE), 
	"AAG_ENDPOINTPORT" VARCHAR2(255 BYTE), 
	"AAG_DR_FLAG" VARCHAR2(255 BYTE), 
	"AAG_SECONDARY_2" VARCHAR2(255 BYTE), 
	"AAG_SECONDARY_3" VARCHAR2(255 BYTE), 
	"BUSNIESS_UNIT_LEADER" VARCHAR2(255 BYTE), 
	"VIRTUAL_CLUSTER_NAME" VARCHAR2(255 BYTE), 
	"RED_OR_BLUE" VARCHAR2(255 BYTE)
   ) ;

   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."TEMPLATE_TYPE" IS 'W= Workflow, Playbook = P';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."TEMPLATE_NAME" IS 'Name of the template';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."JOB_NAME" IS 'name of the job, which need to submit';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."REQUEST_TYPE" IS 'default is provisioning';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."HOST_NAME" IS 'In general single host name but for cluster workflow can be comma separated list of host names';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."PHY_VERT" IS 'physical or virtual';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."STATUS" IS 'S = Survey ,P= Pending, E = executed';
   COMMENT ON COLUMN "CHARTER2_SQL"."V_REQUEST_QUEUE"."EXTRA_VARS" IS 'store json structure for the extra vals';
--------------------------------------------------------
--  DDL for Table V_REQUIREMENTS_SAMPLE
--------------------------------------------------------

  CREATE TABLE "CHARTER2_SQL"."V_REQUIREMENTS_SAMPLE" 
   (	"ID" NUMBER, 
	"APPLICATION_NAME" VARCHAR2(30 BYTE), 
	"APPLICATION_REFERENCE" VARCHAR2(255 BYTE), 
	"DATA_CENTER" VARCHAR2(30 BYTE), 
	"ENVIRONMENT" VARCHAR2(30 BYTE), 
	"HARDWARE_TYPE" VARCHAR2(30 BYTE), 
	"SERVER_TYPE" VARCHAR2(30 BYTE), 
	"DESCRIPTION" VARCHAR2(1 BYTE), 
	"QUANTITY" NUMBER, 
	"OPERATING_SYSTEM" VARCHAR2(30 BYTE), 
	"SERVER_SIZE" VARCHAR2(30 BYTE), 
	"CORES" NUMBER, 
	"MEM" NUMBER, 
	"OS_DISK" NUMBER, 
	"ADDITIONAL_STORAGE_GB_D_OR_APPS" VARCHAR2(30 BYTE), 
	"VRA_APPLICATION_CODE" VARCHAR2(30 BYTE), 
	"DOMAIN" VARCHAR2(30 BYTE), 
	"UNIX_HOST_GROUP" VARCHAR2(30 BYTE), 
	"ACCESS_INFOROLE_GROUP" VARCHAR2(255 BYTE), 
	"ELEVATED_ACCESS" VARCHAR2(255 BYTE), 
	"PRIMARY_HOST_OWNERSHIP" VARCHAR2(30 BYTE), 
	"SECONDARY_HOST_OWNERSHIP" VARCHAR2(30 BYTE), 
	"MAINTENANCE_WINDOW" VARCHAR2(30 BYTE), 
	"BACKUPS_NEEDED" VARCHAR2(30 BYTE), 
	"BACKUP_TYPE" VARCHAR2(30 BYTE), 
	"DATA_CLASSFICATION" VARCHAR2(30 BYTE), 
	"PCI_DATA_YESNO" VARCHAR2(30 BYTE), 
	"SOX_DATA_YESNO" VARCHAR2(30 BYTE), 
	"NETWORK__VLAN__ZONE" VARCHAR2(30 BYTE), 
	"VMWARE_CLUSTER_NAME" VARCHAR2(30 BYTE), 
	"CLUSTERING" VARCHAR2(30 BYTE), 
	"NOTES" VARCHAR2(1 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for View APP_DB_SERVER_INFO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."APP_DB_SERVER_INFO_VW" ("SERVERNAME", "INSTANCENAME", "DBNAME", "DBSTATUS", "DBOWNER", "COLLATION", "RECOVERYMODEL", "COMPATIBILITYLEVEL", "PRIMARYFILEPATH", "DBID", "DATEADDED", "DBCREATEDATE", "ENVIRONMENT", "DESCRIPTION", "APPLICATION", "DRPRIORITY", "APPOWNER", "APPDISTLIST", "PTC", "PTCEMAIL", "STC", "STCEMAIL", "DATEADDED_SERVER", "ACTIVE", "DECOMDATE", "SQLSERVER_VERSION") AS 
  SELECT
    d.servername,
    d.instancename,
    d.dbname,
    d.dbstatus,
    d.dbowner,
    d.collation,
    d.recoverymodel,
    d.compatibilitylevel,
    d.primaryfilepath,
    d.dbid,
    d.dateadded,
    d.dbcreatedate,
    s.environment,
    s.description,
    s.application,
    s.drpriority,
    s.appowner,
    s.appdistlist,
    s.ptc,
    s.ptcemail,
    s.stc,
    s.stcemail,
    s.dateadded dateadded_server,
    s.active,
    s.decomdate,
    l.SQLSERVER_VERSION
FROM
    databaseinfo_mview d
    ,serverlist s
    ,DB_VERSION_LOOKUP_VW l
where 
d.servername = s.servername
and     d.instancename = s.instancename
and  d.compatibilitylevel = l.compatibilitylevel(+)
;
--------------------------------------------------------
--  DDL for View DB_INFO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_INFO_VW" ("ServerName", "InstanceName", "DBName", "DBStatus", "DBOwner", "DBCreateDate", "DBSizeInMB", "DBSpaceAvailableInMB", "DBUsedSpaceInMB", "DBPctFreeSpace", "DBDataSpaceUsageInMB", "DBIndexSpaceUsageInMB", "ActiveConnections", "Collation", "RecoveryModel", "CompatibilityLevel", "PrimaryFilePath", "LastBackupDate", "LastDifferentialBackupDate", "LastLogBackupDate", "AutoShrink", "AutoUpdateStatisticsEnabled", "IsReadCommittedSnapshotOn", "IsFullTextEnabled", "BrokerEnabled", "ReadOnly", "EncryptionEnabled", "IsDatabaseSnapshot", "ChangeTrackingEnabled", "IsMirroringEnabled", "MirroringPartnerInstance", "MirroringStatus", "MirroringSafetyLevel", "ReplicationOptions", "AvailabilityGroupName", "NoOfTbls", "NoOfViews", "NoOfStoredProcs", "NoOfUDFs", "NoOfLogFiles", "NoOfFileGroups", "NoOfUsers", "NoOfDBTriggers", "DateAdded", "DBID") AS 
  select "ServerName","InstanceName","DBName","DBStatus","DBOwner","DBCreateDate","DBSizeInMB","DBSpaceAvailableInMB","DBUsedSpaceInMB","DBPctFreeSpace","DBDataSpaceUsageInMB","DBIndexSpaceUsageInMB","ActiveConnections","Collation","RecoveryModel","CompatibilityLevel","PrimaryFilePath","LastBackupDate","LastDifferentialBackupDate","LastLogBackupDate","AutoShrink","AutoUpdateStatisticsEnabled","IsReadCommittedSnapshotOn","IsFullTextEnabled","BrokerEnabled","ReadOnly","EncryptionEnabled","IsDatabaseSnapshot","ChangeTrackingEnabled","IsMirroringEnabled","MirroringPartnerInstance","MirroringStatus","MirroringSafetyLevel","ReplicationOptions","AvailabilityGroupName","NoOfTbls","NoOfViews","NoOfStoredProcs","NoOfUDFs","NoOfLogFiles","NoOfFileGroups","NoOfUsers","NoOfDBTriggers","DateAdded","DBID" from DB.DatabaseInfo@"MSQL_CHARTERDB_LINK"
;
--------------------------------------------------------
--  DDL for View DB_MIGRATION_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_MIGRATION_VW" ("DBID", "DBNAME", "SERVERNAME", "INSTANCENAME", "MIGRATION_START_DATE", "MIGRATION_END_DATE", "MIGRATION_COMPLETION_TIME", "MIGRATION_METHOD", "APPLICATION", "APPOWNER", "APPDISTLIST", "PTC", "PTCEMAIL", "STC", "STCEMAIL") AS 
  SELECT
        b.dbid,
        a.dbname,
        a.servername,
        a.instancename,   
        b.migration_start_date,
        b.migration_end_date,
        b.migration_completion_time,
        b.migration_method,
        a.application,   
    a.appowner,
    a.appdistlist,
    a.ptc,
    a.ptcemail,
    a.stc,
    a.stcemail
    FROM
        app_db_server_info_vw a,
        v_db_schedule_tbl b
    WHERE
        b.dbid = a.dbid(+)
;
--------------------------------------------------------
--  DDL for View DB_SUPPORT_SUMMARY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_SUPPORT_SUMMARY_VW" ("LABEL", "SQL_2000_DBS", "SQL_2005_DBS", "SQL_2008_DBS", "SQL_2012_DBS", "SQL_2014_DBS", "SQL_2016_DBS") AS 
  SELECT 
'Standard Support' label ,
d.SQL_2000_DBS, 
d.SQL_2005_DBS,
d.SQL_2008_DBS,
d.SQL_2012_DBS,
d.SQL_2014_DBS,
d.SQL_2016_DBS
FROM   (SELECT sqlserver_version, supported_main_eol
        FROM   db_version_summary_vw)
PIVOT  (SUM(supported_main_eol) AS DBS FOR (sqlserver_version) IN (
'SQL Server 2000' as SQL_2000, 
'SQL Server 2005' as SQL_2005,
'SQL Server 2008' as SQL_2008,
'SQL Server 2012' as SQL_2012,
'SQL Server 2014' as SQL_2014,
'SQL Server 2016' as SQL_2016,
'SQL Server 2017' as SQL_2017,
'SQL Server 2018-19' as SQL_2018
)) d
union all
SELECT 'Out of Standard' label, 
d.SQL_2000_DBS, 
d.SQL_2005_DBS,
d.SQL_2008_DBS,
d.SQL_2012_DBS,
d.SQL_2014_DBS,
d.SQL_2016_DBS
FROM   (SELECT sqlserver_version, outofsupported_main
        FROM   db_version_summary_vw)
PIVOT  (SUM(outofsupported_main) AS DBS FOR (sqlserver_version) IN (
'SQL Server 2000' as SQL_2000, 
'SQL Server 2005' as SQL_2005,
'SQL Server 2008' as SQL_2008,
'SQL Server 2012' as SQL_2012,
'SQL Server 2014' as SQL_2014,
'SQL Server 2016' as SQL_2016,
'SQL Server 2017' as SQL_2017,
'SQL Server 2018-19' as SQL_2018
)) d
union all
SELECT 'Extended Support' label, 
d.SQL_2000_DBS, 
d.SQL_2005_DBS,
d.SQL_2008_DBS,
d.SQL_2012_DBS,
d.SQL_2014_DBS,
d.SQL_2016_DBS
FROM   (SELECT sqlserver_version, supported_extended_eol
        FROM   db_version_summary_vw)
PIVOT  (SUM(supported_extended_eol) AS DBS FOR (sqlserver_version) IN (
'SQL Server 2000' as SQL_2000, 
'SQL Server 2005' as SQL_2005,
'SQL Server 2008' as SQL_2008,
'SQL Server 2012' as SQL_2012,
'SQL Server 2014' as SQL_2014,
'SQL Server 2016' as SQL_2016,
'SQL Server 2017' as SQL_2017,
'SQL Server 2018-19' as SQL_2018
)) d
union all
SELECT 'Out of Extended Support' label, 
d.SQL_2000_DBS, 
d.SQL_2005_DBS,
d.SQL_2008_DBS,
d.SQL_2012_DBS,
d.SQL_2014_DBS,
d.SQL_2016_DBS
FROM   (SELECT sqlserver_version, outofsupported_extended
        FROM   db_version_summary_vw)
PIVOT  (SUM(outofsupported_extended) AS DBS FOR (sqlserver_version) IN (
'SQL Server 2000' as SQL_2000, 
'SQL Server 2005' as SQL_2005,
'SQL Server 2008' as SQL_2008,
'SQL Server 2012' as SQL_2012,
'SQL Server 2014' as SQL_2014,
'SQL Server 2016' as SQL_2016,
'SQL Server 2017' as SQL_2017,
'SQL Server 2018-19' as SQL_2018
)) d
union all
SELECT 'Upgrade Scheduled' label, 
d.SQL_2000_DBS, 
d.SQL_2005_DBS,
d.SQL_2008_DBS,
d.SQL_2012_DBS,
d.SQL_2014_DBS,
d.SQL_2016_DBS
FROM   (SELECT sqlserver_version, upgrade_scheduled
        FROM   db_version_summary_vw)
PIVOT  (SUM(upgrade_scheduled) AS DBS FOR (sqlserver_version) IN (
'SQL Server 2000' as SQL_2000, 
'SQL Server 2005' as SQL_2005,
'SQL Server 2008' as SQL_2008,
'SQL Server 2012' as SQL_2012,
'SQL Server 2014' as SQL_2014,
'SQL Server 2016' as SQL_2016,
'SQL Server 2017' as SQL_2017,
'SQL Server 2018-19' as SQL_2018
)) d
;
--------------------------------------------------------
--  DDL for View DB_UPGRADE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_UPGRADE_VW" ("DBID", "DBNAME", "SERVERNAME", "INSTANCENAME", "UPGRADE_START_DATE", "UPGRADE_END_DATE", "UPGRADE_COMPLETION_TIME", "OUTAGE_WINDOW_HRS", "COMMENTS", "APPLICATION", "APPOWNER", "APPDISTLIST", "PTC", "PTCEMAIL", "STC", "STCEMAIL") AS 
  SELECT
        a.dbid,
        a.dbname,
        b.servername,
        a.instancename,   
        b.upgrade_start_date,
        b.upgrade_end_date,
        b.upgrade_completion_time,
        b.outage_window_hrs,
        b.comments,
        a.application,   
    a.appowner,
    a.appdistlist,
    a.ptc,
    a.ptcemail,
    a.stc,
    a.stcemail
    FROM
        app_db_server_info_vw a,
        v_db_schedule_tbl b
    WHERE
        b.servername = a.servername(+)
;
--------------------------------------------------------
--  DDL for View DB_VERSION_LOOKUP_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_VERSION_LOOKUP_VW" ("COMPATIBILITYLEVEL", "SQLSERVER_VERSION", "SQLSERVER_MAIN_EOL", "SQLSERVER_EXTENDED_EOL") AS 
  select 
compatibilitylevel
,max(
case 
when compatibilitylevel like '%80%' then
'SQL Server 2000'
when compatibilitylevel like '%90%' then
'SQL Server 2005'
when compatibilitylevel like '%100%' then
'SQL Server 2008'
when compatibilitylevel like '%110%' then
'SQL Server 2012'
when compatibilitylevel like '%120%' then
'SQL Server 2014'
when compatibilitylevel like '%130%' then
'SQL Server 2016'
when compatibilitylevel like '%140%' then
'SQL Server 2017'
when compatibilitylevel like '%150%' then
'SQL Server 2018-19'
else
compatibilitylevel
end

) SQLSERVER_VERSION
,max(
case 
when compatibilitylevel like '%80%' then
to_date('01/01/2005','MM/DD/RRRR')
when compatibilitylevel like '%90%' then
to_date('05/01/2008','MM/DD/RRRR')
when compatibilitylevel like '%100%' then
to_date('07/01/2015','MM/DD/RRRR')
when compatibilitylevel like '%110%' then
to_date('10/01/2018','MM/DD/RRRR')
when compatibilitylevel like '%120%' then
to_date('10/01/2019','MM/DD/RRRR')
when compatibilitylevel like '%130%' then
to_date('01/01/2022','MM/DD/RRRR')
when compatibilitylevel like '%140%' then
to_date('10/01/2022','MM/DD/RRRR')
when compatibilitylevel like '%150%' then
to_date('10/01/2023','MM/DD/RRRR')
else
null
end
) SQLSERVER_MAIN_EOL
,max(
case 
when compatibilitylevel like '%80%' then
to_date('01/01/2005','MM/DD/RRRR')
when compatibilitylevel like '%90%' then
to_date('05/01/2008','MM/DD/RRRR')
when compatibilitylevel like '%100%' then
to_date('07/01/2019','MM/DD/RRRR')
when compatibilitylevel like '%110%' then
to_date('10/01/2022','MM/DD/RRRR')
when compatibilitylevel like '%120%' then
to_date('10/01/2024','MM/DD/RRRR')
when compatibilitylevel like '%130%' then
to_date('01/01/2026','MM/DD/RRRR')
when compatibilitylevel like '%140%' then
to_date('10/01/2026','MM/DD/RRRR')
when compatibilitylevel like '%150%' then
to_date('10/01/2027','MM/DD/RRRR')
else
null
end
) SQLSERVER_EXTENDED_EOL

 from ( 
select  'Version80' compatibilitylevel from dual
union all
select  'Version90' compatibilitylevel from dual
union all
select  'Version100' compatibilitylevel from dual
union all
select  'Version100' compatibilitylevel from dual
union all
select  'Version110' compatibilitylevel from dual
union all
select  'Version120' compatibilitylevel from dual
union all
select  'Version130' compatibilitylevel from dual
union all
select  'Version140' compatibilitylevel from dual
)
 group by compatibilitylevel
;
--------------------------------------------------------
--  DDL for View DB_VERSION_SUMMARY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."DB_VERSION_SUMMARY_VW" ("COMPATIBILITYLEVEL", "SQLSERVER_VERSION", "SQLSERVER_MAIN_EOL", "SQLSERVER_EXTENDED_EOL", "NUMBER_OF_DBS", "SUPPORTED_MAIN_EOL", "OUTOFSUPPORTED_MAIN", "SUPPORTED_EXTENDED_EOL", "OUTOFSUPPORTED_EXTENDED", "UPGRADE_SCHEDULED") AS 
  select 
d.compatibilitylevel
,l.SQLSERVER_VERSION
, l.SQLSERVER_MAIN_EOL
, l.SQLSERVER_EXTENDED_EOL
 ,count(*) number_of_DBs
 ,sum(
  case 
  when l.SQLSERVER_MAIN_EOL >= trunc(sysdate) then
   1
  else
  0
  end
 ) supported_MAIN_EOL
 ,sum(
  case 
  when l.SQLSERVER_MAIN_EOL < trunc(sysdate) then
   1
  else
  0
  end
 ) outofsupported_MAIN
  ,sum(
  case 
  when l.SQLSERVER_EXTENDED_EOL >= trunc(sysdate) then
   1
  else
  0
  end
 ) supported_EXTENDED_EOL
  ,sum(
  case 
  when l.SQLSERVER_EXTENDED_EOL < trunc(sysdate) then
   1
  else
  0
  end
 ) outofsupported_EXTENDED
  ,sum(
  case 
  when m.dbid is not null then
   1
  else
  0
  end
 ) upgrade_scheduled
 from databaseinfo_mview d
 ,DB_VERSION_LOOKUP_VW l
 ,db_upgrade_vw m
 where
 d.compatibilitylevel = l.compatibilitylevel(+)
 and d.dbid = m.dbid(+)
 group by d.compatibilitylevel
 ,l.SQLSERVER_VERSION
, l.SQLSERVER_MAIN_EOL
, l.SQLSERVER_EXTENDED_EOL
;
--------------------------------------------------------
--  DDL for View V_PATCH_SCHEDULE_CALENDAR
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CHARTER2_SQL"."V_PATCH_SCHEDULE_CALENDAR" ("PATCH_SCHED_ID", "HOST_NAME", "PATCH_DATE", "DC_LOCATION", "PATCH_LOOKUP_ID", "PATCH_TARGET", "PATCH_END", "PATCH_NAME", "TICKET_REF") AS 
  SELECT
    ps.patch_sched_id,
    to_char(ps.host_name) host_name,
    ps.patch_date,
    ps.dc_location,
    ps.patch_lookup_id,
  --  ps.host_name patch_target,
    to_char(ps.host_name) patch_target,
    max(ps.patch_date + 4/24) patch_end,
    max(pl.PATCH_TYPE||' '||pl.SOFTWARE_VERSION||' -'|| pl.PATCH_QUARTER||' '||pl.PATCH_YEAR) patch_name,
    max(ticket_ref) ticket_ref
FROM
    charter2_sql.v_patch_schedule ps
   ,charter2_sql.V_PATCH_LOOKUP_TBL pl
 where
  ps.patch_lookup_id = pl.id
 group by 
    ps.patch_sched_id,
    to_char(ps.host_name),
    ps.patch_date,
        ps.dc_location,
    ps.patch_lookup_id
;
--------------------------------------------------------
--  DDL for Materialized View DATABASEINFO_MVIEW
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "CHARTER2_SQL"."DATABASEINFO_MVIEW" ("SERVERNAME", "INSTANCENAME", "DBNAME", "DBSTATUS", "DBOWNER", "COLLATION", "RECOVERYMODEL", "COMPATIBILITYLEVEL", "PRIMARYFILEPATH", "DBID", "DATEADDED", "DBCREATEDATE")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CHARTER2_MSSQL_DATA"   NO INMEMORY 
  BUILD IMMEDIATE
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CHARTER2_MSSQL_DATA" 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT
    servername,
    instancename,
    dbname,
    dbstatus,
    dbowner,
    collation,
    recoverymodel,
    compatibilitylevel,
    primaryfilepath,
    max(dbid) dbid,
    min(    dateadded)    dateadded,
    min(dbcreatedate) dbcreatedate
    FROM
    databaseinfo
    group by
        servername,
    instancename,
    dbname,
    dbstatus,
    dbowner,
        collation,
    recoverymodel,
    compatibilitylevel,
    primaryfilepath;

  CREATE UNIQUE INDEX "CHARTER2_SQL"."I_SNAP$_DATABASEINFO_MVIEW" ON "CHARTER2_SQL"."DATABASEINFO_MVIEW" (SYS_OP_MAP_NONNULL("SERVERNAME"), SYS_OP_MAP_NONNULL("INSTANCENAME"), SYS_OP_MAP_NONNULL("DBNAME"), SYS_OP_MAP_NONNULL("DBSTATUS"), SYS_OP_MAP_NONNULL("DBOWNER"), SYS_OP_MAP_NONNULL("COLLATION"), SYS_OP_MAP_NONNULL("RECOVERYMODEL"), SYS_OP_MAP_NONNULL("COMPATIBILITYLEVEL"), SYS_OP_MAP_NONNULL("PRIMARYFILEPATH")) 
  ;

   COMMENT ON MATERIALIZED VIEW "CHARTER2_SQL"."DATABASEINFO_MVIEW"  IS 'snapshot table for snapshot CHARTER2_SQL.DATABASEINFO_MVIEW';
--------------------------------------------------------
--  DDL for Materialized View DB_INFO_MVIEW
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "CHARTER2_SQL"."DB_INFO_MVIEW" ("ServerName", "InstanceName", "DBName", "DBStatus", "DBOwner", "DBCreateDate", "DBSizeInMB", "DBSpaceAvailableInMB", "DBUsedSpaceInMB", "DBPctFreeSpace", "DBDataSpaceUsageInMB", "DBIndexSpaceUsageInMB", "ActiveConnections", "Collation", "RecoveryModel", "CompatibilityLevel", "PrimaryFilePath", "LastBackupDate", "LastDifferentialBackupDate", "LastLogBackupDate", "AutoShrink", "AutoUpdateStatisticsEnabled", "IsReadCommittedSnapshotOn", "IsFullTextEnabled", "BrokerEnabled", "ReadOnly", "EncryptionEnabled", "IsDatabaseSnapshot", "ChangeTrackingEnabled", "IsMirroringEnabled", "MirroringPartnerInstance", "MirroringStatus", "MirroringSafetyLevel", "ReplicationOptions", "AvailabilityGroupName", "NoOfTbls", "NoOfViews", "NoOfStoredProcs", "NoOfUDFs", "NoOfLogFiles", "NoOfFileGroups", "NoOfUsers", "NoOfDBTriggers", "DateAdded", "DBID")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CHARTER2_MSSQL_DATA" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT 
    *
FROM 
    DB_INFO_VW;

   COMMENT ON MATERIALIZED VIEW "CHARTER2_SQL"."DB_INFO_MVIEW"  IS 'snapshot table for snapshot CHARTER2_SQL.DB_INFO_MVIEW';
--------------------------------------------------------
--  DDL for Index V_ANSIBLE_TEMPLATE_STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE_PK" ON "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_ANSIBLE_TEMPLATE_STORE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE_UK1" ON "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" ("TEMPLATE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index LOOKUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."LOOKUP_PK" ON "CHARTER2_SQL"."V_PATCH_LOOKUP_TBL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_PATCH_REQUEST_QUEUE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE_PK" ON "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_DB_SCHEDULE_TBL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_DB_SCHEDULE_TBL_ID_PK" ON "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_REQUIREMENTS_SAMPLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_REQUIREMENTS_SAMPLE_PK" ON "CHARTER2_SQL"."V_REQUIREMENTS_SAMPLE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index REQUEST_QUEUE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."REQUEST_QUEUE_PK" ON "CHARTER2_SQL"."REQUEST_QUEUE" ("REQUEST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SOURCE_APP_UPDATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."SOURCE_APP_UPDATE_PK" ON "CHARTER2_SQL"."SOURCE_APP_UPDATE" ("SOURCE_APP_UPDATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_REQUEST_QUEUE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_REQUEST_QUEUE_PK" ON "CHARTER2_SQL"."V_REQUEST_QUEUE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_DB_CHECK_LIST_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."V_DB_CHECK_LIST_ID_PK" ON "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index V_HISTORY_IDX1
--------------------------------------------------------

  CREATE INDEX "CHARTER2_SQL"."V_HISTORY_IDX1" ON "CHARTER2_SQL"."V_HISTORY" ("PK1") 
  ;
--------------------------------------------------------
--  DDL for Index V_DB_SCHEDULE_TBL_I2
--------------------------------------------------------

  CREATE INDEX "CHARTER2_SQL"."V_DB_SCHEDULE_TBL_I2" ON "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" ("DBID") 
  ;
--------------------------------------------------------
--  DDL for Index I_SNAP$_DATABASEINFO_MVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHARTER2_SQL"."I_SNAP$_DATABASEINFO_MVIEW" ON "CHARTER2_SQL"."DATABASEINFO_MVIEW" (SYS_OP_MAP_NONNULL("SERVERNAME"), SYS_OP_MAP_NONNULL("INSTANCENAME"), SYS_OP_MAP_NONNULL("DBNAME"), SYS_OP_MAP_NONNULL("DBSTATUS"), SYS_OP_MAP_NONNULL("DBOWNER"), SYS_OP_MAP_NONNULL("COLLATION"), SYS_OP_MAP_NONNULL("RECOVERYMODEL"), SYS_OP_MAP_NONNULL("COMPATIBILITYLEVEL"), SYS_OP_MAP_NONNULL("PRIMARYFILEPATH")) 
  ;
--------------------------------------------------------
--  DDL for Index V_HISTORY_IDX2
--------------------------------------------------------

  CREATE INDEX "CHARTER2_SQL"."V_HISTORY_IDX2" ON "CHARTER2_SQL"."V_HISTORY" ("TABLE_NAME", "COLUMN_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index V_DB_SCHEDULE_TBL_I1
--------------------------------------------------------

  CREATE INDEX "CHARTER2_SQL"."V_DB_SCHEDULE_TBL_I1" ON "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" ("DBNAME") 
  ;
--------------------------------------------------------
--  DDL for Trigger LOV_BI_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."LOV_BI_TRG" 
before insert on v_lov_tbl 
for each row 
begin
  if :new.LOV_id is null then
        :new.lov_id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;


/
ALTER TRIGGER "CHARTER2_SQL"."LOV_BI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOURCE_APP_UPDATE_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."SOURCE_APP_UPDATE_BIU" 
    before insert or update
    on SOURCE_APP_UPDATE
    for each row
begin
    if :new.SOURCE_APP_UPDATE_ID is null then
        :new.SOURCE_APP_UPDATE_ID := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;

    if :new.RELEASED_DT is null then
    :new.RELEASED_DT := sysdate;
    end if;

    if updating then
        :new.updated := sysdate ;
        :new.updated_by := coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
    end if;

end SOURCE_APP_UPDATE_BIU;

/
ALTER TRIGGER "CHARTER2_SQL"."SOURCE_APP_UPDATE_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_ANSIBLE_TEMPLATE_STORE_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE_BIU" 
    before insert or update
    on V_ANSIBLE_TEMPLATE_STORE
    for each row
begin
    if inserting then 
        if :new.id is null then
            :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
    end if;
   :new.TEMPLATE_STATUS := upper(:new.TEMPLATE_STATUS) ;
    if updating then
        :new.updated := sysdate ;
        :new.updated_by := coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
    end if;


end V_ANSIBLE_TEMPLATE_STORE_BIU;

/
ALTER TRIGGER "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_CHECKLIST_STATUS_BUI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_CHECKLIST_STATUS_BUI" 
    before insert or update
    on CHARTER2_SQL.V_CHECKLIST_STATUS
    for each row
 Declare
  PRAGMA AUTONOMOUS_TRANSACTION;
begin

    if :new.STATUS_ID is null then
        :new.STATUS_ID := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then

        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end V_CHECKLIST_STATUS_BUI;


/
ALTER TRIGGER "CHARTER2_SQL"."V_CHECKLIST_STATUS_BUI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_DB_CHECK_LIST_AUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_DB_CHECK_LIST_AUD" 
    after update or delete on "CHARTER2_SQL"."V_MSSQL_CHECK_LIST"
    for each row
declare
    t varchar2(128) := 'V_DB_CHECK_LIST';
    u varchar2(128) := nvl(sys_context('APEX$SESSION','APP_USER'),user);
begin
if updating then
    if (:old.id is null and :new.id is not null) or
        (:old.id is not null and :new.id is null) or
        :old.id != :new.id then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            v_history_seq.nextval, t, 'ID', :old.id, null, 'U', sysdate, u, 'NUMBER', :old.id, :new.id);

    end if;
    if (:old.ID is null and :new.ID is not null) or
        (:old.ID is not null and :new.ID is null) or
        :old.ID != :new.ID then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            v_history_seq.nextval, t, 'ID', :old.id, null, 'U', sysdate, u, 'NUMBER', :old.ID, :new.ID);

    end if;
    if (:old.checklist_type is null and :new.checklist_type is not null) or
        (:old.checklist_type is not null and :new.checklist_type is null) or
        :old.checklist_type != :new.checklist_type then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'CHECKLIST_TYPE', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.checklist_type, :new.checklist_type);

    end if;
    if (:old.post_build_status is null and :new.post_build_status is not null) or
        (:old.post_build_status is not null and :new.post_build_status is null) or
        :old.post_build_status != :new.post_build_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'POST_BUILD_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.post_build_status, :new.post_build_status);

    end if;
    if (:old.cluster_verify is null and :new.cluster_verify is not null) or
        (:old.cluster_verify is not null and :new.cluster_verify is null) or
        :old.cluster_verify != :new.cluster_verify then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'CLUSTER_VERIFY', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.cluster_verify, :new.cluster_verify);

    end if;
    if (:old.gi_install_status is null and :new.gi_install_status is not null) or
        (:old.gi_install_status is not null and :new.gi_install_status is null) or
        :old.gi_install_status != :new.gi_install_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'GI_INSTALL_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.gi_install_status, :new.gi_install_status);

    end if;
    if (:old.db_install_status is null and :new.db_install_status is not null) or
        (:old.db_install_status is not null and :new.db_install_status is null) or
        :old.db_install_status != :new.db_install_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'DB_INSTALL_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.db_install_status, :new.db_install_status);

    end if;
    if (:old.db_upgrade_status is null and :new.db_upgrade_status is not null) or
        (:old.db_upgrade_status is not null and :new.db_upgrade_status is null) or
        :old.db_upgrade_status != :new.db_upgrade_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'DB_UPGRADE_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.db_upgrade_status, :new.db_upgrade_status);

    end if;
    if (:old.gi_upgrade_status is null and :new.gi_upgrade_status is not null) or
        (:old.gi_upgrade_status is not null and :new.gi_upgrade_status is null) or
        :old.gi_upgrade_status != :new.gi_upgrade_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'GI_UPGRADE_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.gi_upgrade_status, :new.gi_upgrade_status);

    end if;
    if (:old.migration_status is null and :new.migration_status is not null) or
        (:old.migration_status is not null and :new.migration_status is null) or
        :old.migration_status != :new.migration_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'MIGRATION_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.migration_status, :new.migration_status);

    end if;
    if (:old.post_migration_status is null and :new.post_migration_status is not null) or
        (:old.post_migration_status is not null and :new.post_migration_status is null) or
        :old.post_migration_status != :new.post_migration_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'POST_MIGRATION_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.post_migration_status, :new.post_migration_status);

    end if;

    
elsif deleting then
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        v_history_seq.nextval, t, 'ID', :old.id, null, 'D', sysdate, u, 'NUMBER', :old.id, :new.id);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        v_history_seq.nextval, t, 'ID', :old.id, null, 'D', sysdate, u, 'NUMBER', :old.ID, :new.ID);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'CHECKLIST_TYPE', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.checklist_type, :new.checklist_type);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'POST_BUILD_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.post_build_status, :new.post_build_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'CLUSTER_VERIFY', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.cluster_verify, :new.cluster_verify);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'GI_INSTALL_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.gi_install_status, :new.gi_install_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'DB_INSTALL_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.db_install_status, :new.db_install_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'DB_UPGRADE_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.db_upgrade_status, :new.db_upgrade_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'GI_UPGRADE_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.gi_upgrade_status, :new.gi_upgrade_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'MIGRATION_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.migration_status, :new.migration_status);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'POST_MIGRATION_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.post_migration_status, :new.post_migration_status);

end if;
end;
/
ALTER TRIGGER "CHARTER2_SQL"."V_DB_CHECK_LIST_AUD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_DB_CHECK_LIST_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_DB_CHECK_LIST_BIU" 
    before insert or update
    on "CHARTER2_SQL"."V_MSSQL_CHECK_LIST"
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by :=  coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
        
    end if;
    :new.updated := sysdate;
    :new.updated_by :=  coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
end v_db_check_list_biu;
/
ALTER TRIGGER "CHARTER2_SQL"."V_DB_CHECK_LIST_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_DB_PATCH_HISTORY_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_DB_PATCH_HISTORY_BIU" 
before insert on CHARTER2_SQL.V_DB_PATCH_HISTORY 
for each row 
begin
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
     if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
    end if;

end;
/
ALTER TRIGGER "CHARTER2_SQL"."V_DB_PATCH_HISTORY_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_DB_SCHEDULE_TBL_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_DB_SCHEDULE_TBL_BIU" 
    before insert or update
    on charter2_SQL.v_db_schedule_tbl
    for each row
begin
     if :new.id  is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
     end if;   
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end v_db_schedule_tbl_biu;

/
ALTER TRIGGER "CHARTER2_SQL"."V_DB_SCHEDULE_TBL_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_MSSQL_CHECK_LIST_AUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_AUD" 
    after update or delete on "CHARTER2_SQL"."V_MSSQL_CHECK_LIST"
    for each row
declare
    t varchar2(128) := 'V_DB_CHECK_LIST';
    u varchar2(128) := nvl(sys_context('APEX$SESSION','APP_USER'),user);
begin
if updating then
    if (:old.id is null and :new.id is not null) or
        (:old.id is not null and :new.id is null) or
        :old.id != :new.id then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            v_history_seq.nextval, t, 'ID', :old.id, null, 'U', sysdate, u, 'NUMBER', :old.id, :new.id);

    end if;
    if (:old.ID is null and :new.ID is not null) or
        (:old.ID is not null and :new.ID is null) or
        :old.ID != :new.ID then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            v_history_seq.nextval, t, 'ID', :old.id, null, 'U', sysdate, u, 'NUMBER', :old.ID, :new.ID);

    end if;
    if (:old.checklist_type is null and :new.checklist_type is not null) or
        (:old.checklist_type is not null and :new.checklist_type is null) or
        :old.checklist_type != :new.checklist_type then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'CHECKLIST_TYPE', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.checklist_type, :new.checklist_type);

    end if;
    if (:old.request_id is null and :new.request_id is not null) or
        (:old.request_id is not null and :new.request_id is null) or
        :old.request_id != :new.request_id then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'request_id', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.request_id, :new.request_id);

    end if;
    if (:old.dc_location is null and :new.dc_location is not null) or
        (:old.dc_location is not null and :new.dc_location is null) or
        :old.dc_location != :new.dc_location then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'dc_location', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.dc_location, :new.dc_location);

    end if;
   
    if (:old.db_install_status is null and :new.db_install_status is not null) or
        (:old.db_install_status is not null and :new.db_install_status is null) or
        :old.db_install_status != :new.db_install_status then
        insert into CHARTER2_SQL.v_history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            v_history_seq.nextval, t, 'DB_INSTALL_STATUS', :old.id, null, 'U', sysdate, u, 'VARCHAR2', :old.db_install_status, :new.db_install_status);

    end if;
  

    
elsif deleting then
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        v_history_seq.nextval, t, 'ID', :old.id, null, 'D', sysdate, u, 'NUMBER', :old.id, :new.id);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        v_history_seq.nextval, t, 'ID', :old.id, null, 'D', sysdate, u, 'NUMBER', :old.ID, :new.ID);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'CHECKLIST_TYPE', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.checklist_type, :new.checklist_type);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'request_id', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.request_id, :new.request_id);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'dc_location', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.dc_location, :new.dc_location);
    insert into CHARTER2_SQL.v_history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        v_history_seq.nextval, t, 'DB_INSTALL_STATUS', :old.id, null, 'D', sysdate, u, 'VARCHAR2', :old.db_install_status, :new.db_install_status);

   

end if;
end;
/
ALTER TRIGGER "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_AUD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_MSSQL_CHECK_LIST_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_BIU" 
    before insert or update
    on "CHARTER2_SQL"."V_MSSQL_CHECK_LIST"
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by :=  coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
        
    end if;
    :new.updated := sysdate;
    :new.updated_by :=  coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
end v_MSSQL_check_list_biu;
/
ALTER TRIGGER "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_PATCH_REQUEST_QUEUE_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE_BIU" 
    before insert or update
    on CHARTER2_SQL.v_patch_request_queue
    for each row
begin
    if inserting then 
        if :new.id is null then
            :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
    end if;
   :new.STATUS := upper(:new.STATUS) ;
    if updating then
        :new.updated := sysdate ;
        :new.updated_by := coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
    end if;


end V_PATCH_REQUEST_QUEUE_BIU;


/
ALTER TRIGGER "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_PATCH_SCHEDULE_BUI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_PATCH_SCHEDULE_BUI" 
    before insert or update
    on CHARTER2_SQL.v_patch_schedule
    for each row
 Declare
  PRAGMA AUTONOMOUS_TRANSACTION;
begin

    if :new.PATCH_SCHED_id is null then
        :new.PATCH_SCHED_id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then

        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end v_Patch_SCHEDULE_BUI;

/
ALTER TRIGGER "CHARTER2_SQL"."V_PATCH_SCHEDULE_BUI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger V_REQUEST_QUEUE_BIU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."V_REQUEST_QUEUE_BIU" 
    before insert or update
    on CHARTER2_SQL.V_REQUEST_QUEUE
    for each row
begin
    if inserting then 
        if :new.id is null then
            :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
    end if;
   :new.STATUS := upper(:new.STATUS) ;
    if updating then
        :new.updated := sysdate ;
        :new.updated_by := coalesce( sys_context('APEX$SESSION','app_user') , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')  
                                    , sys_context('userenv','session_user') ) ;
    end if;


end V_REQUEST_QUEUE_BIU;

/
ALTER TRIGGER "CHARTER2_SQL"."V_REQUEST_QUEUE_BIU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger bi_V_REQUIREMENTS_SAMPLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."bi_V_REQUIREMENTS_SAMPLE" 
  before insert on "V_REQUIREMENTS_SAMPLE"              
  for each row 
begin  
  if :new."ID" is null then
    select "V_REQUIREMENTS_SAMPLE_SEQ".nextval into :new."ID" from sys.dual;
  end if;
end;

/
ALTER TRIGGER "CHARTER2_SQL"."bi_V_REQUIREMENTS_SAMPLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger v_Patch_Lookup_BUI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CHARTER2_SQL"."v_Patch_Lookup_BUI" 
    before insert or update
    on V_PATCH_LOOKUP_TBL
    for each row
 Declare
  PRAGMA AUTONOMOUS_TRANSACTION;
begin

    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then

        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end v_Patch_Lookup_BUI;

/
ALTER TRIGGER "CHARTER2_SQL"."v_Patch_Lookup_BUI" ENABLE;
--------------------------------------------------------
--  DDL for Package OAC$ANSIBLE_MSSQL_UTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CHARTER2_SQL"."OAC$ANSIBLE_MSSQL_UTL" AS 

 /*
   This Package Relies on the Base building nlock functions in 
   charter2_inv.
   Make Sure to:
    grant execute on oac$ansible_rest_utl to charter2_sql;
    grant execute on oac$ansible_utl to charter2_sql;
   As sys 
    grant select on dba_jobs to charter2_sql;
    grant execute on dbms_ijob to charter2_sql;
    --
    -- Create synonym for charter2_sql for the above packages
    --
     create synonym charter2_sql.oac$ansible_rest_utl for charter2_inv.oac$ansible_rest_utl;
     create synonym charter2_sql.oac$ansible_utl for charter2_inv.oac$ansible_utl;
 */
 -- **********  Procedure mssql_install_withDB  **********

procedure do_mssql_install_withDB (   p_request_id in number,
                                      p_job_id out number,
                                      p_self_service_id out number,
                                      p_extra_vars out clob
                                    );       

    PROCEDURE REMOVE_GROUP ( P_REQ_ID IN NUMBER );
    
    /**
    author: Jaydipsinh Raulji
    Purpose: Delete hosts associated with given job request.
    */    
    PROCEDURE remove_hosts ( p_req_id IN NUMBER );     

     PROCEDURE remove_job_groups;  
     
  procedure remove_batch_job(
  p_search in varchar2 default null,
p_what in varchar2 default null,
p_start in date default null,
p_interval in varchar2 default null
);
     
 procedure setup_batch_job(
  p_search in varchar2 default null,
p_what in varchar2 default null,
p_start in date default null,
p_interval in varchar2 default null
);
  procedure setup_batch_jobs(
  p_action in varchar2 default 'DAILY',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
);

     
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
 

END OAC$ANSIBLE_MSSQL_UTL;

/
--------------------------------------------------------
--  DDL for Package V_MSSQL_CHECK_LIST_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_API" 
is


procedure get_row (
       p_id                           in number,        
        P_checklist_type               out VARCHAR2,
        P_db_install_status            out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2,
        p_checklist_category           out varchar2,
        p_db_name                      out varchar2,
        p_host_name                    out varchar2,
        p_dc_location                  out varchar2,
        p_request_id                   out number,
        p_task_desc                    out varchar2 
    );
    
    
     procedure update_row  (
        p_id                           out number,
        p_checklist_type               in varchar2 default null,
        p_db_install_status            in varchar2 default null,
        p_checklist_category           in varchar2 default null,
        p_db_name                      in varchar2 default null,
        p_host_name                    in varchar2 default null,
        p_dc_location                  in varchar2 default null,
        p_request_id                   in number default null,
        p_task_desc                    in varchar2 default null

    );
  procedure insert_row  (
        p_id                           out number,
        p_checklist_type               in varchar2 default null,
        p_db_install_status            in varchar2 default null,
        p_checklist_category           in varchar2 default null,
        p_db_name                      in varchar2 default null,
        p_host_name                    in varchar2 default null,
        p_dc_location                  in varchar2 default null,
        p_request_id                   in number default null,
        p_task_desc                    in varchar2 default null
    );
    
    procedure delete_row(
      p_id                           in number
      );
end V_MSSQL_CHECK_LIST_API;

/
--------------------------------------------------------
--  DDL for Package Body OAC$ANSIBLE_MSSQL_UTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "CHARTER2_SQL"."OAC$ANSIBLE_MSSQL_UTL" AS

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
        "standard_task_id": "0",
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
        "standard_task_id": "0",
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
--------------------------------------------------------
--  DDL for Package Body V_MSSQL_CHECK_LIST_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_API" 
is
    procedure get_row (
       p_id                           in number,        
        P_checklist_type               out VARCHAR2,
        P_db_install_status            out varchar2,
        P_created                      out date,
        P_created_by                   out varchar2,
        P_updated                      out date,
        P_updated_by                   out varchar2,
        p_checklist_category           out varchar2,
        p_db_name                      out varchar2,
        p_host_name                    out varchar2,
        p_dc_location                  out varchar2,
        p_request_id                   out number,
        p_task_desc                     out varchar2
    )
    is
    begin
        for c1 in (select * from CHARTER2_SQL.v_mssql_check_list where id = p_id) loop
            p_checklist_type := c1.checklist_type;
            p_db_install_status := c1.db_install_status;
            p_checklist_category := c1.checklist_category;
            p_host_name := c1.host_name;
            p_db_name := c1.db_name;
            p_dc_location := c1.dc_location;
            p_request_id := c1.request_id;
            p_task_desc :=c1.task_desc;
        end loop;
    end get_row;


    procedure update_row  (
        p_id                           out number,
        p_checklist_type               in varchar2 default null,
        p_db_install_status            in varchar2 default null,
        p_checklist_category           in varchar2 default null,
        p_db_name                      in varchar2 default null,
        p_host_name                    in varchar2 default null,
        p_dc_location                  in varchar2 default null,
        p_request_id                   in number default null,  
        p_task_desc                    in varchar2 default null

    )
    is
    begin
        update  CHARTER2_SQL.v_mssql_check_list set
            checklist_type = nvl(p_checklist_type,checklist_type),
            checklist_category = nvl(p_checklist_category,checklist_category) ,
            db_name = nvl(p_db_name,db_name),
            host_name = nvl(p_host_name, host_name),
            dc_location = nvl(p_dc_location, dc_location),
            request_id = nvl(p_request_id,request_id),
            task_desc = nvl(p_task_desc,task_desc)
        where id = p_id;
    end update_row;

  procedure insert_row  (
        p_id                           out number,
        p_checklist_type               in varchar2 default null,
        p_db_install_status            in varchar2 default null,
        p_checklist_category           in varchar2 default null,
        p_db_name                      in varchar2 default null,
        p_host_name                    in varchar2 default null,
        p_dc_location                  in varchar2 default null,
        p_request_id                   in number default null,
        p_task_desc                    in varchar2 default null
    ) as
  begin
    -- TODO: Implementation required for procedure V_DB_CHECK_LIST_API.insert_row
    null;
        insert into CHARTER2_SQL.v_mssql_check_list (
            checklist_type,
            db_install_status,
            checklist_category,
            db_name,
            host_name,
            dc_location,
            request_id,
            task_desc
        ) values (
            p_checklist_type,
            p_db_install_status,
            p_checklist_category,
            p_db_name,
            p_host_name,
            p_dc_location,
            p_request_id,
            p_task_desc
        ) returning id into p_id ;
    
    
    
  end insert_row;
  
  procedure delete_row(
      p_id                           in number
      ) as
  
  begin
        delete from CHARTER2_SQL.v_mssql_check_list where id = p_id;

 end delete_row;

end V_MSSQL_CHECK_LIST_API;

/
--------------------------------------------------------
--  DDL for Synonymn MSSQL_APPLICATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_APPLICATION" FOR "CHARTER2_SQL"."MV_APPLICATION";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_DATABASEINFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_DATABASEINFO" FOR "CHARTER2_SQL"."MV_DATABASEINFO";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_INSTANCEINFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_INSTANCEINFO" FOR "CHARTER2_SQL"."MV_INSTANCEINFO";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_SERVERINFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_SERVERINFO" FOR "CHARTER2_SQL"."MV_SERVERINFO";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_XREFAPPLICATIONINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_XREFAPPLICATIONINSTANCE" FOR "CHARTER2_SQL"."MV_XREFAPPLICATIONINSTANCE";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_XREFAPPLICATIONSERVER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_XREFAPPLICATIONSERVER" FOR "CHARTER2_SQL"."MV_XREFAPPLICATIONSERVER";
--------------------------------------------------------
--  DDL for Synonymn MSSQL_XREFSERVERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."MSSQL_XREFSERVERINSTANCE" FOR "CHARTER2_SQL"."MV_XREFSERVERINSTANCE";
--------------------------------------------------------
--  DDL for Synonymn OAC$ANSIBLE_REST_UTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."OAC$ANSIBLE_REST_UTL" FOR "CHARTER2_INV"."OAC$ANSIBLE_REST_UTL";
--------------------------------------------------------
--  DDL for Synonymn OAC$ANSIBLE_UTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."OAC$ANSIBLE_UTL" FOR "CHARTER2_INV"."OAC$ANSIBLE_UTL";
--------------------------------------------------------
--  DDL for Synonymn V_APP_SETTINGS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."V_APP_SETTINGS" FOR "CHARTER2_INV"."V_APP_SETTINGS";
--------------------------------------------------------
--  DDL for Synonymn V_SELF_SERVICE_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CHARTER2_SQL"."V_SELF_SERVICE_STATUS" FOR "CHARTER2_INV"."V_SELF_SERVICE_STATUS";
--------------------------------------------------------
--  Constraints for Table MV_SERVERINFO
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_SERVERINFO" MODIFY ("ServerID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_PATCH_LOOKUP_TBL
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_PATCH_LOOKUP_TBL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_LOOKUP_TBL" ADD CONSTRAINT "LOOKUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DATABASEINFO
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."DATABASEINFO" MODIFY ("SERVERNAME" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."DATABASEINFO" MODIFY ("INSTANCENAME" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."DATABASEINFO" MODIFY ("DBID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_MSSQL_CHECK_LIST
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" MODIFY ("UPDATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" MODIFY ("UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST" ADD CONSTRAINT "V_DB_CHECK_LIST_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table V_REQUEST_QUEUE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_REQUEST_QUEUE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_REQUEST_QUEUE" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_REQUEST_QUEUE" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_REQUEST_QUEUE" ADD CONSTRAINT "V_REQUEST_QUEUE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SERVERLIST
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."SERVERLIST" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_ANSIBLE_TEMPLATE_STORE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" MODIFY ("TEMPLATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" MODIFY ("TEMPLATE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" MODIFY ("TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" ADD CONSTRAINT "V_ANSIBLE_TEMPLATE_STORE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CHARTER2_SQL"."V_ANSIBLE_TEMPLATE_STORE" ADD CONSTRAINT "V_ANSIBLE_TEMPLATE_STORE_UK1" UNIQUE ("TEMPLATE_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table MV_DATABASEINFO
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_DATABASEINFO" MODIFY ("ServerName" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_DATABASEINFO" MODIFY ("InstanceName" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_DATABASEINFO" MODIFY ("DBID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MV_XREFAPPLICATIONSERVER
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONSERVER" MODIFY ("AppServXID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONSERVER" MODIFY ("AppId" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONSERVER" MODIFY ("ServerID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SOURCE_APP_UPDATE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."SOURCE_APP_UPDATE" ADD CONSTRAINT "SOURCE_APP_UPDATE_PK" PRIMARY KEY ("SOURCE_APP_UPDATE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table V_LOV_TBL
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_LOV_TBL" MODIFY ("LOV_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_LOV_TBL" MODIFY ("LOV_VALUE" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_LOV_TBL" MODIFY ("LOV_CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MV_XREFSERVERINSTANCE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_XREFSERVERINSTANCE" MODIFY ("ServInstXID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFSERVERINSTANCE" MODIFY ("ServerID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFSERVERINSTANCE" MODIFY ("InstanceID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_DB_SCHEDULE_TBL
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("SERVERNAME" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("UPDATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" MODIFY ("UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_DB_SCHEDULE_TBL" ADD CONSTRAINT "V_DB_SCHEDULE_TBL_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REQUEST_QUEUE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("REQUEST_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("JOB_URL" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" ADD CONSTRAINT "REQUEST_QUEUE_PK" PRIMARY KEY ("REQUEST_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CHARTER2_SQL"."REQUEST_QUEUE" MODIFY ("TEMPLATE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_MSSQL_CHECK_LIST_LOGS
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_LOGS" MODIFY ("LOG_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_MSSQL_CHECK_LIST_LOGS" MODIFY ("CHECK_LIST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MV_INSTANCEINFO
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_INSTANCEINFO" MODIFY ("InstanceID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_INSTANCEINFO" MODIFY ("InstanceName" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_INSTANCEINFO" MODIFY ("Environment" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_HISTORY
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_HISTORY" ADD CHECK (action in ('I','U','D')) ENABLE;
  ALTER TABLE "CHARTER2_SQL"."V_HISTORY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table V_PATCH_REQUEST_QUEUE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" ADD CONSTRAINT "V_PATCH_REQUEST_QUEUE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_REQUEST_QUEUE" MODIFY ("CREATED_BY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_REQUIREMENTS_SAMPLE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_REQUIREMENTS_SAMPLE" ADD CONSTRAINT "V_REQUIREMENTS_SAMPLE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table V_DB_PATCH_HISTORY
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_DB_PATCH_HISTORY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MV_APPLICATION
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_APPLICATION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_APPLICATION" MODIFY ("AppId" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_APPLICATION" MODIFY ("ApplicationName" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MV_XREFAPPLICATIONINSTANCE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONINSTANCE" MODIFY ("AppInstXID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONINSTANCE" MODIFY ("AppID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."MV_XREFAPPLICATIONINSTANCE" MODIFY ("InstanceID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table V_PATCH_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "CHARTER2_SQL"."V_PATCH_SCHEDULE" MODIFY ("PATCH_SCHED_ID" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_SCHEDULE" MODIFY ("PATCH_DATE" NOT NULL ENABLE);
  ALTER TABLE "CHARTER2_SQL"."V_PATCH_SCHEDULE" MODIFY ("PATCH_LOOKUP_ID" NOT NULL ENABLE);
