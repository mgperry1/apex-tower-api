set define off
CREATE OR REPLACE EDITIONABLE PACKAGE "CHARTER2_INV"."ITSM_UTILITY" AS 

  g_content_type            varchar2(50)  :=  'application/json' ;
  g_endpoint_prefix         varchar2(255) ;
  g_wallet_path             varchar2(255) ;
  g_wallet_pass             varchar2(255)  ;
  p_username                varchar2(255)  ;
  p_password                varchar2(255)  ;
  g_itsm_domain            varchar2(255);
  g_itsm_url               varchar2(255);

procedure LOAD_ITSM_DATA(p_action in varchar2 default 'LOAD',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
) ;


PROCEDURE do_rest_call (
        p_url            IN VARCHAR2,
        p_http_method    IN VARCHAR2 DEFAULT 'GET',
        p_content_type   IN VARCHAR2 DEFAULT g_content_type,
        p_body           IN CLOB DEFAULT NULL,
        p_run_id         IN NUMBER,
        p_response       OUT CLOB
    );

procedure config(p_action in varchar2 default 'INIT_SNOW',
p_parm1 in varchar2 default null,
p_parm2 in varchar2 default null,
p_parm3 in varchar2 default null
) ;          




END ITSM_UTILITY;
/
