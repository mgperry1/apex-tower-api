set define off 
CREATE OR REPLACE  PACKAGE "CHARTER2_INV"."LICENSE_MGR" AS 
 
  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
procedure Load_license_data(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);

procedure demo_data(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);


procedure load_json(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
procedure check_schedule(
        p_action   IN VARCHAR2 DEFAULT NULL,
        p_baseline in NUMBER default null,
        p_host IN VARCHAR2 DEFAULT NULL,
        p_parm1 IN VARCHAR2 DEFAULT NULL,
        p_parm2 IN VARCHAR2 DEFAULT NULL,
        p_debug IN VARCHAR2 DEFAULT 'N'
);

END LICENSE_MGR;

/
