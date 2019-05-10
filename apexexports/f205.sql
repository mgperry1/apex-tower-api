prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.45'
,p_default_workspace_id=>20634831057635676
,p_default_application_id=>205
,p_default_owner=>'CHARTER2_INV'
);
end;
/
 
prompt APPLICATION 205 - App Updates - charter2_inv
--
-- Application Export:
--   Application:     205
--   Name:            App Updates - charter2_inv
--   Date and Time:   07:30 Wednesday May 8, 2019
--   Exported By:     MPERRY
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         18.1.0.00.45
--   Instance ID:     227374925641171
--

-- Application Statistics:
--   Pages:                      4
--     Items:                   13
--     Processes:                7
--     Regions:                  7
--     Buttons:                  6
--   Shared Components:
--     Logic:
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--       Authorization:          2
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              15
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   1
--       Shortcuts:              1
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included
--     Install scripts:          3

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,205)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'CHARTER2_INV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'App Updates - charter2_inv')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'205')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'668689BCB343187D4AF288EF44F1B486D565EDD12C0BA67F66FE16856ED9A462'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MON-YYYY'
,p_date_time_format=>'DD-MON-YYYY'
,p_timestamp_format=>'DD-MON-YYYY'
,p_timestamp_tz_format=>'DD-MON-YYYY'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2019.04.23.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(45907767445619725)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Charter2_inv - Deploy'
,p_app_builder_icon_name=>'app-icon.svg'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Charter2_inv - Deploy'
,p_last_updated_by=>'MPERRY'
,p_last_upd_yyyymmddhh24miss=>'20190508072929'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(45908592538619731)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46038767142620044)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46070046641895529)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Setup App Deploy'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_security_scheme=>wwv_flow_api.id(46070570021954721)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(46028306893619938)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46040387546620061)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46040834510620061)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(46040387546620061)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(46041248936620062)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(46040387546620061)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B222076696577426F783D223020302036342036';
wwv_flow_api.g_varchar2_table(2) := '34223E3C646566733E3C7374796C653E2E636C732D317B66696C6C3A75726C282372616469616C2D6772616469656E74293B7D2E636C732D327B6F7061636974793A302E313B7D2E636C732D332C2E636C732D347B66696C6C3A236666663B7D2E636C73';
wwv_flow_api.g_varchar2_table(3) := '2D337B6F7061636974793A302E363B7D3C2F7374796C653E3C72616469616C4772616469656E742069643D2272616469616C2D6772616469656E74222063783D223332222063793D222E30352220723D22363422206772616469656E74556E6974733D22';
wwv_flow_api.g_varchar2_table(4) := '7573657253706163654F6E557365223E3C73746F70206F66667365743D2230222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D22302E3135222F3E3C73746F70206F66667365743D222E35222073746F702D636F6C6F72';
wwv_flow_api.g_varchar2_table(5) := '3D2223666666222073746F702D6F7061636974793D22302E31222F3E3C73746F70206F66667365743D2231222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D2230222F3E3C2F72616469616C4772616469656E743E3C73';
wwv_flow_api.g_varchar2_table(6) := '796D626F6C2069643D22616D6269656E742D6C69676874696E67222076696577426F783D22302030203634203634223E3C7061746820636C6173733D22636C732D312220643D224D302030683634763634682D36347A222F3E3C2F73796D626F6C3E3C2F';
wwv_flow_api.g_varchar2_table(7) := '646566733E3C7469746C653E6261722D6C696E652D63686172743C2F7469746C653E3C726563742077696474683D22363422206865696768743D223634222066696C6C3D2223453935423534222F3E3C672069643D2269636F6E73223E3C706174682063';
wwv_flow_api.g_varchar2_table(8) := '6C6173733D22636C732D322220643D224D313920343668357631682D357A4D323620343668357631682D357A4D333320343668357631682D357A4D343020343668357631682D357A222F3E3C7061746820636C6173733D22636C732D332220643D224D31';
wwv_flow_api.g_varchar2_table(9) := '3920333868357638682D357A4D32362033326835763134682D357A4D33332033326835763134682D357A4D34302032376835763139682D357A222F3E3C6720636C6173733D22636C732D32223E3C636972636C652063783D2234322E35222063793D2232';
wwv_flow_api.g_varchar2_table(10) := '302E352220723D22312E35222F3E3C636972636C652063783D2233352E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D2232382E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D22';
wwv_flow_api.g_varchar2_table(11) := '32312E35222063793D2233312E352220723D22312E35222F3E3C7061746820643D224D32312E3832352033312E3837396C2D2E36352D2E37353820372E31342D362E31323168372E3032356C362E3836392D342E3930372E3538322E3831342D372E3133';
wwv_flow_api.g_varchar2_table(12) := '3120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C636972636C6520636C6173733D22636C732D34222063783D2234322E35222063793D2231392E352220723D22312E35222F3E3C636972636C6520636C6173733D22';
wwv_flow_api.g_varchar2_table(13) := '636C732D34222063783D2233352E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C6173733D22636C732D34222063783D2232382E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C617373';
wwv_flow_api.g_varchar2_table(14) := '3D22636C732D34222063783D2232312E35222063793D2233302E352220723D22312E35222F3E3C7061746820636C6173733D22636C732D342220643D224D32312E3832352033302E3837396C2D2E36352D2E37353820372E31342D362E31323168372E30';
wwv_flow_api.g_varchar2_table(15) := '32356C362E3836392D342E3930372E3538322E3831342D372E31333120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C7573652077696474683D22363422206865696768743D2236342220786C696E6B3A687265663D';
wwv_flow_api.g_varchar2_table(16) := '2223616D6269656E742D6C69676874696E67222069643D226C69676874696E67222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(46029651802619985)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20234539354235343B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(46029909914619988)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45905622340619716)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45905901967619720)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45906202699619720)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45906592748619720)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45906816237619721)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45907176953619721)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45907467698619721)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(46031267767619989)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/mperry
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(46070570021954721)
,p_name=>'MPERRY'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'select 1 from dual where :app_user = ''MPERRY'''
,p_error_message=>'not authorized'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(46033992049620023)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(46033992049620023)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(46034317083620026)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(46031832893619993)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(45908089402619728)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(45908289064619729)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45908832013619740)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45909172387619755)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45909434945619755)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45909765265619756)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45910042264619756)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45910305909619756)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45910664338619756)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45910966099619757)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45911221338619757)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45911507172619757)
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45911985270619763)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'      <div class="t-Dialog-bodyWrapperIn"><div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'      </div></div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45912256045619766)
,p_page_template_id=>wwv_flow_api.id(45911985270619763)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45912548049619767)
,p_page_template_id=>wwv_flow_api.id(45911985270619763)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45912869892619767)
,p_page_template_id=>wwv_flow_api.id(45911985270619763)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45913407141619767)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45913750435619770)
,p_page_template_id=>wwv_flow_api.id(45913407141619767)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45914080345619770)
,p_page_template_id=>wwv_flow_api.id(45913407141619767)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45914269732619771)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'      <div class="t-Dialog-bodyWrapperIn"><div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'      </div></div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45914537943619771)
,p_page_template_id=>wwv_flow_api.id(45914269732619771)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45914811259619771)
,p_page_template_id=>wwv_flow_api.id(45914269732619771)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45915165415619772)
,p_page_template_id=>wwv_flow_api.id(45914269732619771)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45915718712619772)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45916099775619773)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45916338332619773)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45916637838619774)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45916992048619774)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45917273535619774)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45917595254619774)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45917899819619774)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45918160997619775)
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45918527911619775)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45918871351619776)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45919165958619776)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45919457956619776)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45919786300619776)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45920003181619776)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45920349041619777)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45920640907619777)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45920920332619778)
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45921379746619778)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>  ',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45921670862619779)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45921994658619779)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45922297310619779)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45922524822619779)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45922807572619779)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45923109999619780)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45923417978619780)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45923785247619780)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45924012864619780)
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45924435786619781)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          <div class="t-Footer-body">',
'            <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'            <div class="t-Footer-apex">',
'              <div class="t-Footer-version">#APP_VERSION#</div>  ',
'              <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'              #BUILT_WITH_LOVE_USING_APEX#',
'            </div>',
'          </div>',
'          <div class="t-Footer-top">',
'            <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'          </div>',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45924778666619781)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45925028894619781)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45925304272619782)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45925652246619782)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45925968070619782)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45926239588619782)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45926529873619782)
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(45926996490619783)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          <div class="t-Footer-body">',
'            <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'            <div class="t-Footer-apex">',
'              <div class="t-Footer-version">#APP_VERSION#</div>  ',
'              <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'              #BUILT_WITH_LOVE_USING_APEX#',
'            </div>',
'          </div>',
'          <div class="t-Footer-top">',
'            <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'          </div>',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45927280211619783)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45927566288619784)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45927836675619784)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45928132260619784)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45928457538619785)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45928784998619785)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(45929050544619785)
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(46006646022619877)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(46006715535619879)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(46006850640619879)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45929419446619786)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45929719189619791)
,p_plug_template_id=>wwv_flow_api.id(45929419446619786)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45933110191619796)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45933393005619796)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45933623746619797)
,p_plug_template_id=>wwv_flow_api.id(45933393005619796)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45933907521619797)
,p_plug_template_id=>wwv_flow_api.id(45933393005619796)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45934127096619797)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45934444958619797)
,p_plug_template_id=>wwv_flow_api.id(45934127096619797)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45934759447619797)
,p_plug_template_id=>wwv_flow_api.id(45934127096619797)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45936355987619800)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45936656650619800)
,p_plug_template_id=>wwv_flow_api.id(45936355987619800)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45936993263619801)
,p_plug_template_id=>wwv_flow_api.id(45936355987619800)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45943590397619809)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45943853942619809)
,p_plug_template_id=>wwv_flow_api.id(45943590397619809)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45944195323619809)
,p_plug_template_id=>wwv_flow_api.id(45943590397619809)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45948122099619812)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header"><h1 class="t-ContentBlock-title">#TITLE#</h1></div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45949988792619814)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45950277814619814)
,p_plug_template_id=>wwv_flow_api.id(45949988792619814)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45951434337619815)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45951793842619815)
,p_plug_template_id=>wwv_flow_api.id(45951434337619815)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45953538671619817)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45954142845619817)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45954462431619817)
,p_plug_template_id=>wwv_flow_api.id(45954142845619817)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45954692245619818)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45954939330619818)
,p_plug_template_id=>wwv_flow_api.id(45954692245619818)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45955262748619818)
,p_plug_template_id=>wwv_flow_api.id(45954692245619818)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45961428524619823)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45961739485619824)
,p_plug_template_id=>wwv_flow_api.id(45961428524619823)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45962077806619824)
,p_plug_template_id=>wwv_flow_api.id(45961428524619823)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45964017922619825)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(45965081204619826)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(45965371915619827)
,p_plug_template_id=>wwv_flow_api.id(45965081204619826)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45985749550619849)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45987354740619854)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45988585309619856)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45989528149619857)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45993547946619861)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45995993132619863)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45996318659619863)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45997369379619864)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(45997533661619865)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(46002512340619869)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(46004180564619871)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(46004399763619871)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45966390693619828)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45966958702619832)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45969717979619834)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45971709994619836)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45973502334619838)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45977113437619841)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(45977113437619841)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45979722904619844)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45980560122619844)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45980718690619845)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(45985564764619848)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46005939590619873)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006084122619875)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006126372619875)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006259718619876)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006383717619876)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006484686619876)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(46006513260619876)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(46007502267619880)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(46007786316619888)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(46007674359619883)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(46008917422619901)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(45926996490619783)
,p_default_dialog_template=>wwv_flow_api.id(45911985270619763)
,p_error_template=>wwv_flow_api.id(45913407141619767)
,p_printer_friendly_template=>wwv_flow_api.id(45926996490619783)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(45913407141619767)
,p_default_button_template=>wwv_flow_api.id(46006715535619879)
,p_default_region_template=>wwv_flow_api.id(45954692245619818)
,p_default_chart_template=>wwv_flow_api.id(45954692245619818)
,p_default_form_template=>wwv_flow_api.id(45954692245619818)
,p_default_reportr_template=>wwv_flow_api.id(45954692245619818)
,p_default_tabform_template=>wwv_flow_api.id(45954692245619818)
,p_default_wizard_template=>wwv_flow_api.id(45954692245619818)
,p_default_menur_template=>wwv_flow_api.id(45964017922619825)
,p_default_listr_template=>wwv_flow_api.id(45954692245619818)
,p_default_irr_template=>wwv_flow_api.id(45953538671619817)
,p_default_report_template=>wwv_flow_api.id(45977113437619841)
,p_default_label_template=>wwv_flow_api.id(46006259718619876)
,p_default_menu_template=>wwv_flow_api.id(46007502267619880)
,p_default_calendar_template=>wwv_flow_api.id(46007674359619883)
,p_default_list_template=>wwv_flow_api.id(46004399763619871)
,p_default_nav_list_template=>wwv_flow_api.id(45996318659619863)
,p_default_top_nav_list_temp=>wwv_flow_api.id(45996318659619863)
,p_default_side_nav_list_temp=>wwv_flow_api.id(45995993132619863)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(45934127096619797)
,p_default_dialogr_template=>wwv_flow_api.id(45933110191619796)
,p_default_option_label=>wwv_flow_api.id(46006259718619876)
,p_default_required_label=>wwv_flow_api.id(46006513260619876)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(45997369379619864)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.2/')
,p_files_version=>62
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(46007910138619891)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(46008117587619892)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(46008361401619892)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(46008518974619892)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(46008794790619892)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45930069974619793)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45930611912619794)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45931029274619794)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45931692740619795)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45935001172619798)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45935488107619798)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45937205775619801)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45938210102619802)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45939630746619804)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45940893875619807)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45941410610619807)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45941819262619807)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45945258488619810)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45948484204619813)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45949234873619813)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45950901051619815)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45952260625619816)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45962576467619824)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45962940230619824)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45963391958619825)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45965626622619827)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45966665921619832)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45967202992619833)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45968425317619834)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45970059467619835)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45975674855619840)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45977413345619842)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45977821541619842)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45978621856619843)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45980091823619844)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45981605233619845)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45982896021619846)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45983625318619847)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45986078914619853)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45986400980619853)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45987685308619855)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45989864741619858)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45990281501619858)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45992028875619859)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45994899985619862)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45998489886619866)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(45999686643619867)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46000486768619867)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46005478929619872)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46007097169619880)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46009116681619918)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46009533836619918)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46011146546619919)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46011558563619920)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46013101155619921)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46013523888619921)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46015143665619923)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46015559518619923)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46017148205619924)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46017548943619924)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46017996897619925)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46018355459619925)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46018730221619925)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46019146639619926)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46019596438619926)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46020921047619927)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46022334717619928)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46023398009619929)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46023731698619929)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46024153376619930)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46024536903619930)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46025164789619930)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46025753000619931)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46026194244619931)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46026551604619931)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46026940794619932)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(46027771083619933)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45911890720619762)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45908832013619740)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45913135152619767)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(45911985270619763)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45913377508619767)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(45911985270619763)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45915493385619772)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(45914269732619771)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45915646892619772)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(45914269732619771)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45918424113619775)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45915718712619772)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45921234626619778)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45918527911619775)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45924325716619780)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45921379746619778)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45926881605619783)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45924435786619781)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45929351954619785)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(45926996490619783)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45930218238619793)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(45930069974619793)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45930403409619794)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45930872551619794)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(45930611912619794)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45931240469619794)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(45931029274619794)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45931456303619795)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(45930611912619794)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45931808760619795)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(45931692740619795)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45932084865619795)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(45931029274619794)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45932237319619795)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(45930611912619794)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45932425496619796)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(45930069974619793)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45932658497619796)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(45931029274619794)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45932841068619796)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(45931029274619794)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45933080071619796)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45929419446619786)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(45931692740619795)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45935203046619798)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45934127096619797)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45935601450619799)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(45934127096619797)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(45935488107619798)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45935896364619799)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(45934127096619797)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45936027406619799)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(45934127096619797)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(45935488107619798)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45936261554619799)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45934127096619797)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45937488370619801)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45937689336619802)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45937801878619802)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45938085400619802)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45938446369619802)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(45938210102619802)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45938664615619803)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(45938210102619802)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45938899113619803)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(45938210102619802)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45939004213619803)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(45938210102619802)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45939272865619804)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45939454068619804)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45939859847619804)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45940090740619806)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45940285060619806)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45940451015619806)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45940649465619806)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45941030175619807)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(45940893875619807)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45941248418619807)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(45940893875619807)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45941656864619807)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45942051933619807)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(45941819262619807)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45942277671619808)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45942468763619808)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45942627782619808)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(45941819262619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45942873505619808)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45943005386619808)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45943206950619808)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45943472926619809)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45936355987619800)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45944461667619809)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45944657106619810)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45944820008619810)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45945078028619810)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45945443565619810)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(45945258488619810)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45945693727619810)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(45945258488619810)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45945883697619810)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45946018858619811)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45946244370619811)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45946499852619811)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45946657222619811)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45946835037619811)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45947067301619811)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45947255574619812)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45947493435619812)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45947660448619812)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45947885093619812)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45948093569619812)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45943590397619809)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45948623570619813)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(45948484204619813)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45948856571619813)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(45948484204619813)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45949044832619813)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(45948484204619813)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45949466083619813)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(45949234873619813)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45949620368619813)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45949841299619814)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45948122099619812)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(45949234873619813)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45950553243619814)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45949988792619814)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45950714617619815)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45949988792619814)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45951171382619815)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45949988792619814)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(45950901051619815)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45951304194619815)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45949988792619814)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45952015033619816)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45952492502619816)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(45952260625619816)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45952600906619816)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(45952260625619816)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45952811991619816)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(45952260625619816)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45953001746619816)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45953207051619816)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45953420478619817)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45951434337619815)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45953878850619817)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45953538671619817)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45954093523619817)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45953538671619817)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45955556995619819)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45955754940619819)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45955980842619819)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45956168133619819)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(45937205775619801)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45956343575619819)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45956585490619819)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45956724910619820)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45956929952619820)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45957151445619820)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45957365864619820)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45957525636619820)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45957721261619820)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45957903553619820)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45958146928619821)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45958395383619821)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45958524656619821)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45958762579619821)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45958937339619821)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45959156918619822)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45959372911619822)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(45939630746619804)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45959551291619822)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45959734148619822)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(45941819262619807)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45959902779619822)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45960150571619822)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45960353150619822)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45960528540619823)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(45941819262619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45960776304619823)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(45941410610619807)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45960983020619823)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45961138487619823)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45961319029619823)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(45954692245619818)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(45935001172619798)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45962315998619824)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45962727353619824)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(45962576467619824)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45963117217619825)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(45962940230619824)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45963597626619825)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(45963391958619825)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45963782596619825)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(45963391958619825)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45963900280619825)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45961428524619823)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(45962940230619824)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45964327383619826)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45964017922619825)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45964539982619826)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45964017922619825)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45964746555619826)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45964017922619825)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(45948484204619813)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45964934593619826)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(45964017922619825)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(45948484204619813)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45965828624619827)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(45965081204619826)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(45965626622619827)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45966064864619827)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45965081204619826)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(45965626622619827)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45966220200619827)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(45965081204619826)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45966883474619832)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(45966390693619828)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45967484337619833)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45967676182619833)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45967813105619833)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45968021794619833)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45968286911619833)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45968625709619834)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(45968425317619834)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45968872884619834)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45969038673619834)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45969292252619834)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45969468104619834)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45969678671619834)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45966958702619832)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45970276089619835)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45970486408619835)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45970671222619835)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45970826377619835)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45971004528619835)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45971251839619836)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45971430673619836)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45971615490619836)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45969717979619834)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45972023124619836)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45972208787619837)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45972430432619837)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45972614013619837)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45972858558619837)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45973047295619838)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45973236221619838)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45973458513619838)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45971709994619836)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(45970059467619835)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45973890344619838)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45974075762619838)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45974248592619839)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45974433691619839)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45974645430619839)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45974877826619839)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45975032432619840)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45975203558619840)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45975437976619840)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45975838633619840)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(45975674855619840)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45976000079619840)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(45975674855619840)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45976290757619841)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(45975674855619840)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45976408948619841)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45976674161619841)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(45975674855619840)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45976899227619841)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(45975674855619840)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45977089282619841)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45973502334619838)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45977697757619842)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(45977413345619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45978007916619842)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(45977821541619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45978286534619843)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(45977821541619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45978417734619843)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(45977821541619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45978841126619843)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(45978621856619843)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45979009705619843)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(45978621856619843)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45979286104619843)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(45977413345619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45979431544619844)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45979656213619844)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45977113437619841)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(45977821541619842)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45980219949619844)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45979722904619844)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(45980091823619844)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45980427366619844)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45979722904619844)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(45980091823619844)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45981057247619845)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45981246397619845)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45981487788619845)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45981868159619845)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(45981605233619845)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45982023007619846)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(45981605233619845)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45982249458619846)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45982494357619846)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45982694372619846)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45983085254619846)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(45982896021619846)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45983226872619847)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(45982896021619846)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45983477410619847)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(45982896021619846)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45983872624619847)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(45983625318619847)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45984047937619847)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(45983625318619847)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45984274683619847)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45984455215619848)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45984604172619848)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(45966665921619832)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45984894912619848)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45985056262619848)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(45982896021619846)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45985287141619848)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(45967202992619833)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45985496808619848)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(45980718690619845)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45986289037619853)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45985749550619849)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(45986078914619853)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45986686282619854)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45985749550619849)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(45986400980619853)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45986836416619854)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45985749550619849)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(45986078914619853)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45987045094619854)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45985749550619849)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(45986400980619853)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45987202285619854)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45985749550619849)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(45986400980619853)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45987862239619855)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45987354740619854)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(45987685308619855)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45988094792619855)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45987354740619854)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(45987685308619855)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45988248904619856)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45987354740619854)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(45987685308619855)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45988408047619856)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45987354740619854)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45988858647619856)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45988585309619856)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45989061169619857)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45988585309619856)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45989250668619857)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45988585309619856)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45989487949619857)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45988585309619856)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45990061352619858)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45990413657619858)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45990635585619858)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45990845825619858)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45991073269619859)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45991207240619859)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45991460333619859)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45991630933619859)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45991810046619859)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45992289548619860)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(45992028875619859)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45992406076619860)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(45992028875619859)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45992665372619860)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(45992028875619859)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45992851768619860)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45993095752619860)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(45992028875619859)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45993230132619860)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(45992028875619859)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45993449366619861)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45989528149619857)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45993839621619861)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45994023693619861)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45994289706619861)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45994469653619861)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45994608496619862)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45995063663619862)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(45994899985619862)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45995298505619862)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45995409794619862)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45995658288619862)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45995859216619862)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45993547946619861)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45996229693619863)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45995993132619863)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45996690885619864)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(45996318659619863)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45996866808619864)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(45996318659619863)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45997008929619864)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(45996318659619863)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45997237828619864)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(45996318659619863)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45997895286619865)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45998052991619866)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45998281355619866)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45998672587619866)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(45998489886619866)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45998885193619866)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(45998489886619866)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45999021196619866)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45999294816619867)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45999467222619867)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(45999813718619867)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(45999686643619867)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46000029199619867)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(45999686643619867)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46000273772619867)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(45999686643619867)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46000699261619868)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(46000486768619867)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46000853214619868)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(46000486768619867)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46001025171619868)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46001281482619868)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46001436142619868)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46001695577619869)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46001868752619869)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(45999686643619867)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46002078837619869)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46002205657619869)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46002409676619869)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(45997533661619865)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46002849758619870)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(45990281501619858)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46003074161619870)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(46000486768619867)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46003250752619870)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(46000486768619867)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46003442411619870)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(45994899985619862)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46003662243619871)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46003872325619871)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46004001136619871)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(46002512340619869)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(45994899985619862)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46004688859619872)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(45989864741619858)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46004837453619872)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46005040355619872)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46005284405619872)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46005631531619872)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(46005478929619872)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46005850588619873)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(46004399763619871)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(46005478929619872)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46007271878619880)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(46006850640619879)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(46007097169619880)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46007409994619880)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(46006850640619879)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(46007097169619880)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46009308218619918)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(46009116681619918)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46009782004619918)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(46009533836619918)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46009925979619918)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(46009116681619918)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46010114961619919)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(46009533836619918)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46010348121619919)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(46009116681619918)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46010522399619919)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(46009533836619918)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46010735786619919)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(46009116681619918)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46010952314619919)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(46009533836619918)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46011316894619920)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(46011146546619919)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46011723573619920)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(46011558563619920)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46011995641619920)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(46011146546619919)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46012107941619920)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(46011558563619920)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46012389855619920)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(46011146546619919)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46012571318619921)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(46011558563619920)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46012701627619921)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(46011146546619919)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46012913675619921)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(46011558563619920)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46013334941619921)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(46013101155619921)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46013783311619922)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(46013523888619921)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46013921733619922)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(46013101155619921)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46014125805619922)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(46013523888619921)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46014359381619922)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(46013101155619921)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46014508738619922)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(46013523888619921)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46014733298619922)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(46013101155619921)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46014976124619922)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(46013523888619921)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46015327437619923)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(46015143665619923)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46015712348619923)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(46015559518619923)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46015948109619923)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(46015143665619923)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46016170478619923)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(46015559518619923)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46016362702619924)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(46015143665619923)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46016565676619924)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(46015559518619923)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46016793716619924)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(46015143665619923)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46016915704619924)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(46015559518619923)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46017317602619924)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(46017148205619924)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46017755224619925)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(46017548943619924)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46018102982619925)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(46017996897619925)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46018592613619925)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(46018355459619925)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46018955167619926)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(46018730221619925)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46019327203619926)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(46019146639619926)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46019784378619926)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(46019596438619926)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46019908354619926)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(46019596438619926)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46020108401619926)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(46017548943619924)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46020382890619927)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(46017996897619925)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46020542417619927)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(46018355459619925)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46020736125619927)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(46018730221619925)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46021188275619927)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(46020921047619927)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46021316008619927)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(46020921047619927)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46021598983619927)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(46020921047619927)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46021734950619928)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(46017148205619924)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46021949669619928)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(46019596438619926)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46022152186619928)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(46019146639619926)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46022565707619928)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(46022334717619928)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46022796784619928)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(46017148205619924)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46022993862619929)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(46019146639619926)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46023154311619929)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(46017148205619924)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46023550696619929)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(46023398009619929)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46023974227619929)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(46023731698619929)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46024353073619930)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(46024153376619930)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46024777233619930)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(46024536903619930)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46024915704619930)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(46024536903619930)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46025327737619930)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(46025164789619930)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46025509160619931)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(46023731698619929)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46025950457619931)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(46025753000619931)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46026320709619931)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(46026194244619931)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46026779460619931)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(46026551604619931)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46027158270619932)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(46026940794619932)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46027376533619932)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46027584368619933)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(46025753000619931)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(46027998122619933)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(46027771083619933)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(46031691264619992)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(45907767445619725)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(46028634915619939)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(45908592538619731)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(45995993132619863)
,p_nav_list_template_options=>'#DEFAULT#'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(46028306893619938)
,p_nav_bar_list_template_id=>wwv_flow_api.id(45997369379619864)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(46028634915619939)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'MPERRY'
,p_last_upd_yyyymmddhh24miss=>'20190423180546'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(46028634915619939)
,p_name=>'App Updates - charter2_inv '
,p_alias=>'HOME'
,p_step_title=>'App Updates - charter2_inv '
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'MPERRY'
,p_last_upd_yyyymmddhh24miss=>'20190424064152'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46039736147620049)
,p_plug_name=>'App Updates - charter2_inv '
,p_icon_css_classes=>'fa-gears'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45949988792619814)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46055504925845306)
,p_plug_name=>'List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45953538671619817)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    source_app_update_id,',
'    app_version,',
'    released_dt,',
'    active,',
'    applied_dt,',
'    updated,',
'    updated_by,',
'    summary,',
'    description,',
'    file_list',
'FROM',
'    source_app_update'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(46055614589845307)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MPERRY'
,p_internal_uid=>46055614589845307
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46055732896845308)
,p_db_column_name=>'SOURCE_APP_UPDATE_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Source App Update Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46055872109845309)
,p_db_column_name=>'APP_VERSION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Update Version'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46055937697845310)
,p_db_column_name=>'RELEASED_DT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Released'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056074540845311)
,p_db_column_name=>'ACTIVE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Active'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056446971845315)
,p_db_column_name=>'SUMMARY'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Summary'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:P1_SOURCE_APP_UPDATE_ID:#SOURCE_APP_UPDATE_ID#'
,p_column_linktext=>'#SUMMARY#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056159559845312)
,p_db_column_name=>'APPLIED_DT'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Applied'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056242961845313)
,p_db_column_name=>'UPDATED'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056361486845314)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056542925845316)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Description'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46056646159845317)
,p_db_column_name=>'FILE_LIST'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'File List'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(46084851194070117)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'460849'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_view_mode=>'REPORT'
,p_report_columns=>'APP_VERSION:SUMMARY:RELEASED_DT:ACTIVE:APPLIED_DT:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46056773360845318)
,p_plug_name=>'Details of Update'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45954692245619818)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1_SOURCE_APP_UPDATE_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46057082391845321)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46056773360845318)
,p_button_name=>'Close'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_image_alt=>'Close'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:P1_SOURCE_APP_UPDATE_ID:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46056843191845319)
,p_name=>'P1_SOURCE_APP_UPDATE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46056773360845318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46056978143845320)
,p_name=>'P1_DESCRIPTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46056773360845318)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    description',
'FROM',
'    source_app_update',
'    where',
'     source_app_update_id = :P1_source_app_update_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>120
,p_cHeight=>7
,p_field_template=>wwv_flow_api.id(46006126372619875)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(46028634915619939)
,p_name=>'App Update'
,p_step_title=>'App Update'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'MPERRY'
,p_last_upd_yyyymmddhh24miss=>'20190503131442'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45618600590212550)
,p_plug_name=>'App Update List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45953538671619817)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>'select rowid, summary from source_app_update'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(46055046610845301)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MPERRY'
,p_internal_uid=>46055046610845301
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46055183100845302)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46055328456845304)
,p_db_column_name=>'SUMMARY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Summary'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ROWID:#ROWID#'
,p_column_linktext=>'#SUMMARY#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(46068959206876699)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'460690'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:SUMMARY'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46044146506840286)
,p_plug_name=>'App Update'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45954692245619818)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46044686474840287)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(46044146506840286)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P200_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46044805656840288)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46044146506840286)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_SOURCE_APP_UPDATE_ID,P200_ROWID:,'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46044504903840287)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(46044146506840286)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P200_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46044755829840287)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(46044146506840286)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P200_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(46046400004840298)
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46046892469840300)
,p_name=>'P200_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46047200238840324)
,p_name=>'P200_SOURCE_APP_UPDATE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_source=>'SOURCE_APP_UPDATE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46047643562840328)
,p_name=>'P200_APP_VERSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'App Version'
,p_source=>'APP_VERSION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46048041597840329)
,p_name=>'P200_RELEASED_DT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Released Dt'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'RELEASED_DT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46048499610840329)
,p_name=>'P200_ACTIVE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Active'
,p_source=>'ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Active,In-Active'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46050002215840331)
,p_name=>'P200_DESCRIPTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46050492415840331)
,p_name=>'P200_FILE_LIST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File List'
,p_source=>'FILE_LIST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46055430116845305)
,p_name=>'P200_SUMMARY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(46044146506840286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Summary'
,p_source=>'SUMMARY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(46006259718619876)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46053992391840340)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SOURCE_APP_UPDATE'
,p_attribute_02=>'SOURCE_APP_UPDATE'
,p_attribute_03=>'P200_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46054345843840341)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SOURCE_APP_UPDATE'
,p_attribute_02=>'SOURCE_APP_UPDATE'
,p_attribute_03=>'P200_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46054738316840341)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46044755829840287)
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(46028634915619939)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Charter2_inv - Deploy - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(45913407141619767)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'MPERRY'
,p_last_upd_yyyymmddhh24miss=>'20190423180546'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46032834379620018)
,p_plug_name=>'Charter2_inv - Deploy'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45954142845619817)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46037504275620036)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(46032834379620018)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(45933110191619796)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46035642485620031)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(46032834379620018)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(46006715535619879)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46033245725620021)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46032834379620018)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(46005939590619873)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46033676310620022)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46032834379620018)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(46005939590619873)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46034774925620027)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46032834379620018)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(46033992049620023)||'.'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(46005939590619873)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46036475415620034)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46036052990620033)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46037221050620035)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46036848961620034)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(46073915788023149)
);
end;
/
prompt --application/deployment/install/install_charter2_inv_apr23_sql
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(46078002339045140)
,p_install_id=>wwv_flow_api.id(46073915788023149)
,p_name=>'charter2_inv_apr23.sql'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select 1 from  CHARTER2_INV.SOURCE_APP_UPDATE where APP_VERSION = ''v1.Apr23'''
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  P_ACTION VARCHAR2(200);',
'  P_PARM1 VARCHAR2(200);',
'  P_PARM2 VARCHAR2(200);',
'  P_PARM3 VARCHAR2(200);',
'    ',
'BEGIN',
'  P_ACTION := ''DAILY'';',
'  P_PARM1 := NULL;',
'  P_PARM2 := NULL;',
'  P_PARM3 := NULL;',
'',
'  OAC$ANSIBLE_UTL.setup_batch_jobs (  P_ACTION => P_ACTION,',
'P_PARM1 => P_PARM1,',
'P_PARM2 => P_PARM2,',
'P_PARM3 => P_PARM3) ;  ',
' commit;',
'END;',
'/',
'-- Generated by Oracle SQL Developer REST Data Services 18.3.0.277.2354',
'-- Exported REST Definitions from ORDS Schema Version 18.1.1.95.1251',
'-- Schema: CHARTER2_INV   Date: Mon Apr 22 12:56:32 EDT 2019',
'--',
'BEGIN',
'  ORDS.ENABLE_SCHEMA(',
'      p_enabled             => TRUE,',
'      p_schema              => ''CHARTER2_INV'',',
'      p_url_mapping_type    => ''BASE_PATH'',',
'      p_url_mapping_pattern => ''invent2'',',
'      p_auto_rest_auth      => FALSE);    ',
'',
'  ORDS.DEFINE_MODULE(',
'      p_module_name    => ''v_checklist_sql_status'',',
'      p_base_path      => ''/charter/'',',
'      p_items_per_page =>  25,',
'      p_status         => ''PUBLISHED'',',
'      p_comments       => NULL);      ',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''v_checklist_sql_status'',',
'      p_pattern        => ''checklist_sql_attach_file'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''v_checklist_sql_status'',',
'      p_pattern        => ''checklist_sql_attach_file'',',
'      p_method         => ''POST'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page =>  0,',
'      p_mimes_allowed  => ''application/json'',',
'      p_comments       => NULL,',
'      p_source         => ',
'''declare',
' p_status_id number;',
' ticket_ref varchar2(255);',
'  l_blob blob;',
'',
'Begin',
'    ticket_ref := :ticket_ref;',
'    l_blob := :body;',
'',
'',
'  STATUS_REST_UTL.CHECKLISTSTATUS_SQL_FILE_INS(',
'    P_TASK_ID => :task_id,',
'    P_TASK_KEY => :task_key,',
'    P_TASK_AREA => :task_area,',
'    P_TASK_STATUS => :task_status,',
'    P_TASK_MESSAGE => :task_message,',
'    P_FILE_UPLOAD => l_blob,',
'    P_RECORD_TYPE => :record_type,',
'    P_FILE_MIMETYPE => nvl(:file_mimetype,:contentType),',
'    P_FILE_NAME => :file_name,',
'    P_STANDARD_TASK_ID => :standard_task_id,',
'    P_STATUS_ID => P_STATUS_ID',
'  );',
'',
'  :status_id := P_STATUS_ID;',
'',
':status := 200;',
':sqlerrmsg := ''''log file uploaded successfully for v_checklist_sql_status, STATUS_ID: '''' || P_STATUS_ID ;',
'',
'exception',
'when others then',
':sqlerrmsg := substr(sqlerrm,1,400);',
':status := 400 ;',
'end;''',
'      );',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''file_mimetype'',',
'      p_bind_variable_name => ''file_mimetype'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''file_name'',',
'      p_bind_variable_name => ''file_name'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''record_type'',',
'      p_bind_variable_name => ''record_type'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''sqlerrmsg'',',
'      p_bind_variable_name => ''sqlerrmsg'',',
'      p_source_type        => ''RESPONSE'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''standard_task_id'',',
'      p_bind_variable_name => ''standard_task_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''status_id'',',
'      p_bind_variable_name => ''status_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_area'',',
'      p_bind_variable_name => ''task_area'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_id'',',
'      p_bind_variable_name => ''task_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_key'',',
'      p_bind_variable_name => ''task_key'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_message'',',
'      p_bind_variable_name => ''task_message'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_status'',',
'      p_bind_variable_name => ''task_status'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_attach_file'',',
'      p_method             => ''POST'',',
'      p_name               => ''ticket_ref'',',
'      p_bind_variable_name => ''ticket_ref'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''v_checklist_sql_status'',',
'      p_pattern        => ''checklist_sql_status'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''v_checklist_sql_status'',',
'      p_pattern        => ''checklist_sql_status'',',
'      p_method         => ''POST'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page =>  0,',
'      p_mimes_allowed  => ''appliction/json'',',
'      p_comments       => NULL,',
'      p_source         => ',
'''declare',
' p_status_id number;',
' ticket_ref varchar2(255);',
' standard_task_id varchar2(255);',
'Begin',
'--',
'--  This REST call populates an open log table that can be used to provide',
'-- Status and task progress during a long running session',
'-- As well as display Host and database infromation within the context of task stream',
'-- Esentially its a highly formatable version of standard out',
'--',
'',
'  ticket_ref := :ticket_ref;',
'  standard_task_id := :standard_task_id;',
'',
'  STATUS_REST_UTL.CHECKLISTSTATUS_SQL_INS(',
'    P_TASK_ID => :task_id,',
'    P_TASK_KEY => :task_key,',
'    P_TASK_AREA => :task_area,',
'    P_TASK_STATUS => :task_status,',
'    P_TASK_MESSAGE => :task_message,',
'    P_TASK_BODY => :body,',
'    P_RECORD_TYPE => upper(:record_type),',
'    P_STANDARD_TASK_ID => :standard_task_id,',
'    P_STATUS_ID => p_status_id',
'  );',
'',
'  :status_id := p_status_id;',
'',
':status := 200;',
':sqlerrmsg := ''''Task status Updated, STATUS_ID: '''' || p_status_id ;',
'',
'exception',
'when others then',
':sqlerrmsg := substr(sqlerrm,1,400);',
':status := 400 ;',
'',
'End;''',
'      );',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''record_type'',',
'      p_bind_variable_name => ''record_type'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''sqlerrmsg'',',
'      p_bind_variable_name => ''sqlerrmsg'',',
'      p_source_type        => ''RESPONSE'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''standard_task_id'',',
'      p_bind_variable_name => ''standard_task_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''status_id'',',
'      p_bind_variable_name => ''status_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_area'',',
'      p_bind_variable_name => ''task_area'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_id'',',
'      p_bind_variable_name => ''task_id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_key'',',
'      p_bind_variable_name => ''task_key'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_message'',',
'      p_bind_variable_name => ''task_message'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''task_status'',',
'      p_bind_variable_name => ''task_status'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''v_checklist_sql_status'',',
'      p_pattern            => ''checklist_sql_status'',',
'      p_method             => ''POST'',',
'      p_name               => ''ticket_ref'',',
'      p_bind_variable_name => ''ticket_ref'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);      ',
'',
'',
'  COMMIT; ',
'END;',
'/',
'CREATE OR REPLACE PACKAGE "CHARTER2_INV"."STATUS_REST_UTL" AS ',
'',
'/*',
'    -- Purpose: Holding ORDS REST Call API supporting objects for checklist status & process status.',
'    -- Created On: 18 FEB 2019     ',
'*/',
'    PROCEDURE checkliststatus_ins (',
'        p_task_id            IN                   v_checklist_status.task_id%TYPE,',
'        p_task_key           IN                   v_checklist_status.task_key%TYPE,',
'        p_task_area          IN                   v_checklist_status.task_area%TYPE,',
'        p_task_status        IN                   v_checklist_status.task_status%TYPE,',
'        p_task_message       IN                   v_checklist_status.task_message%TYPE,',
'        p_task_body          IN                   BLOB,--v_checklist_status.task_body%TYPE,',
'        p_record_type        IN                   v_checklist_status.record_type%TYPE,',
'        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );',
'    ',
'    PROCEDURE checkliststatus_file_ins (',
'        p_task_id            IN                   v_checklist_status.task_id%TYPE,',
'        p_task_key           IN                   v_checklist_status.task_key%TYPE,',
'        p_task_area          IN                   v_checklist_status.task_area%TYPE,',
'        p_task_status        IN                   v_checklist_status.task_status%TYPE,',
'        p_task_message       IN                   v_checklist_status.task_message%TYPE,',
'        p_file_upload        IN                   v_checklist_status.file_upload%TYPE,',
'        p_record_type        IN                   v_checklist_status.record_type%TYPE,',
'        p_file_mimetype      IN                   v_checklist_status.file_mimetype%TYPE,',
'        p_file_name          IN                   v_checklist_status.file_name%TYPE,',
'        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );',
'    ',
'    PROCEDURE process_status_ins (',
'        p_task_id            IN                   v_process_status.task_id%TYPE,',
'        p_task_key           IN                   v_process_status.task_key%TYPE,',
'        p_task_area          IN                   v_process_status.task_area%TYPE,',
'        p_task_status        IN                   v_process_status.task_status%TYPE,',
'        p_task_message       IN                   v_process_status.task_message%TYPE,',
'        p_task_body          IN                   BLOB,--v_process_status.task_body%TYPE,',
'        p_record_type        IN                   v_process_status.record_type%TYPE,',
'        p_standard_task_id   IN                   v_process_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );    ',
'    ',
'    PROCEDURE process_status_file_ins (',
'        p_task_id            IN                   v_process_status.task_id%TYPE,',
'        p_task_key           IN                   v_process_status.task_key%TYPE,',
'        p_task_area          IN                   v_process_status.task_area%TYPE,',
'        p_task_status        IN                   v_process_status.task_status%TYPE,',
'        p_task_message       IN                   v_process_status.task_message%TYPE,',
'        p_file_upload        IN                   v_process_status.file_upload%TYPE,',
'        p_record_type        IN                   v_process_status.record_type%TYPE,',
'        p_file_mimetype      IN                   v_process_status.file_mimetype%TYPE,',
'        p_file_name          IN                   v_process_status.file_name%TYPE,',
'        p_standard_task_id   IN                   v_process_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );  ',
'    ',
'     PROCEDURE checkliststatus_sql_ins (',
'        p_task_id            IN                   v_checklist_status.task_id%TYPE,',
'        p_task_key           IN                   v_checklist_status.task_key%TYPE,',
'        p_task_area          IN                   v_checklist_status.task_area%TYPE,',
'        p_task_status        IN                   v_checklist_status.task_status%TYPE,',
'        p_task_message       IN                   v_checklist_status.task_message%TYPE,',
'        p_task_body          IN                   BLOB,',
'        p_record_type        IN                   v_checklist_status.record_type%TYPE,',
'        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );',
'',
'    PROCEDURE checkliststatus_sql_file_ins (',
'        p_task_id            IN                   v_checklist_status.task_id%TYPE,',
'        p_task_key           IN                   v_checklist_status.task_key%TYPE,',
'        p_task_area          IN                   v_checklist_status.task_area%TYPE,',
'        p_task_status        IN                   v_checklist_status.task_status%TYPE,',
'        p_task_message       IN                   v_checklist_status.task_message%TYPE,',
'        p_file_upload        IN                   v_checklist_status.file_upload%TYPE,',
'        p_record_type        IN                   v_checklist_status.record_type%TYPE,',
'        p_file_mimetype      IN                   v_checklist_status.file_mimetype%TYPE,',
'        p_file_name          IN                   v_checklist_status.file_name%TYPE,',
'        p_standard_task_id   IN                   v_checklist_status.standard_task_id%TYPE,',
'        p_status_id          OUT                  NUMBER',
'    );',
'    ',
'END STATUS_REST_UTL;',
'/',
'CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."STATUS_REST_UTL" wrapped ',
'a000000',
'1',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'b',
'3f87 5e8',
'o4tkFSVlFvABEufczbBS0nAl0JAwg80TVdwFfI7Gv/Db2lRaTTuOqLL0/cUbvvre+uxkMcug',
'BekckZYk2t62qhsuE/D7SkYWM62q2v8tc9kmPrhTlf1nCnqDjP2XfNXe6anC5ZH6shXSkvyS',
'nggKykLnzKGmAnIvSLd1wtYybswhIF8nahg4RTsG56HqbqhOIyajJuWzRdpTGcIQ+zdrvgJz',
'vuxoPagYvY+C6QIKhA1/2gwNOopQLjcJCDT/UABTe0Yepn0sQFzxZOH60Gd1t03TIwsgw8Aq',
'+Gp5wudt/N/I3D09TDsGMlDy7licR45yl/VEGghxDnWfq/QicKgsnGNxljny/XhjItNO1Q9k',
'PneyH/R1onTfZ1CGtpLltAnT8uhzYb3/31x1TvykgnmMXPLVGY2Y5zxTWbSvbs2O8OpZwlcF',
'oB083hbJgwOqrxTP1F0/P7WlS1QY8dQwRBNXHuT8JEPMueVZkxlDwhapR41aulZcTzA7orhZ',
'OrcM09tBqIJ32gPGSThjoTXmNWL3HEm78Hf/JaD2B3hdCuEdOd73tlkzx4fU2YTS0i655qnm',
'R2rqiWUJq8RjxYsxmS/UwPPex21r47Dfi6CfWcfzCdU9NEGD6GzcTmX2SVvEfpjbqgk0jAiu',
'53Zz3tZhSGfFwNJNmZuDa9WeyCnKkroC0nxtQ0qk1rrDo6MJsFpV8XGRCGlJos1SFnsigusH',
'W2N2eaE0RCH4gfifK8Zj3iCy+ZPxhk2S3E5+yb3LhWYZXxyvI6iK5hZUbgx5vBhY904/L4NH',
'03kbuPBjI+rP1sGzxqotaMKLZmLKKNUgcD5DE0s7VH6MYZtgmivHtJd+XKd1nNRcCrPEbeKf',
'r5ygGjaGuaNFvdhDi6TyiThkLRljRQVb/wJWuGRPNxu0v2Q2VDGiQsQAPNC6g5acgNOO+2VZ',
'Ah5X+9BAu6SyHrBUb+BsqwU4+j13c7p9VHjs1D71l4ySEvUyFhdXAgj7s0W8/XeBSxJ7ikU1',
'6g8N2kqJi9SbwDZBp3quUf/z20KreUE17IwWx444QemchoXCT8Xw6m7MIa2sFLDhYDtqjKmz',
'svAAj7Rb0HOmrab3EMo+0d78oydVTTGSHMQE6u20Fn5kWtzPHmo9IpHNlTw/9aQVsTVGPX88',
'gYOkdKLEDVVrOKffx/bNUGmuZ9mBSfIK2V5N5SWOiX5eNMj3efGc08IuTsAiYSa8OAbDHv+i',
'3l4uPUkutbUaJhNsTK2hrvFBFJoqoUXTyPz8Q+vQT5ZzEa9JbJS7XdgMt/EcYRnLYdyu6SfC',
'tmxmxg60Kd5aug+wWuaD9ZYuNfmEftKPfbbIHP0A39zxqYpbYE8/0inGKJA/9TW4eYLSKiJz',
'984gCHP7rqrd6++wJI8pKDCSHUEsc6mwdUN0he20Orvk3q5PSAApoLDdoqoG60/O0kkic/Su',
'T7iBvepPuHM0vbH3NilOZCK1kgjQqhwPFJXS6/nZQbGqOh0qGqpo',
'',
'/',
'CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$ANSIBLE_UTL" wrapped ',
'a000000',
'1',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'b',
'8f4f 19b6',
'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',
'1w/5KFhLiNs=',
'',
'/',
'CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$ANSIBLE_REST_UTL" wrapped ',
'a000000',
'1',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'b',
'11357 28f7',
'iwBV/BD4Eu6M0+oSxlpC2XyK/yswg80A9iAFWvH+MjbOJCF6W2kVPkqQVb6+bY8AUNNDEe9t',
'q/EJG1d255XgdnmO+gqAwq8w+fiBmAosdwXQFHdZfm2K5T/DMlwyMjIysWSdM5Yd9fPfGVGG',
'UGS1mJr0uh/NyvCsV6ESofgEOgjMKU3DFbVFzFQoq+0WZ/DIlE34zd/FLI0v+fXrh3dgj+v8',
'DrwsPQ86s23lFpvFoUUpXMg0nv1g83fn7D9kkMq7ZVp6vWko2qFQoSVdeXiF+1N3nqFag0k7',
'KoGfMKhre+2fuqeVkClAkFePAWqH5pksjcXYNojWbY/CPe4PmK+7KROPZvDWTZrlW0mcBGog',
'AGVmZOGd86JSOtjAJQhkFhWcwYUKrkltfsIwp8/t1zSD31SSP5gffFaSEbhWiheGBsXcUgOY',
'7V02tQwFO9xpM2C3OhF1awXS7FxP0biBlvcHubn1cY2DYBGnAy2p1KAZL31q4FITP5dvLOiE',
'+3RTcOvswTF+Zc4U/ZpqC2DUv4SlBa/P+QF7t7J9klLkG1/fCnMbc2UE0ANE1MLO3Xxx6CB8',
'wVu9YIk0g2/6z0io9Iay2ptIe+TFezUENGa+qXNIKjEgfESjf/xGX5oxmF1cUMxjaJQ/iGIi',
'TfxaYi+WddF1YmIivJsPx/sVOr7YqUzxBuQgisw9VugMmaN0esIYmeipVDrvCtiPpmkresKX',
'4aMDwqs6x22d3soKMHa6lTKt6brmHCbgrNQ12svfawX1vhZavywax8ga691ey6prC2gVhqts',
'zurTUT/FISaaeffzbHuAdOgvTmcPqFHy7lqe5vS7GEnF4/xGVD6HEpEqURblCkmmpEg/pRIA',
'fRs7yNkCeFTmDi/Z9BYZWqM2AzH1QFPIq9zrk98PGrFUGft5N6oSXQzkutrjUdV/rNHiXela',
'mKXO5rrW++4sl47Mdgzw80aXVaAxM5bHWUSb8rBFOiaf6yvWZ78j6h81oGG4sdDkCtK7UrQ3',
'XOI5ugdeSgdLouOkBl45frAf7cmC45FSzAs6lpY/c3IPMVNhXrXFijLTk+OBAnS5D4duQUFm',
'h8V+34bdXPxfHw4bt5LIZNIuT1/z1f+dttPZ6G6QQSvOTlcIt4eKz5XJRNGzL1VdlvkchxrD',
'q1pNH53k5msa8yvFLa3EAj6LYWphLRV8OVW0oirml9MDFRbMXIZSOJw1EKzXupJBTj4BeH/9',
'fH8JJD+QBj/Ez3RcvFkIjn1AVBoaVRYRYT+dmGrx4YI5kFFu61KdGTD1UdNClGBkE82lLuw2',
'6lVhTzbDII8fztkFbXzPsoePMQIIzD/GA06+6lw7ZCNtMWVOxd2XNnYtbfwvl9byPVuKPTBL',
'bnGqMLlczYtnbAITQzJqV1KNt4OhXlmFzAn8Gy5ia8USIJwHkt7wn2XStyZucTtr6EQptCwR',
'Y3p7//kNdbIlctYx5M5skgsNilFmpN7AKChOq3Uk6u2166xAg68A9dAa9ipvQsPfyYLMz/hg',
'FkcpoyUinkuRNPvpVGvxayQ7Q9pvWX5wJ8BcojkJeNNNoXRViFOMf8lB3B0eUXxRbJjbSqk0',
'jL6CK9W4PBYm2yHdDYNP+0k7kh6pWiXovby9Syy9bAtnIKZZkv9Gev51w9DfqRVZ8vVXA+ff',
'rC8LCjUrfPpGWIQFyvCsEEdBXNTLqhdXqTAN3IRbIeT5VspI4dUOnUFlFo8CrO2UQEwuNAmQ',
'jTxuSHLMqvEU35amS+ubOLQ93qHNqnH5FBVhzJPnqDGJ5di+5RbJvccney8twOZJh5OJ2Hd+',
'YH9nPq1GgTXML9ycj'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(46078002339045140)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'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',
'',
'/',
'--drop table SOURCE_APP_UPDATE;',
'  CREATE TABLE "CHARTER2_INV"."SOURCE_APP_UPDATE" ',
'   (	"SOURCE_APP_UPDATE_ID" NUMBER, ',
'	"APP_VERSION" VARCHAR2(255 BYTE), ',
'	"RELEASED_DT" DATE, ',
'	"ACTIVE" VARCHAR2(255 BYTE), ',
'	"APPLIED_DT" DATE, ',
'    UPDATED DATE,',
'    updated_by  VARCHAR2(255 BYTE),',
'    SUMMARY varchar2(4000),',
'	"DESCRIPTION" CLOB, ',
'	"FILE_LIST" CLOB, ',
'	 CONSTRAINT "SOURCE_APP_UPDATE_PK" PRIMARY KEY ("SOURCE_APP_UPDATE_ID")',
'  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 ',
'   ) SEGMENT CREATION DEFERRED ',
'  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 ',
' NOCOMPRESS LOGGING',
' ;',
'create or replace TRIGGER  "SOURCE_APP_UPDATE_BIU" ',
'    before insert or update',
'    on charter2_inv.SOURCE_APP_UPDATE',
'    for each row',
'begin',
'    if :new.SOURCE_APP_UPDATE_ID is null then',
'        :new.SOURCE_APP_UPDATE_ID := to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    ',
'    if :new.RELEASED_DT is null then',
'    :new.RELEASED_DT := sysdate;',
'    end if;',
'    ',
'    if updating then',
'        :new.updated := sysdate ;',
'        :new.updated_by := coalesce( sys_context(''APEX$SESSION'',''app_user'') , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')  ',
'                                    , sys_context(''userenv'',''session_user'') ) ;',
'    end if;',
'',
'end SOURCE_APP_UPDATE_BIU;',
'/',
'REM INSERTING into CHARTER2_INV.SOURCE_APP_UPDATE',
'SET DEFINE OFF;',
'Insert into CHARTER2_INV.SOURCE_APP_UPDATE (APP_VERSION,RELEASED_DT,ACTIVE,APPLIED_DT,UPDATED,UPDATED_BY,SUMMARY,DESCRIPTION) ',
'values (''v1.Apr23'',to_date(''23-APR-19'',''DD-MON-RR''),''Active'',sysdate,to_date(''24-APR-19'',''DD-MON-RR''),''MPERRY'',''Updated for Inventory Changes and packages updated'',''Oracle - Changed for Inventory',
'Multiple Package updates including New REST call , and update for PSU Apply bug with ticket_ref and standard_task_id. ',
'MSSQL - Added Database Checklist Reports'');',
'commit;'))
);
null;
end;
/
prompt --application/deployment/install/install_support_obj_details_may3_sql
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(46153750333128591)
,p_install_id=>wwv_flow_api.id(46073915788023149)
,p_name=>'support_obj_details_may3.sql'
,p_sequence=>15
,p_script_type=>'INSTALL'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select 1 from  CHARTER2_INV.SOURCE_APP_UPDATE where APP_VERSION = ''v1.objdetails.may3'''
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'truncate table  CHARTER2_INV.SOURCE_OBJECT_DETAILS;',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LOV_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ENV_HOST_INFO'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ENV_HOST_CODE_BACKUP'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_CHECK_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HISTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HISTORY_IDX2'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HISTORY_IDX1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_NAME_HOST_CODE_VHIT_IDX'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL_UK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_I1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PK_CLUSTER_NAME'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_CHECK_LIST_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETA_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_CHECK_LIST_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_CHECK_LIST_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$ANSIBLE_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$ANSIBLE_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_REPORT'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_REPORT_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_VERSION_LOOKUP_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_APP_DETAIL_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_DB_APP_DETAIL_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_VENDOR_VERSION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_QUEUE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_QUEUE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LOV_TBL_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_TEMPLATE_STORE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_REQUEST_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_REQUEST_QUEUE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_REQUEST_QUEUE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_CHANGE_REQUEST_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_APPLICATION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_LOV_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''LOV_BI_TRG'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_ENV'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_BUS'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''v_APP_SETTING_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_SCHEDULE_TBL_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''CLUSTER_MEMBER_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_INVENTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''APPLICATION_DETAILS_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_SCHEDULE_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_CHECK_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETAILS_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''TEMP_COUNT_MSTR'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''LOV_BI_TRG'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETAILS_TBL_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETAILS_TBL_'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_PERSON'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_APP_PERSON'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_PERSON_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SETUP_MGR'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SETUP_MGR'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_REST_LOGS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_REST_LOGS_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_REST_LOGS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_PATCH_HISTORY_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_PATCH_HISTORY_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_SUMMARY_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SOURCE_OBJECT_DETAILS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DISCOVERY_SCHEDULE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DISCOVERY_SCHEDULE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''STANDARD_TASK_MGR'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''STANDARD_TASK_MGR'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_VERSION_SUMMARY_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_VERSION_LOOKUP_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_SUPPORT_SUMMARY_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_QUEUE_DETAIL_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_QUEUE_DETAIL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_TEMPLATE_STORE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_TEMPLATE_STORE_UK1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_TEMPLATE_STORE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''GET_NAME'',''FUNCTION'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_SCHEDULE_CALENDAR_HOSTNAME'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ITSM_SC_REQUEST_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST_LOGS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_MSSQL_CHECK_LIST_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_API_RESULT'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_API_RESULT_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''OAC$ANSIBLE_MSSQL_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''OAC$ANSIBLE_MSSQL_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''CLUSTER_HOST_REST_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''CLUSTER_HOST_REST_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''GET_ID'',''FUNCTION'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''APP_DB_SERVER_INFO_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_MIGRATION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_UPGRADE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_JOB_TEMPLATES'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_ORGANIZATIONS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_JOB_TEMPLATE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_FILES2'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQUEST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SYS_USER_GRMEMBER'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQ_ITEM'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ITSM_SC_REQUEST_ITEM_VA'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ITSM_SC_REQUEST_ITEM_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_API_RESULT_RUN_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SYS_USER_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQUEST_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SYS_USER_GROUP_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQ_ITEM_RID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQ_OPENBY_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQ_ASGN_ID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQ_REQFOR'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SC_REQUEST_QUE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SYS_USER_GROUP'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_CI_APPL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''OAC$ANSIBLE_UTL'',''SYNONYM'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_ANSIBLE_TEMPLATE_STORE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_ANSIBLE_TEMPLATE_STORE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_ANSIBLE_TEMPLATE_STORE_UK1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_ANSIBLE_TEMPLATE_STORE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_LOOKUP_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''LOOKUP_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''v_Patch_Lookup_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,O'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(46153750333128591)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_APP_SETTINGS'',''SYNONYM'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_NEWS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_BU_VENDOR_VERSION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_VENDOR_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_BU_VENDOR_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''LICENSE_MGR'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''LICENSE_MGR'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_HOST_INV_HC'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_HOST_INV_HN'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DB_INVENTORY_HC'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_FEATURE_USAGE_DN'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PRODUCT_USAGE_DN'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LICENSE_FEATURE_USAGEDN'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LICENSE_PRODUCT_USAGEDN'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''TEMP_LIST_MAP'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_PATCH_HISTORY_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_PATCH_HISTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SIMPLE_CRYPTO'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SIMPLE_CRYPTO'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CHECKLIST_STATUS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SELF_SERVICE_STATUS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SELF_SERVICE_STATUS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$ANSIBLE_REST_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_REQUEST_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$ANSIBLE_REST_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_SCHEDULE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_REQUEST_QUEUE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_REQUEST_QUEUE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_SCHEDULE_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_PATCH_SCHEDULE_CALENDAR'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DATABASEINFO_MVIEW'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''I_SNAP$_DATABASEINFO_MVIEW'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DATABASEINFO_MVIEW'',''MATERIALIZED VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_INFO_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_CHANGE_REQUEST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_CMDB_CI'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_STEP'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_STEP_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_SYS_USER'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''OAC$ANSIBLE_REST_UTL'',''SYNONYM'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''REQUEST_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''REQUEST_QUEUE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_SETTINGS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_INFO_MVIEW'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DB_INFO_MVIEW'',''MATERIALIZED VIEW'',''INVALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REGISTRY_SQLPATCH_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_DB_PATCH_DETAIL_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REGISTRY_SQLPATCH_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REGISTRY_SQLPATCH'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_HOST_VENDOR_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_HOST_VENDOR_VERSION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_VERSION_SUMMARY_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_SYSTEM_TYPE_VERSION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''HOST_DB_ALL_DETAIL_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETAILS_TBL_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_CHECK_LIST_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_SCHEDULE_TBL_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_TBL_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REST_DEFINITIONS_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APPLICATION_DETAILS_TBL_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_TBL_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_CHECK_LIST_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_INVENTORY_API'',''PACKAGE BODY'',''INVALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_BURNDOWN_SUMMARY_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_BASELINE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''SOURCE_APP_UPDATE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''SOURCE_APP_UPDATE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PURCHASED_PRODUCTS_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_HOST_INV_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DB_INVENTORY_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''SOURCE_APP_UPDATE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_FEATURE_USAGE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PRODUCT_USAGE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_BASELINE'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_BASELINE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_PURCHASED_PRODUCTS'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PURCHASED_PRODUCTS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_HOST_INV'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_HOST_INV'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_DB_INVENTORY'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DB_INVENTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_FEATURE_USAGE'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_FEATURE_USAGE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_V_LIC_PRODUCT_USAGE'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PRODUCT_USAGE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SETUP_CHARTER_ACCTS'',''PROCEDURE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ITSM_UTILITY'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ITSM_UTILITY'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_REST_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_REST_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_DETAIL_ALL'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''STATUS_REST_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''STATUS_REST_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''PATCH_SUMMARY_VW_OLD'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''DATABASEINFO'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''TEMP_SERVER_INFO'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''SERVERLIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_PROD_SUM_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_PROD_SUM_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_SUM_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_TOT_SUM_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_DETAIL_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_DETAIL_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_PROD_SUM_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_PROD_SUM_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_SUM_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_TOT_SUM_C2'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PRODUCT_PRICE_LIST_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_PRODUCT_PRICE_LIST'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_PRODUCT_PRICE_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''TEMP_LIST_MAP_COMP1'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_VER_TOT_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_BU_TOT_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_INV_DET'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_DETAIL'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_DETAIL'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''TEMP_LIST_MAP_EXADATA'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_PROD_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_TOT_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_VENDOR_PROD_SUM'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_BASELINE_JSON_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DISCOVERY_SCHEDULE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_BASELINE_JSONLOAD'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_LIC_BASELINE_JSONLOAD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_BASELINE_JSON_STATID'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_JSONLOAD_FEATURE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_JSONLOAD_PRODUCT_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''TEMP_LIST_MAP_COMP2'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_DATABASE_DETAIL_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LIC_SERVER_DETAIL_C1'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_PATCH_HISTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_ROLE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_ROLE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_APP_ROLE'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_PERSON_ROLES'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_PERSON_ROLES_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BI_V_APP_PERSON_ROLES'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_PRIVILEGE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SOURCE_APP_UPDATE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STAT'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(46153750333128591)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'US,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SOURCE_APP_UPDATE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_SELF_SERVICE_STATUS'',''SYNONYM'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''SOURCE_APP_UPDATE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_MIGRATION_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_UPGRADE_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HISTORY_V'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HOST_INV_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''FILES_XT'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_SCHEDULE_CALENDAR_08NOV'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_HOSTS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_GROUPS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_SCHEDULE_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_SCHEDULE_TBL_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_FILES'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ANSIBLE_INVENTORIES'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_SCHEDULE_TBL_I1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_SCHEDULE_TBL_I2'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BATCH_MGR'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''BATCH_MGR'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CHECK_LIST_LOG'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''DB_ID'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_HISTORY_SEQ'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''GET_HOST_CODE'',''FUNCTION'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''APP_DB_DETAIL'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CHECKLIST_STATUS_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ORACLE_TEAM_USERS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ORACLE_TEAM_USERS_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''ORACLE_TEAM_USERS_SEQ'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''bi_ORACLE_TEAM_USERS'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''MSSQL_TEAM_USERS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''MSSQL_TEAM_USERS_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''MSSQL_TEAM_USERS_SEQ'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''bi_MSSQL_TEAM_USERS'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$FILE_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$FILE_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''FILE_LISTING_OT'',''TYPE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''FILE_LISTING_NTT'',''TYPE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_PATCH_HISTORY_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_DB_PATCH_HISTORY_AUD'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$AUTH_UTL'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''OAC$AUTH_UTL'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_SETTINGS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_APP_SETTINGS_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CSI_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CSI_PRODUCT_LIST'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PROCESS_STATUS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PROCESS_STATUS_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CLUSTER_MEMBER_T_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''REQUEST_QUEUE_DEP'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REQUEST_QUEUE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REQUEST_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REQUEST_QUEUE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REQUEST_QUEUE_API'',''PACKAGE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_REQUEST_QUEUE_API'',''PACKAGE BODY'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUIREMENTS_SAMPLE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUIREMENTS_SAMPLE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUIREMENTS_SAMPLE_SEQ'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''bi_V_REQUIREMENTS_SAMPLE'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''CLUSTER_DC_MAPPING'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''NON_CLUSTERED_HOST_VW'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUEST_QUEUE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUEST_QUEUE_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_REQUEST_QUEUE_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_HISTORY'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_HISTORY_IDX1'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_HISTORY_IDX2'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_CHECK_LIST_ID_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_CHECK_LIST_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_DB_CHECK_LIST_AUD'',''TRIGGER'',''INVALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_HISTORY_SEQ'',''SEQUENCE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_PARMS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_SCHEDULE_TASK_PARMS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LICENSE_PRODUCT_USAGE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_LICENSE_FEATURE_USAGE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_LOOKUP_TBL'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CHECK_LIST_LOGS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_CHECK_LIST_LOGS_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''LOOKUP_PK'',''INDEX'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_SCHEDULE'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''v_Patch_Lookup_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_PATCH_SCHEDULE_CALENDAR'',''VIEW'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''v_Patch_SCHEDULE_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_API_RESULT'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_INV'',''V_ITSM_API_RESULT_BIU'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_CHECKLIST_STATUS'',''TABLE'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_OBJECT_DETAILS (OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS,VERSION,DEPLOYED_ON) values (''CHARTER2_SQL'',''V_CHECKLIST_STATUS_BUI'',''TRIGGER'',''VALID'',''1.0'',to_date(''03-MAY-19'',''DD-MON-RR''));',
'Insert into CHARTER2_INV.SOURCE_APP_UPDATE (SOURCE_APP_UPDATE_ID,APP_VERSION,RELEASED_DT,ACTIVE,APPLIED_DT,UPDATED,UPDATED_BY,SUMMARY) values (180761691552442709522746677436644757695,''v1.objdetails.may3'',to_date(''03-MAY-19'',''DD-MON-RR''),''Active'',sysd'
||'ate,null,null,''Upload Release Object Details to use as comparison for Deployment checks'');',
'commit;',
''))
);
null;
end;
/
prompt --application/deployment/install/install_apply_updates_may3_sql
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(46153197505810586)
,p_install_id=>wwv_flow_api.id(46073915788023149)
,p_name=>'Apply_updates_may3.sql'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select 1 from  CHARTER2_INV.SOURCE_APP_UPDATE where APP_VERSION = ''Version.May8'''
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop view "CHARTER2_INV"."NON_CLUSTERED_HOST_VW_OCT28";',
'--triggers',
'create or replace TRIGGER "CHARTER2_INV"."V_HOST_INV_TBL_BIU" ',
'    before insert or update',
'    on charter2_inv.v_host_inv_tbl',
'    for each row',
' Declare',
'  PRAGMA AUTONOMOUS_TRANSACTION;',
'begin',
'',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'',
'        if :new.clustered = ''N'' then',
'        if     :new.host_code is null then',
'            :new.host_code := get_host_code(:new.env_source);',
'        end if;',
'        end if;',
'        :new.created := sysdate;',
'        :new.created_by := nvl(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := nvl(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end v_host_inv_tbl_biu;',
'/',
'create or replace TRIGGER BI_V_APP_ROLE ',
'BEFORE',
'insert on v_app_role',
'for each row',
'begin',
'if  :NEW.ROLE_ID is null then',
'',
' :NEW.ROLE_ID :=  to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
' :NEW.CREATED_ON := sysdate;',
'end if;',
'',
'end;',
'/',
'create or replace TRIGGER BI_v_app_person ',
'BEFORE',
'insert on v_app_person',
'for each row',
'begin',
'if :NEW.PERSON_ID is null then',
' :NEW.PERSON_ID :=  to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
' :NEW.CREATED_ON := sysdate;',
'end if; ',
'end;',
'/',
'--------------------------------------------------------',
'--  DDL for View APP_DB_DETAIL',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."APP_DB_DETAIL" ("APPLICATION_NAME", "Database_Name", "BUSINESS_UNIT", "APP_OWNER", "EMAIL", "ENV_CATEGORY", "ORACLE_VERSION", "DATABASE_ROLE") AS ',
'  SELECT a.APPLICATION_NAME, b.database_name "Database_Name", a.BUSINESS_UNIT, a.APP_OWNER, a.APP_OWNER_EMAIL "EMAIL",',
'        b.ENV_CATEGORY, b.ORACLE_VERSION,b.DATABASE_ROLE',
'FROM ',
'    V_APPLICATION_DETAILS_TBL a, v_db_inventory b',
'    where a.APPLICATION_NAME = b.APPLICATION_NAME',
';',
'--------------------------------------------------------',
'--  DDL for View CLUSTER_DC_MAPPING',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."CLUSTER_DC_MAPPING" ("CLUSTER_NAME", "V_HOST_CODE", "DC_LOCATION") AS ',
'  Select distinct a.cluster_name, a.v_host_code, b.DC_LOCATION from v_cluster_member_tbl a, v_host_inv_tbl b',
'where a.v_host_code = b.host_code',
';',
'--------------------------------------------------------',
'--  DDL for View DB_APP_DETAIL_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."DB_APP_DETAIL_VW" ("DATABASE_NAME", "ENV_CATEGORY", "ORACLE_VERSION", "DATABASE_ROLE", "APPLICATION_NAME", "BUSINESS_UNIT", "APP_OWNER", "EMAIL", "REF_APP_ID", "DB_ID") AS ',
'  SELECT',
'        b.database_name,',
'        b.env_category,',
'        b.oracle_version,',
'        b.database_role,',
'        a.application_name,',
'        a.business_unit,      ',
'        a.app_owner,',
'        a.app_owner_email   EMAIL,',
'        a.ref_app_id,',
'        b.id db_id',
'    FROM',
'        v_application_details_tbl a,',
'        v_db_inventory b',
'    WHERE',
'         b.application_name = a.application_name(+)',
';',
'--------------------------------------------------------',
'--  DDL for View DB_MIGRATION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."DB_MIGRATION_VW" ("DB_ID", "DATABASE_NAME", "MIGRATION_START_DATE", "MIGRATION_END_DATE", "MIGRATION_COMPLETION_TIME", "MIGRATION_METHOD", "APPLICATION_NAME", "APP_OWNER", "APP_OWNER_EMAIL") AS ',
'  SELECT b.DB_ID, a.DATABASE_NAME,b.MIGRATION_START_DATE,b.MIGRATION_END_DATE,b.MIGRATION_COMPLETION_TIME, b.MIGRATION_METHOD,c.application_name,c.APP_OWNER, c.APP_OWNER_EMAIL',
'from v_db_inventory a , V_DB_SCHEDULE_TBL b , V_APPLICATION_DETAILS_TBL c ',
'where a.id = b.DB_ID and a.app_id = c.ID',
';',
'--------------------------------------------------------',
'--  DDL for View DB_UPGRADE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."DB_UPGRADE_VW" ("DB_ID", "DATABASE_NAME", "UPGRADE_START_DATE", "UPGRADE_END_DATE", "UPGRADE_COMPLETION_TIME", "APPLICATION_NAME", "APP_OWNER", "APP_OWNER_EMAIL") AS ',
'  SELECT b.DB_ID, a.DATABASE_NAME,b.UPGRADE_START_DATE,b.UPGRADE_END_DATE,b.UPGRADE_COMPLETION_TIME, c.application_name,c.APP_OWNER, c.APP_OWNER_EMAIL',
'from v_db_inventory a , V_DB_SCHEDULE_TBL b , V_APPLICATION_DETAILS_TBL c ',
'where a.id = b.DB_ID and a.app_id = c.ID',
';',
'--------------------------------------------------------',
'--  DDL for View DB_VERSION_LOOKUP_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."DB_VERSION_LOOKUP_VW" ("ORACLE_VERSION", "MAIN_EOL", "EXTENDED_EOL") AS ',
'  select ',
'v.oracle_version',
',max(',
'case ',
'when oracle_version like ''8%'' then',
'to_date(''01/01/2005'',''MM/DD/RRRR'')',
'when oracle_version like ''9%'' then',
'to_date(''05/01/2008'',''MM/DD/RRRR'')',
'when oracle_version like ''10.1%'' then',
'to_date(''01/31/2009'',''MM/DD/RRRR'')',
'when oracle_version like ''10.2%'' then',
'to_date(''07/31/2010'',''MM/DD/RRRR'')',
'when oracle_version like ''11.1%'' then',
'to_date(''08/31/2012'',''MM/DD/RRRR'')',
'when oracle_version like ''11.2%'' then',
'to_date(''08/31/2015'',''MM/DD/RRRR'')',
'when oracle_version like ''12.1%'' then',
'to_date(''08/01/2018'',''MM/DD/RRRR'')',
'when oracle_version like ''12.2%'' then',
'to_date(''08/01/2020'',''MM/DD/RRRR'')',
'else',
'null',
'end',
') MAIN_EOL',
',max(',
'case ',
'when oracle_version like ''8%'' then',
'to_date(''01/01/2008'',''MM/DD/RRRR'')',
'when oracle_version like ''9%'' then',
'to_date(''05/01/2009'',''MM/DD/RRRR'')',
'when oracle_version like ''10.1%'' then',
'to_date(''07/31/2010'',''MM/DD/RRRR'')',
'when oracle_version like ''10.2%'' then',
'to_date(''08/31/2012'',''MM/DD/RRRR'')',
'when oracle_version like ''11.1%'' then',
'to_date(''08/31/2015'',''MM/DD/RRRR'')',
'when oracle_version like ''11.2%'' then',
'to_date(''12/31/2020'',''MM/DD/RRRR'')',
'when oracle_version like ''12.1%'' then',
'to_date(''12/31/2022'',''MM/DD/RRRR'')',
'when oracle_version like ''12.2%'' then',
'to_date(''12/31/2023'',''MM/DD/RRRR'')',
'else',
'null',
'end',
') EXTENDED_EOL',
' from ',
'(',
'select',
'v.lov_value oracle_version',
'from v_lov_tbl v',
'where',
'v.lov_category = ''DB_SOFTWARE''',
') v',
' group by oracle_version',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_BU_VENDOR_VERSION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_BU_VENDOR_VERSION_VW" ("BUSINESS_UNIT", "HARDWARE_VENDOR", "ORACLE_VERSION", "DB_CNT", "HOST_CNT") AS ',
'  select  ',
'Nvl(v.Business_unit,''Not Specified'') Business_unit',
',v.Hardware_vendor',
'--,v.os_type',
',v.oracle_version',
',count(distinct database_name) db_cnt',
',count(distinct v.host_name) host_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
'group by',
'Nvl(v.Business_unit,''Not Specified'')',
',v.Hardware_vendor',
'--,v.os_type',
',v.oracle_version',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_BU_VENDOR_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_BU_VENDOR_VW" ("BUSINESS_UNIT", "HARDWARE_VENDOR", "DB_CNT", "HOST_CNT") AS ',
'  select  ',
'Nvl(v.Business_unit,''Not Specified'') Business_unit',
',v.Hardware_vendor',
'--,v.os_type',
'--,v.oracle_version',
',count(distinct database_name) db_cnt',
',count(distinct v.host_name) host_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
'group by',
'Nvl(v.Business_unit,''Not Specified'')',
',v.Hardware_vendor',
'--,v.os_type',
'--,v.oracle_version',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_DB_ALL_DETAIL_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_DB_ALL_DETAIL_VW" ("ID", "HOST_NAME", "DATABASE_NAME", "VERSION", "ACTION_TIME", "DESCRIPTION", "PATCH_ID", "STATUS", "OPEN_MODE", "DB_CREATED", "DATABASE_ROLE", "DB_ID", "HARDWARE_VENDOR", "OS_TYPE_V'
||'ERSION", "PHY_VIRT", "DC_LOCATION", "CLUSTERED", "OS_TYPE", "ENV_SOURCE", "ENV_CATEGORY", "APPLICATION_NAME", "BUSINESS_UNIT", "MAIN_EOL", "EXTENDED_EOL", "DB_SUPPORT", "SYSTEM_TYPE") AS ',
'  SELECT',
'    p.id,',
'    h.host_name,',
'    h.database_name,',
'    h.oracle_version version,',
'    p.action_time,',
'    p.description,',
'    p.patch_id,',
'    nvl(p.status,''NoPatch'') status ,',
'    p.open_mode,',
'    p.db_created,',
'    h.database_role,',
'    h.db_id,',
'    h.hardware_vendor,',
'    h.os_type_version,',
'    h.phy_virt,',
'    h.dc_location,',
'    h.clustered,',
'    h.os_type,',
'    h.env_source,',
'    h.env_category,',
'    h.application_name,',
'    h.business_unit,',
'    h.main_eol,',
'    h.extended_eol,',
'    h.db_support,',
'    h.system_type',
'FROM',
' v_registry_sqlpatch p',
',host_db_app_detail_vw h',
'where',
'p.db_id(+) = h.db_id',
'and p.host_name(+) = h.host_name',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_DB_APP_DETAIL_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_DB_APP_DETAIL_VW" ("HOST_ID", "HOST_NAME", "NETWORK_TYPE", "CORE_COUNT", "SERVER_MODEL", "HARDWARE_VENDOR", "OS_TYPE_VERSION", "PHY_VIRT", "DC_LOCATION", "HOST_CODE", "DB_ID", "CLUSTER_ID", "CLUSTERED'
||'", "OS_TYPE", "ENV_SOURCE", "DATABASE_NAME", "ENV_CATEGORY", "ORACLE_VERSION", "DATABASE_ROLE", "APPLICATION_NAME", "BUSINESS_UNIT", "MAIN_EOL", "EXTENDED_EOL", "DB_SUPPORT", "SYSTEM_TYPE") AS ',
'  SELECT',
'    h.id host_id,',
'    h.host_name,',
'    h.network_type,',
'    h.core_count,',
'    h.server_model,',
'    h.hardware_vendor,',
'    h.os_type_version,',
'    h.phy_virt,',
'    h.dc_location,',
'    h.host_code,',
'    h.db_id,',
'    h.cluster_id,',
'    h.clustered,',
'    h.os_type,',
'    h.env_source,',
'         b.database_name,',
'        b.env_category,',
'        b.oracle_version,',
'        b.database_role,',
'        b.application_name,',
'        b.business_unit    ,',
'        s.MAIN_EOL,',
'        s.extended_eol,',
'        case ',
'        when s.MAIN_EOL <= sysdate and s.extended_eol <= sysdate then',
'         ''Out of Support''',
'        when s.MAIN_EOL <= sysdate and s.extended_eol >= sysdate then',
'         ''Extended Support''',
'        when s.MAIN_EOL >= sysdate  then',
'         ''Standard Support''',
'        else',
'         ''No Support Info''',
'        end DB_support ,',
'        case',
'        when        Hardware_vendor in (''ORACLE EXADATA'',''ORACLE ODA'') then',
'         ''Engineered''',
'         else',
'          ''In-House-Build''',
'          end system_type        ',
'FROM',
'    v_host_inv_tbl h',
',    DB_APP_DETAIL_VW b',
',DB_VERSION_LOOKUP_VW s',
'where',
'1 = 1',
'and h.dc_location not in (''techlab'')',
'and h.db_id = b.db_id',
'and b.oracle_version = s.oracle_version(+)',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_DB_PATCH_DETAIL_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_DB_PATCH_DETAIL_VW" ("ID", "HOST_NAME", "DATABASE_NAME", "OPEN_MODE", "DATABASE_ROLE", "DB_CREATED", "DB_ID", "VERSION", "ACTION_TIME", "DESCRIPTION", "PATCH_ID", "STATUS", "HARDWARE_VENDOR", "OS_TYPE'
||'_VERSION", "PHY_VIRT", "DC_LOCATION", "CLUSTERED", "OS_TYPE", "ENV_SOURCE", "ENV_CATEGORY", "APPLICATION_NAME", "BUSINESS_UNIT", "MAIN_EOL", "EXTENDED_EOL", "DB_SUPPORT", "SYSTEM_TYPE") AS ',
'  SELECT',
'    id,',
'    p.host_name,',
'    p.database_name,',
'    p.open_mode,',
'    p.database_role,',
'    p.db_created,',
'    p.db_id,',
'    p.version,',
'    p.action_time,',
'    p.description,',
'    p.patch_id,',
'    p.status,',
'    h.hardware_vendor,',
'    h.os_type_version,',
'    h.phy_virt,',
'    h.dc_location,',
'    h.clustered,',
'    h.os_type,',
'    h.env_source,',
'    h.env_category,',
'    h.application_name,',
'    h.business_unit,',
'    h.main_eol,',
'    h.extended_eol,',
'    h.db_support,',
'    h.system_type',
'FROM',
' v_registry_sqlpatch p',
',host_db_app_detail_vw h',
'where',
'p.db_id = h.db_id',
'and p.host_name = h.host_name',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_VENDOR_VERSION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_VENDOR_VERSION_VW" ("HARDWARE_VENDOR", "ORACLE_VERSION", "DB_CNT", "HOST_CNT") AS ',
'  select  ',
'v.Hardware_vendor',
'--,v.os_type',
',v.oracle_version',
',count(distinct database_name) db_cnt',
',count(distinct v.host_name) host_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
'group by',
'v.Hardware_vendor',
'--,v.os_type',
',v.oracle_version',
';',
'--------------------------------------------------------',
'--  DDL for View HOST_VENDOR_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."HOST_VENDOR_VW" ("HARDWARE_VENDOR", "DB_CNT", "HOST_CNT", "HOST_PCT", "DB_PCT", "SUMMARY_TEXT") AS ',
'  select',
'v."HARDWARE_VENDOR",v."DB_CNT",v."HOST_CNT"',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) host_pct',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) db_pct',
',initcap(v.Hardware_vendor)||'' ''||round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) ||''% of Server Fleet, including ''||db_cnt||'' databases on ''||v.host_cnt||'' Servers.'' summary_text',
'from',
'(select  ',
'v.Hardware_vendor',
'--,v.os_type',
',count(distinct database_name) db_cnt',
',count(distinct v.host_name) host_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
'group by',
'v.Hardware_vendor',
'--,v.os_type',
') v',
';',
'--------------------------------------------------------',
'--  DDL for View ITSM_SC_REQUEST_ITEM_VA',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."ITSM_SC_REQUEST_ITEM_VA" ("TICKET_ID", "SHORT_DESCRIPTION", "DESCRIPTION", "SYS_CREATED_BY", "ITEM_TICKET_ID", "ITEM_DESC", "SYS_ID", "ITEM_SYS_ID") AS ',
'  select',
'r.ticket_id',
',r.short_description',
',r.description',
',r.sys_created_by',
',i.ticket_id item_ticket_id',
',i.short_description item_desc',
',r.sys_id',
',i.sys_id item_sys_id',
'from',
'v_itsm_sc_request r',
',v_itsm_sc_req_item i',
'where',
'r.sys_id = i.request_sys_id',
';',
'--------------------------------------------------------',
'--  DDL for View ITSM_SC_REQUEST_ITEM_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."ITSM_SC_REQUEST_ITEM_VW" ("TICKET_ID", "SHORT_DESCRIPTION", "DESCRIPTION", "SYS_CREATED_BY", "ITEM_TICKET_ID", "ITEM_DESC", "SYS_ID", "ITEM_SYS_ID") AS ',
'  select',
'r.ticket_id',
',r.short_description',
',r.description',
',r.sys_created_by',
',i.ticket_id item_ticket_id',
',i.short_description item_desc',
',r.sys_id',
',i.sys_id item_sys_id',
'from',
'v_itsm_sc_request r',
',v_itsm_sc_req_item i',
'where',
'r.sys_id = i.request_sys_id',
';',
'--------------------------------------------------------',
'--  DDL for View ITSM_SC_REQUEST_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."ITSM_SC_REQUEST_VW" ("NAME", "SNOW_URL_LINK", "SYS_ID", "TICKET_ID", "DESCRIPTION", "ASSIGNMENT_GROUP", "ASSIGNMENT_GROUP_NAME", "STATE", "CLOSED_AT", "ACTIVE", "PRIORITY", "BUSINESS_SERVICE", "OPENED_AT",'
||' "PARENT", "SPECIAL_INSTRUCTIONS", "WORK_NOTES", "SHORT_DESCRIPTION", "WORK_START", "WORK_NOTES_LIST", "COMPANY", "REQUESTED_DATE", "URGENCY", "CONTACT_TYPE", "CLOSED_BY", "CLOSE_NOTES", "ASSIGNED_TO", "ASSIGNED_TO_NAME", "COMMENTS", "APPROVAL", "SLA'
||'_DUE", "COMMENTS_AND_WORK_NOTES", "DUE_DATE", "REQUEST_STATE", "STAGE", "ESCALATION", "UPON_APPROVAL", "OPENED_BY", "OPENED_BY_NAME", "SKILLS", "REQUESTED_FOR", "REQUESTED_FOR_NAME", "MADE_SLA", "SYS_CREATED_BY", "SYS_CREATED_ON", "SYS_UPDATED_BY", "'
||'SYS_UPDATED_ON", "OWNED_BY_SYS_ID", "MANAGED_BY_SYS_ID") AS ',
'  SELECT',
'    r.name,',
'    ''https://onepointdemo.service-now.com/nav_to.do?uri=sc_request.do?sys_id=''||r.sys_id snow_url_link,',
'    r.sys_id,',
'    r.ticket_id,',
'    r.description,',
'    r.assignment_group,',
'    grp.name assignment_group_name,',
'    r.state,',
'    r.closed_at,',
'    r.active,',
'    r.priority,',
'    r.business_service,',
'    r.opened_at,',
'    r.parent,',
'    r.special_instructions,',
'    r.work_notes,',
'    r.short_description,',
'    r.work_start,',
'    r.work_notes_list,',
'    r.company,',
'    r.requested_date,',
'    r.urgency,',
'    r.contact_type,',
'    r.closed_by,',
'    r.close_notes,',
'    r.assigned_to,',
'    ap.name assigned_to_name,',
'    r.comments,',
'    r.approval,',
'    r.sla_due,',
'    r.comments_and_work_notes,',
'    r.due_date,',
'    r.request_state,',
'    r.stage,',
'    r.escalation,',
'    r.upon_approval,',
'    r.opened_by,',
'    oby.name opened_by_name,',
'    r.skills,',
'    r.requested_for,',
'    rfor.name requested_for_name ,',
'    r.made_sla,',
'    r.sys_created_by,',
'    r.sys_created_on,',
'    r.sys_updated_by,',
'    r.sys_updated_on,',
'    r.owned_by_sys_id,',
'    r.managed_by_sys_id',
'FROM',
'    v_itsm_sc_request r',
'    ,v_itsm_sys_user oby',
'    ,v_itsm_sys_user rfor',
'    ,v_itsm_sys_user ap',
'    ,v_itsm_sys_user_group grp',
'where',
'r.opened_by = oby.sys_id(+) ',
'and r.assigned_to = ap.sys_id(+) ',
'and r.requested_for = rfor.sys_id(+) ',
'and r.assignment_group =   grp.sys_id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View LOGGER_LOGS_5_MIN',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."LOGGER_LOGS_5_MIN" ("ID", "LOGGER_LEVEL", "TEXT", "TIME_STAMP", "SCOPE", "MODULE", "ACTION", "USER_NAME", "CLIENT_IDENTIFIER", "CALL_STACK", "UNIT_NAME", "LINE_NO", "SCN", "EXTRA", "SID", "CLIENT_INFO") AS'
||' ',
'  select "ID","LOGGER_LEVEL","TEXT","TIME_STAMP","SCOPE","MODULE","ACTION","USER_NAME","CLIENT_IDENTIFIER","CALL_STACK","UNIT_NAME","LINE_NO","SCN","EXTRA","SID","CLIENT_INFO" ',
'      from logger_logs ',
'	 where time_stamp > systimestamp - (5/1440)',
';',
'--------------------------------------------------------',
'--  DDL for View LOGGER_LOGS_60_MIN',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."LOGGER_LOGS_60_MIN" ("ID", "LOGGER_LEVEL", "TEXT", "TIME_STAMP", "SCOPE", "MODULE", "ACTION", "USER_NAME", "CLIENT_IDENTIFIER", "CALL_STACK", "UNIT_NAME", "LINE_NO", "SCN", "EXTRA", "SID", "CLIENT_INFO") A'
||'S ',
'  select "ID","LOGGER_LEVEL","TEXT","TIME_STAMP","SCOPE","MODULE","ACTION","USER_NAME","CLIENT_IDENTIFIER","CALL_STACK","UNIT_NAME","LINE_NO","SCN","EXTRA","SID","CLIENT_INFO" ',
'      from logger_logs ',
'	 where time_stamp > systimestamp - (1/24)',
';',
'--------------------------------------------------------',
'--  DDL for View LOGGER_LOGS_TERSE',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."LOGGER_LOGS_TERSE" ("ID", "LOGGER_LEVEL", "TIME_AGO", "TEXT") AS ',
'  select id, logger_level, ',
'        substr(logger.date_text_format(time_stamp),1,20) time_ago,',
'        substr(text,1,200) text',
'   from logger_logs',
'  where time_stamp > systimestamp - (5/1440)',
'  order by id asc',
';',
'--------------------------------------------------------',
'--  DDL for View NON_CLUSTERED_HOST_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."NON_CLUSTERED_HOST_VW" ("HOST_NAME", "DC_LOCATION") AS ',
'  Select Host_name, dc_location from v_host_inv_tbl where',
'  host_code not in (select distinct v_host_code from v_cluster_member_tbl)',
'  and os_type_version like ''Linux'' and hardware_vendor not like ''ORACLE%''',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_BURNDOWN_SUMMARY_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_BURNDOWN_SUMMARY_VW" ("PATCH_WEEK", "PATCH_WEEK_C", "TOTAL_PATCHED", "TOTAL_UNPATCHED", "TOTAL_DBS", "TOTAL_PATCHABLE", "TOTAL_UNPATCHABLE") AS ',
'  select',
'p.patch_Week',
',to_char(p.patch_Week,''DD-MON-RR'')patch_Week_c',
',sum(p.patched) over (order by p.patch_Week) Total_patched',
',s.total_patchable - sum(p.patched) over (order by p.patch_Week) Total_unpatched',
',s.total_dbs',
',s.total_patchable',
',s.total_unpatchable',
'from',
'(select ',
'trunc(next_day(v.action_time,''MONDAY'')) patch_Week',
',sum(',
'case when v.action_time is not null then',
' 1',
'else',
'0',
'end',
') patched',
'from ',
'host_db_all_detail_vw v',
'where',
' v.action_time is not null',
'group by ',
'trunc(next_day(v.action_time,''MONDAY''))',
'union all',
'select',
'next_day(min(v.action_time) - 7,''MONDAY'') patch_Week',
',0 patched',
'from host_db_all_detail_vw v',
'order by 1',
') p',
',(',
'select',
'sum(db_cnt) total_dbs',
',sum(',
'case ',
'when oracle_version like ''11%'' or oracle_version like ''12%'' then',
' db_cnt',
'else',
' 0',
'end  ',
') total_patchable',
',sum(',
'case ',
'when oracle_version like ''8%'' or oracle_version like ''9%'' or oracle_version like ''10%'' then',
' db_cnt',
'else',
' 0',
'end  ',
') total_unpatchable',
'from PATCH_VERSION_SUMMARY_VW',
') s',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_HOST_VENDOR_VERSION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_HOST_VENDOR_VERSION_VW" ("HARDWARE_VENDOR", "ORACLE_VERSION", "DB_CNT", "PATCH_DB_CNT", "HOST_CNT", "PATCH_CNT", "HOST_PCT", "DB_PCT", "SUMMARY_TEXT") AS ',
'  select',
'v."HARDWARE_VENDOR",v."ORACLE_VERSION",v."DB_CNT",v."PATCH_DB_CNT",v."HOST_CNT",v."PATCH_CNT"',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) host_pct',
',round((RATIO_TO_REPORT(db_cnt)OVER ()) * 100,0) db_pct',
',initcap(v.Hardware_vendor)||'' ''||round((v.patch_db_cnt / v.db_cnt) * 100,0) ||''% of DB Fleet, patched  ''||patch_db_cnt||'' databases out of ''||v.db_cnt||'' for server population.'' summary_text',
'from',
'(select  ',
'v.Hardware_vendor',
',v.oracle_version',
',count( v.database_name) db_cnt',
',count( p.database_name) patch_db_cnt',
',count( v.host_name) host_cnt',
',sum (',
'case',
'when p.db_id is not null then',
' 1',
'else',
' 0',
'end ',
') patch_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
',host_db_patch_detail_vw p',
'where ',
'v.db_id = p.db_id(+)',
'and v.host_name = p.host_name(+)',
'group by',
'v.Hardware_vendor',
',v.oracle_version',
'--,v.os_type',
') v',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_HOST_VENDOR_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_HOST_VENDOR_VW" ("HARDWARE_VENDOR", "DB_CNT", "PATCH_DB_CNT", "HOST_CNT", "PATCH_CNT", "HOST_PCT", "DB_PCT", "SUMMARY_TEXT") AS ',
'  select',
'v."HARDWARE_VENDOR",v."DB_CNT",v."PATCH_DB_CNT",v."HOST_CNT",v."PATCH_CNT"',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) host_pct',
',round((RATIO_TO_REPORT(db_cnt)OVER ()) * 100,0) db_pct',
',initcap(v.Hardware_vendor)||'' ''||round((v.patch_db_cnt / v.db_cnt) * 100,0) ||''% of DB Fleet, patched  ''||patch_db_cnt||'' databases out of ''||v.db_cnt||'' for server population.'' summary_text',
'from',
'(select  ',
'v.Hardware_vendor',
'--,v.os_type',
',count( v.database_name) db_cnt',
',count( p.database_name) patch_db_cnt',
',count( v.host_name) host_cnt',
',sum (',
'case',
'when p.db_id is not null then',
' 1',
'else',
' 0',
'end ',
') patch_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
',host_db_patch_detail_vw p',
'where ',
'v.db_id = p.db_id(+)',
'and v.host_name = p.host_name(+)',
'group by',
'v.Hardware_vendor',
'--,v.os_type',
') v',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_SUMMARY_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_SUMMARY_VW" ("ID", "PSU_QUARTER", "PSU_NUMBER", "CREATED", "LS_INVENT", "CREATED_BY", "PSU_YEAR", "PATCH_LOG", "HOST_CODE", "PATCH_TYPE", "HOST_NAME", "DB_HOME", "PATCH_STATUS", "MIMETYPE") AS ',
'  SELECT',
'    id,',
'    psu_quarter,',
'    psu_number,',
'    created,',
'    ls_invent,',
'    created_by,',
'    psu_year,',
'    patch_log,',
'    host_code,',
'    patch_type,',
'    host_name,',
'    db_home,',
'    patch_status,',
'    ''application/json'' as MIMETYPE ',
'FROM',
'    v_db_patch_history',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_SUMMARY_VW_OLD',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_SUMMARY_VW_OLD" ("ID", "DB_ID", "DATABASE_NAME", "ENVIRONMENT", "PSU_NUMBER", "PSU_QUARTER", "PSU_YEAR", "LS_INVENT", "PATCH_LOG", "V_HOST_CODE", "MIMETYPE") AS ',
'  SELECT b.ID,b.DB_ID, a.DATABASE_NAME,a.ENVIRONMENT,b.PSU_NUMBER,b.PSU_QUARTER,b.PSU_YEAR,b.LS_INVENT, b.PATCH_LOG, a.v_HOST_CODE , ''application/json'' as MIMETYPE ',
'FROM v_db_inventory a',
', v_db_patch_history b ',
'where a.ID = b.DB_ID(+)',
'    Order by DATABASE_NAME',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_SYSTEM_TYPE_VERSION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_SYSTEM_TYPE_VERSION_VW" ("SYSTEM_TYPE", "ORACLE_VERSION", "DB_CNT", "PATCH_DB_CNT", "HOST_CNT", "PATCH_CNT", "HOST_PCT", "DB_PCT", "SUMMARY_TEXT") AS ',
'  select',
'v."SYSTEM_TYPE",v."ORACLE_VERSION",v."DB_CNT",v."PATCH_DB_CNT",v."HOST_CNT",v."PATCH_CNT"',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) host_pct',
',round((RATIO_TO_REPORT(db_cnt)OVER ()) * 100,0) db_pct',
',initcap(v.system_type)||'' ''||round((v.patch_db_cnt / v.db_cnt) * 100,0) ||''% of DB Fleet, patched  ''||patch_db_cnt||'' databases out of ''||v.db_cnt||'' for server population.'' summary_text',
'from',
'(select  ',
'v.system_type',
',v.oracle_version',
',count( v.database_name) db_cnt',
',count( p.database_name) patch_db_cnt',
',count( v.host_name) host_cnt',
',sum (',
'case',
'when p.db_id is not null then',
' 1',
'else',
' 0',
'end ',
') patch_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
',host_db_patch_detail_vw p',
'where ',
'v.db_id = p.db_id(+)',
'and v.host_name = p.host_name(+)',
'group by',
'v.system_type',
',v.oracle_version',
'--,v.os_type',
') v',
';',
'--------------------------------------------------------',
'--  DDL for View PATCH_VERSION_SUMMARY_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."PATCH_VERSION_SUMMARY_VW" ("ORACLE_VERSION", "DB_CNT", "PATCH_DB_CNT", "HOST_CNT", "PATCH_CNT", "HOST_PCT", "DB_PCT", "SUMMARY_TEXT") AS ',
'  select',
'v."ORACLE_VERSION",v."DB_CNT",v."PATCH_DB_CNT",v."HOST_CNT",v."PATCH_CNT"',
',round((RATIO_TO_REPORT(host_cnt)OVER ()) * 100,0) host_pct',
',round((RATIO_TO_REPORT(db_cnt)OVER ()) * 100,0) db_pct',
',initcap(v.oracle_version)||'' ''||round((v.patch_db_cnt / v.db_cnt) * 100,0) ||''% of DB Fleet, patched  ''||patch_db_cnt||'' databases out of ''||v.db_cnt||'' for version population.'' summary_text',
'from',
'(select  ',
'--v.Hardware_vendor',
'v.oracle_version',
',count( v.database_name) db_cnt',
',count( p.database_name) patch_db_cnt',
',count( v.host_name) host_cnt',
',sum (',
'case',
'when p.db_id is not null then',
' 1',
'else',
' 0',
'end ',
') patch_cnt',
'from HOST_DB_APP_DETAIL_VW  v',
',host_db_patch_detail_vw p',
'where ',
'v.db_id = p.db_id(+)',
'and v.host_name = p.host_name(+)',
'group by',
'--v.Hardware_vendor',
'v.oracle_version',
'--,v.os_type',
') v',
';',
'--------------------------------------------------------',
'--  DDL for View V_ANSIBLE_JOB_TEMPLATE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_ANSIBLE_JOB_TEMPLATE_VW" ("TEMPLATE_ID", "TEMPLATE_NAME", "INVENTORY_ID", "INVENTORY_NAME") AS ',
'  select ',
't.id template_id',
',t.name template_name',
',i.id inventory_id',
',nvl(i.name,''Workflow'')  inventory_name',
'from',
'v_ansible_job_templates t',
',v_ansible_inventories i',
'where',
't.inventory = i.id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View V_APP_PRIVILEGE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_APP_PRIVILEGE_VW" ("USERNAME", "APP_ROLE", "DISPLAY_NAME", "EMAIL_ADDR", "ROLE_DESCRIPTION", "PERSON_ID", "ROLE_ID") AS ',
'  SELECT',
'    p.username,',
'    r.app_role,',
'    p.display_name,',
'    p.email_addr,',
'    r.description role_description,',
'    pr.person_id,',
'    pr.role_id',
'FROM',
'    v_app_person_roles pr',
'    ,v_app_role r ',
'    ,v_app_person p',
'where',
' pr.person_id = p.person_id',
'and pr.role_id = r.role_id',
';',
'--------------------------------------------------------',
'--  DDL for View V_HISTORY_V',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_HISTORY_V" ("ID", "TABLE_NAME", "COLUMN_NAME", "ACTION", "ACTION_DATE", "ACTION_BY", "TABLE_PRIMARY_KEY", "TABLE_ROW_VERSION", "CHANGE") AS ',
'  select id,',
'       table_name,',
'       column_name,',
'       decode(action,''U'',''Update'',''D'',''Delete'') action,',
'       action_date,',
'       action_by,',
'       pk1 table_primary_key,',
'       tab_row_version table_row_version,',
'       decode(data_type,',
'         ''NUMBER'',old_number||'' > ''||new_number,',
'         ''VARCHAR2'',substr(old_vc,1,50)||'' > ''||substr(new_vc,1,50),',
'         ''DATE'',to_char(old_date,''DD-MON-YYY HH24:MI:SS'')||'' > ''||to_char(new_date,''DD-MON-YYY HH24:MI:SS''),',
'         ''TIMESTAMP'',to_char(old_ts,''DD-MON-YYY HH24:MI:SS'')||'' > ''||to_char(new_ts,''DD-MON-YYY HH24:MI:SS''),',
'         ''TIMESTAMP WITH TIMEZONE'',to_char(old_tswtz,''DD-MON-YYY HH24:MI:SS'')||'' > ''||to_char(new_tswtz,''DD-MON-YYY HH24:MI:SS''),',
'         ''TIMESTAMP WITH LOCAL TIMEZONE'',to_char(old_tswltz,''DD-MON-YYY HH24:MI:SS'')||'' > ''||to_char(new_tswltz,''DD-MON-YYY HH24:MI:SS''),',
'         ''BLOB'',''length ''||dbms_lob.getlength(old_blob)||'' > ''||'' length ''||dbms_lob.getlength(new_blob),',
'         ''CLOB'',dbms_lob.substr(old_vc,50,1)||'' > ''||dbms_lob.substr(new_vc,50,1)',
'         ) change',
'from charter2_inv.v_history',
';',
'--------------------------------------------------------',
'--  DDL for View V_HOST_INV_TBL_BUS',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_HOST_INV_TBL_BUS" ("V_HOST_CODE", "BUSINESS_UNIT") AS ',
'  select',
'v_host_code',
',listagg(business_unit, '','') within group (order by 1) business_unit',
'from',
'(',
'select',
'v_host_code',
',business_unit',
'from v_db_inventory',
'where',
'v_host_code is not null',
'group by ',
'v_host_code',
',business_unit',
')',
'group by ',
'v_host_code',
';',
'--------------------------------------------------------',
'--  DDL for View V_HOST_INV_TBL_ENV',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_HOST_INV_TBL_ENV" ("V_HOST_CODE", "ENVIRONMENT") AS ',
'  select',
'v_host_code',
',listagg(environment, '','') within group (order by 1) environment',
''))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(46153197505810586)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'from',
'(',
'select',
'v_host_code',
',environment',
'from v_db_inventory',
'where',
'v_host_code is not null',
'group by ',
'v_host_code',
',environment',
')',
'group by ',
'v_host_code',
';',
'--------------------------------------------------------',
'--  DDL for View V_HOST_INV_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_HOST_INV_VW" ("HOST_NAME", "NETWORK_TYPE", "CLUSTER_NAME", "DC_LOCATION", "CORE_COUNT", "OS_TYPE_VERSION", "PHY_VIRT", "HARDWARE_VENDOR", "SERVER_MODEL", "HOST_CODE") AS ',
'  SELECT a.HOST_NAME, a.NETWORK_TYPE, b.CLUSTER_NAME,a.DC_LOCATION, a.CORE_COUNT,a.OS_TYPE_VERSION, a.PHY_VIRT, a.HARDWARE_VENDOR,a.SERVER_MODEL, a.HOST_CODE',
'from V_HOST_INV_TBL a  LEFT OUTER JOIN V_CLUSTER_MEMBER_TBL b',
'on  a.HOST_CODE = b.V_HOST_CODE',
'order by a.HOST_CODE',
';',
'--------------------------------------------------------',
'--  DDL for View V_ITSM_APPLICATION_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_ITSM_APPLICATION_VW" ("NAME", "SYS_ID", "OWNED_BY_SYS_ID", "MANAGED_BY_SYS_ID", "U_APPLICATION_ID", "CHANGE_CONTROL_GROUP", "ASSIGNMENT_GROUP", "CATEGORY", "U_DATA_CATEGORY", "U_DATA_CLASSIFICATION", "SY'
||'S_CREATED_BY", "SYS_CREATED_ON", "SYS_UPDATED_BY", "SYS_UPDATED_ON", "OWNED_BY_NAME", "MANAGED_BY_NAME", "CHANGE_GROUP_NAME") AS ',
'  SELECT',
'    r.name,',
'    r.sys_id,',
'    r.owned_by_sys_id,',
'    r.managed_by_sys_id,',
'    r.u_application_id,',
'    r.change_control_group,',
'    r.assignment_group,',
'    r.category,',
'    r.u_data_category,',
'    r.u_data_classification,',
'    r.sys_created_by,',
'    r.sys_created_on,',
'    r.sys_updated_by,',
'    r.sys_updated_on,',
'    o.name owned_by_name, ',
'    m.name managed_by_name,',
'    cgrp.name change_group_name',
'FROM',
'    v_itsm_cmdb_ci r',
'    ,v_itsm_sys_user o',
'    ,v_itsm_sys_user m',
'    ,v_itsm_sys_user_group cgrp',
'where',
'r.owned_by_sys_id = o.sys_id(+) ',
'and r.managed_by_sys_id = m.sys_id(+) ',
'and r.change_control_group =   cgrp.sys_id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View V_ITSM_CHANGE_REQUEST_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_ITSM_CHANGE_REQUEST_VW" ("REQUESTED_FOR_NAME", "SNOW_URL_LINK", "ASSIGNED_TO_NAME", "ASSIGNMENT_GROUP_NAME", "OPENED_BY_NAME", "CI_NAME", "CI_CATEGORY", "CI_APP_ID", "NAME", "SYS_ID", "CHANGE_ID", "DESCR'
||'IPTION", "TEST_PLAN", "IMPLEMENTATION_PLAN", "CHANGE_PLAN", "BACKOUT_PLAN", "ASSIGNMENT_GROUP", "STATE", "PHASE", "IMPACT", "CMDB_CI_SYS_ID", "CLOSED_AT", "ACTIVE", "PRIORITY", "PRODUCTION_SYSTEM", "REQUESTED_BY", "ASSIGNED_TO", "BUSINESS_SERVICE", "'
||'REVIEW_DATE", "START_DATE", "END_DATE", "CONFLICT_STATUS", "OPENED_AT", "PARENT", "SPECIAL_INSTRUCTIONS", "WORK_NOTES", "SHORT_DESCRIPTION", "WORK_START", "WORK_NOTES_LIST", "COMPANY", "REQUESTED_DATE", "URGENCY", "CONTACT_TYPE", "CLOSED_BY", "CLOSE_'
||'NOTES", "COMMENTS_AND_WORK_NOTES", "APPROVAL", "SLA_DUE", "DUE_DATE", "REQUEST_STATE", "STAGE", "ESCALATION", "UPON_APPROVAL", "OPENED_BY", "SKILLS", "REQUESTED_FOR", "MADE_SLA", "SYS_CREATED_BY", "SYS_UPDATED_BY", "SYS_UPDATED_ON", "OWNED_BY_SYS_ID"'
||', "MANAGED_BY_SYS_ID") AS ',
'  SELECT',
'    rfor.name requested_for_name ,',
'    ''https://onepointdemo.service-now.com/nav_to.do?uri=change_request.do?sys_id=''||r.sys_id snow_url_link,',
'    ap.name assigned_to_name,',
'    grp.name assignment_group_name,',
'    oby.name opened_by_name,',
'    ci.name ci_name,',
'    ci.category ci_category,',
'    ci.u_application_id ci_app_id,',
'    r.name,',
'    r.sys_id,',
'    r.change_id,',
'    r.description,',
'    r.test_plan,',
'    r.implementation_plan,',
'    r.change_plan,',
'    r.backout_plan,',
'    r.assignment_group,',
'    r.state,',
'    r.phase,',
'    r.impact,',
'    r.cmdb_ci_sys_id,',
'    r.closed_at,',
'    r.active,',
'    r.priority,',
'    r.production_system,',
'    r.requested_by,',
'    r.assigned_to,',
'    r.business_service,',
'    r.review_date,',
'    r.start_date,',
'    r.end_date,',
'    r.conflict_status,',
'    r.opened_at,',
'    r.parent,',
'    r.special_instructions,',
'    r.work_notes,',
'    r.short_description,',
'    r.work_start,',
'    r.work_notes_list,',
'    r.company,',
'    r.requested_date,',
'    r.urgency,',
'    r.contact_type,',
'    r.closed_by,',
'    r.close_notes,',
'    r.comments_and_work_notes,',
'    r.approval,',
'    r.sla_due,',
'    r.due_date,',
'    r.request_state,',
'    r.stage,',
'    r.escalation,',
'    r.upon_approval,',
'    r.opened_by,',
'    r.skills,',
'    r.requested_for,',
'    r.made_sla,',
'    r.sys_created_by,',
'    r.sys_updated_by,',
'    r.sys_updated_on,',
'    r.owned_by_sys_id,',
'    r.managed_by_sys_id',
'FROM',
'    v_itsm_change_request r',
'        ,v_itsm_sys_user oby',
'    ,v_itsm_sys_user rfor',
'    ,v_itsm_sys_user ap',
'    ,v_itsm_sys_user_group grp',
'    ,v_itsm_cmdb_ci ci',
'where',
'r.opened_by = oby.sys_id(+) ',
'and r.assigned_to = ap.sys_id(+) ',
'and r.requested_for = rfor.sys_id(+) ',
'and r.assignment_group =   grp.sys_id(+)  ',
'and r.cmdb_ci_sys_id = ci.sys_id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View V_ITSM_SC_REQUEST_QUE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_ITSM_SC_REQUEST_QUE_VW" ("NAME", "SNOW_URL_LINK", "SYS_ID", "TICKET_ID", "DESCRIPTION", "ASSIGNMENT_GROUP", "ASSIGNMENT_GROUP_NAME", "STATE", "CLOSED_AT", "ACTIVE", "PRIORITY", "BUSINESS_SERVICE", "OPENE'
||'D_AT", "PARENT", "SPECIAL_INSTRUCTIONS", "WORK_NOTES", "SHORT_DESCRIPTION", "WORK_START", "WORK_NOTES_LIST", "COMPANY", "REQUESTED_DATE", "URGENCY", "CONTACT_TYPE", "CLOSED_BY", "CLOSE_NOTES", "ASSIGNED_TO", "ASSIGNED_TO_NAME", "COMMENTS", "APPROVAL"'
||', "SLA_DUE", "COMMENTS_AND_WORK_NOTES", "DUE_DATE", "REQUEST_STATE", "STAGE", "ESCALATION", "UPON_APPROVAL", "OPENED_BY", "OPENED_BY_NAME", "SKILLS", "REQUESTED_FOR", "REQUESTED_FOR_NAME", "MADE_SLA", "SYS_CREATED_BY", "SYS_CREATED_ON", "SYS_UPDATED_'
||'BY", "SYS_UPDATED_ON", "OWNED_BY_SYS_ID", "MANAGED_BY_SYS_ID") AS ',
'  SELECT',
'    r.name,',
'    ''https://onepointdemo.service-now.com/nav_to.do?uri=sc_request.do?sys_id=''||r.sys_id snow_url_link,',
'    r.sys_id,',
'    r.ticket_id,',
'    r.description,',
'    r.assignment_group,',
'    grp.name assignment_group_name,',
'    r.state,',
'    r.closed_at,',
'    r.active,',
'    r.priority,',
'    r.business_service,',
'    r.opened_at,',
'    r.parent,',
'    r.special_instructions,',
'    r.work_notes,',
'    r.short_description,',
'    r.work_start,',
'    r.work_notes_list,',
'    r.company,',
'    r.requested_date,',
'    r.urgency,',
'    r.contact_type,',
'    r.closed_by,',
'    r.close_notes,',
'    r.assigned_to,',
'    ap.name assigned_to_name,',
'    r.comments,',
'    r.approval,',
'    r.sla_due,',
'    r.comments_and_work_notes,',
'    r.due_date,',
'    r.request_state,',
'    r.stage,',
'    r.escalation,',
'    r.upon_approval,',
'    r.opened_by,',
'    oby.name opened_by_name,',
'    r.skills,',
'    r.requested_for,',
'    rfor.name requested_for_name ,',
'    r.made_sla,',
'    r.sys_created_by,',
'    r.sys_created_on,',
'    r.sys_updated_by,',
'    r.sys_updated_on,',
'    r.owned_by_sys_id,',
'    r.managed_by_sys_id',
'FROM',
'    v_itsm_sc_request r',
'    ,v_itsm_sys_user oby',
'    ,v_itsm_sys_user rfor',
'    ,v_itsm_sys_user ap',
'    ,v_itsm_sys_user_group grp',
'where',
'r.opened_by = oby.sys_id(+) ',
'and r.assigned_to = ap.sys_id(+) ',
'and r.requested_for = rfor.sys_id(+) ',
'and r.assignment_group =   grp.sys_id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_BU_TOT_SUM',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_BU_TOT_SUM" ("BUSINESS_UNIT", "TOTAL_DATABASES", "PERCENT_RANK_BU_PCT", "BUSINESS_UNIT_LABEL") AS ',
'  select',
'    i.business_unit,',
'    i.total_databases,',
'ROUND(( i.total_databases/s.total_databases)*100, 1)  percent_rank_bu_pct,',
'    i.business_unit||'' - ''||ROUND(( i.total_databases/s.total_databases)*100, 1)||''%'' business_unit_label',
'from',
'(SELECT',
'    i.business_unit,',
'    count(distinct i.database_name) total_databases',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    ) ',
'group by ',
'i.business_unit',
') i',
',(',
'SELECT',
'    count(distinct i.database_name) total_databases',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
'    ) s',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_DETAIL',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_DETAIL" ("DATABASE_NAME", "PRODUCT", "V_HOST_CODE", "ORACLE_VERSION", "DATABASE_ROLE", "USAGE", "FIRST_USAGE_DATE", "LAST_USAGE_DATE", "DATABASE_ID", "BASELINE_ID") AS ',
'  SELECT',
'    i.database_name,',
'    ''Enterprise Edition'' product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    ''CURRENT_USAGE'' usage    ,',
'    sysdate - 360 first_usage_date,',
'    sysdate last_usage_date,',
'    i.database_id,',
'    i.baseline_id',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )    ',
'union all',
'SELECT distinct',
'    p.database_name,',
'    p.product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    usage    ,',
'    p.first_usage_date,',
'    p.last_usage_date,',
'    i.database_id,',
'    p.baseline_id',
'FROM',
'    v_lic_product_usage p',
'    ,v_lic_db_inventory i',
'WHERE',
'p.baseline_id = i.baseline_id',
'and p.database_name = i.database_name',
'and p.usage in (''CURRENT_USAGE'',''PAST_USAGE'')',
'and    p.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_DETAIL_ALL',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_DETAIL_ALL" ("DATABASE_NAME", "PRODUCT", "V_HOST_CODE", "ORACLE_VERSION", "DATABASE_ROLE", "USAGE", "FIRST_USAGE_DATE", "LAST_USAGE_DATE", "DATABASE_ID", "BASELINE_ID") AS ',
'  SELECT',
'    i.database_name,',
'    ''Enterprise Edition'' product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    ''CURRENT_USAGE'' usage    ,',
'    sysdate - 360 first_usage_date,',
'    sysdate last_usage_date,',
'    i.database_id,',
'    i.baseline_id',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )    ',
'union all',
'SELECT distinct',
'    p.database_name,',
'    p.product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    usage    ,',
'    p.first_usage_date,',
'    p.last_usage_date,',
'    i.database_id,',
'    p.baseline_id',
'FROM',
'    v_lic_product_usage p',
'    ,v_lic_db_inventory i',
'WHERE',
'p.baseline_id = i.baseline_id',
'and p.database_name = i.database_name',
'--and p.usage in (''CURRENT_USAGE'',''PAST_USAGE'')',
'and    p.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_DETAIL_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_DETAIL_C1" ("DATABASE_NAME", "PRODUCT", "V_HOST_CODE", "ORACLE_VERSION", "DATABASE_ROLE", "USAGE", "FIRST_USAGE_DATE", "LAST_USAGE_DATE", "DATABASE_ID", "BASELINE_ID") AS ',
'  SELECT',
'    i.database_name,',
'    ''Enterprise Edition'' product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    ''CURRENT_USAGE'' usage    ,',
'    sysdate - 360 first_usage_date,',
'    sysdate last_usage_date,',
'    i.database_id,',
'    i.baseline_id',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP1''',
'    )    ',
'union all',
'SELECT distinct',
'    p.database_name,',
'    p.product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    usage    ,',
'    p.first_usage_date,',
'    p.last_usage_date,',
'    i.database_id,',
'    p.baseline_id',
'FROM',
'    v_lic_product_usage p',
'    ,v_lic_db_inventory i',
'WHERE',
'p.baseline_id = i.baseline_id',
'and p.database_name = i.database_name',
'and p.usage in (''CURRENT_USAGE'',''PAST_USAGE'')',
'and    p.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP1''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_DETAIL_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_DETAIL_C2" ("DATABASE_NAME", "PRODUCT", "V_HOST_CODE", "ORACLE_VERSION", "DATABASE_ROLE", "USAGE", "FIRST_USAGE_DATE", "LAST_USAGE_DATE", "DATABASE_ID", "BASELINE_ID") AS ',
'  SELECT',
'    i.database_name,',
'    ''Enterprise Edition'' product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    ''CURRENT_USAGE'' usage    ,',
'    sysdate - 360 first_usage_date,',
'    sysdate last_usage_date,',
'    i.database_id,',
'    i.baseline_id',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP2''',
'    )    ',
'union all',
'SELECT distinct',
'    p.database_name,',
'    p.product,',
'    i.v_host_code ,',
'    i.oracle_version,',
'    i.database_role,',
'    usage    ,',
'    p.first_usage_date,',
'    p.last_usage_date,',
'    i.database_id,',
'    p.baseline_id',
'FROM',
'    v_lic_product_usage p',
'    ,v_lic_db_inventory i',
'WHERE',
'p.baseline_id = i.baseline_id',
'and p.database_name = i.database_name',
'and p.usage in (''CURRENT_USAGE'',''PAST_USAGE'')',
'and    p.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP2''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_INV_DET',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_INV_DET" ("DATABASE_ID", "BASELINE_ID", "DATABASE_NAME", "APPLICATION_NAME", "ENVIRONMENT", "ORACLE_VERSION", "RAC_TYPE", "BUSINESS_UNIT", "APPLIANCE", "DATABASE_ROLE", "PCI_REQUIRED", "SOX_'
||'REQUIRED", "ENCRYPTION_REQUIRED", "DATAGUARD", "GOLDEN_GATE", "BACKUP_ENABLED", "END_OF_LIFE", "DB_MONITORING_TOOL", "MONITORING", "COMMENTS", "INSTANCE_COUNT", "DB_SOURCE", "DR_SOLUTION", "DR_LOCATION", "ENV_CATEGORY", "V_HOST_CODE", "CREATED", "CRE'
||'ATED_BY", "UPDATED", "UPDATED_BY", "APP_ID", "STORAGE_TYPE", "DB_HOME", "SW_CSI", "REF_APP_ID") AS ',
'  SELECT',
'    database_id,',
'    baseline_id,',
'    database_name,',
'    application_name,',
'    environment,',
'    oracle_version,',
'    rac_type,',
'    business_unit,',
'    appliance,',
'    database_role,',
'    pci_required,',
'    sox_required,',
'    encryption_required,',
'    dataguard,',
'    golden_gate,',
'    backup_enabled,',
'    end_of_life,',
'    db_monitoring_tool,',
'    monitoring,',
'    comments,',
'    instance_count,',
'    db_source,',
'    dr_solution,',
'    dr_location,',
'    env_category,',
'    v_host_code,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by,',
'    app_id,',
'    storage_type,',
'    db_home,',
'    sw_csi,',
'    ref_app_id',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DATABASE_VER_TOT_SUM',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DATABASE_VER_TOT_SUM" ("ORACLE_VERSION", "TOTAL_DATABASES") AS ',
'  SELECT',
'    i.oracle_version,',
'    count(distinct i.database_name) total_databases',
'FROM',
'    v_lic_db_inventory i',
'WHERE',
'    baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    ) ',
'group by ',
'i.oracle_version',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_DISCOVERY_SCHEDULE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_DISCOVERY_SCHEDULE_VW" ("LIC_SCHEDULE_ID", "SCHEDULE_NAME", "SCHEDULE_TYPE", "TICKET_REF", "NUMBER_HOSTS", "HOST_NAME", "FILTER_PARMS", "EXECUTE_INTERVAL", "SCHEDULE_START_HR", "LAST_START_TIME", "NU'
||'MBER_OF_RUNS", "STATUS", "CREATED", "CREATED_BY", "UPDATED", "UPDATED_BY", "SCHEDULE_START_DATE", "LAST_RUN_TIME", "CURRENT_RUN_TIME", "LAST_SCHEDULE_ID", "CURRENT_SCHEDULE_ID", "SELF_SERVICE_REQUEST_ID") AS ',
'  SELECT',
'    d.lic_schedule_id,',
'    d.schedule_name,',
'    d.schedule_type,',
'    d.ticket_ref,',
'     case',
'     when d.host_name is not null then',
'     length(d.host_name) - length(replace(d.host_name,'','')) +  1',
'     else',
'     0',
'     end number_hosts,',
'    d.host_name,',
'    d.filter_parms,',
'    d.execute_interval,',
'    d.schedule_start_hr,',
'    d.last_start_time,',
'    d.number_of_runs,',
'    d.status,',
'    d.created,',
'    d.created_by,',
'    d.updated,',
'    d.updated_by,',
'    d.schedule_start_date,',
'   l.process_start_time last_run_time ,',
'   c.process_start_time current_run_time ,',
'    d.last_schedule_id,',
'    d.CURRENT_SCHEDULE_ID,',
'    c.self_service_request_id ',
'FROM',
'    v_lic_discovery_schedule d',
'    ,    V_SCHEDULE_QUEUE  l',
'    ,    V_SCHEDULE_QUEUE_VW  c',
'    ',
'where',
'd.last_schedule_id  = l.schedule_id(+)',
'and d.CURRENT_SCHEDULE_ID = c.schedule_id(+)',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_JSONLOAD_FEATURE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_JSONLOAD_FEATURE_VW" ("STATUS_ID", "RECORD_CREATED", "HOST_NAME", "INSTANCE_NAME", "DATABASE_NAME", "OPEN_MODE", "DATABASE_ROLE", "CREATED", "DBID", "VERSION", "BANNER", "PRODUCT", "FEATURE_BEING_USE'
||'D", "USAGE", "LAST_SAMPLE_DATE", "DETECTED_USAGES", "TOTAL_SAMPLES", "CURRENTLY_USED", "FIRST_USAGE_DATE", "LAST_USAGE_DATE", "EXTRA_FEATURE_INFO") AS ',
'  select',
'tp.status_id,tp.record_created,x."HOST_NAME",x."INSTANCE_NAME",x."DATABASE_NAME",x."OPEN_MODE",x."DATABASE_ROLE",x."CREATED",x."DBID",x."VERSION",x."BANNER",x."PRODUCT",x."FEATURE_BEING_USED",x."USAGE",x."LAST_SAMPLE_DATE",x."DETECTED_USAGES",x."TOTA'
||'L_SAMPLES",x."CURRENTLY_USED",x."FIRST_USAGE_DATE",x."LAST_USAGE_DATE",x."EXTRA_FEATURE_INFO"',
'from',
'(SELECT',
'    task_body',
'    ,created record_created',
'    ,status_id',
'FROM',
'    v_process_status tp',
' where',
'tp. record_type  = ''LOAD_JSON''',
' and tp.task_message like ''%Feature Data%''',
' )tp',
' , XMLTABLE(',
'    ''/json/row'' PASSING apex_json.to_xmltype(tp.task_body) ',
'    COLUMNS ',
'      host_name VARCHAR2(255) PATH ''host_name''',
'    ,instance_name VARCHAR2(255) PATH ''instance_name''',
'    ,database_name VARCHAR2(255) PATH ''database_name''',
'    ,open_mode VARCHAR2(255) PATH ''open_mode''',
'    ,database_role VARCHAR2(255) PATH ''database_role''',
'    ,created VARCHAR2(255) PATH ''created''',
'    ,dbid VARCHAR2(255) PATH ''dbid''',
'    ,version VARCHAR2(255) PATH ''version''',
'    ,banner VARCHAR2(255) PATH ''banner''',
'    ,product VARCHAR2(1000) PATH ''product''',
'    ,feature_being_used VARCHAR2(1000) PATH ''feature_being_used''',
'    ,usage VARCHAR2(255) PATH ''usage''',
'    ,last_sample_date VARCHAR2(255) PATH ''last_sample_date''',
'        ,detected_usages VARCHAR2(255) PATH ''detected_usages''',
'    ,total_samples VARCHAR2(255) PATH ''total_samples''',
'    ,currently_used VARCHAR2(255) PATH ''currently_used''',
'    ,first_usage_date VARCHAR2(255) PATH ''first_usage_date''',
'    ,last_usage_date VARCHAR2(255) PATH ''last_usage_date''',
'    ,extra_feature_info VARCHAR2(255) PATH ''extra_feature_info''',
'    ) x',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_JSONLOAD_PRODUCT_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_JSONLOAD_PRODUCT_VW" ("STATUS_ID", "RECORD_CREATED", "HOST_NAME", "INSTANCE_NAME", "DATABASE_NAME", "OPEN_MODE", "DATABASE_ROLE", "CREATED", "DBID", "VERSION", "BANNER", "GID", "CON_ID", "CON_NAME", '
||'"PRODUCT", "FEATURE_BEING_USED", "USAGE", "LAST_SAMPLE_DATE", "CURRENTLY_USED", "FIRST_USAGE_DATE", "LAST_USAGE_DATE") AS ',
'  select',
'tp.status_id,tp.record_created,x."HOST_NAME",x."INSTANCE_NAME",x."DATABASE_NAME",x."OPEN_MODE",x."DATABASE_ROLE",x."CREATED",x."DBID",x."VERSION",x."BANNER",x."GID",x."CON_ID",x."CON_NAME",x."PRODUCT",x."FEATURE_BEING_USED",x."USAGE",x."LAST_SAMPLE_D'
||'ATE",x."CURRENTLY_USED",x."FIRST_USAGE_DATE",x."LAST_USAGE_DATE"',
'from',
'(SELECT',
'    task_body',
'    ,created record_created',
'    ,status_id',
'FROM',
'    v_process_status tp',
' where',
'tp. record_type  = ''LOAD_JSON''',
' and tp.task_message like ''%Product Data%''',
' )tp',
' , XMLTABLE(',
'    ''/json/row'' PASSING apex_json.to_xmltype(tp.task_body) ',
'    COLUMNS ',
'      host_name VARCHAR2(255) PATH ''host_name''',
'    ,instance_name VARCHAR2(255) PATH ''instance_name''',
'    ,database_name VARCHAR2(255) PATH ''database_name''',
'    ,open_mode VARCHAR2(255) PATH ''open_mode''',
'    ,database_role VARCHAR2(255) PATH ''database_role''',
'    ,created VARCHAR2(255) PATH ''created''',
'    ,dbid VARCHAR2(255) PATH ''dbid''',
'    ,version VARCHAR2(255) PATH ''version''',
'    ,banner VARCHAR2(255) PATH ''banner''',
'    ,gid VARCHAR2(255) PATH ''gid''',
'    ,con_id VARCHAR2(255) PATH ''con_id''',
'    ,con_name VARCHAR2(255) PATH ''con_name''    ',
'    ,product VARCHAR2(1000) PATH ''product''',
'    ,feature_being_used VARCHAR2(1000) PATH ''feature_being_used''',
'    ,usage VARCHAR2(255) PATH ''usage''',
'    ,last_sample_date VARCHAR2(255) PATH ''last_sample_date''',
'    ,currently_used VARCHAR2(255) PATH ''currently_used''',
'    ,first_usage_date VARCHAR2(255) PATH ''first_usage_date''',
'    ,last_usage_date VARCHAR2(255) PATH ''last_usage_date''',
'    ) x',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_DETAIL',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_DETAIL" ("HOST_NAME", "LIC_CORE", "CORE_COUNT", "HARDWARE_VENDOR", "PRODUCT", "V_HOST_CODE", "USAGE", "BASELINE_ID", "PRICE_PER_PROCESSOR", "MAINT_PER_PROCESSOR", "SERVER_MAINT", "SERVER_LICEN'
||'SE") AS ',
'  SELECT distinct',
'    h.host_name,',
'    h.lic_core,',
'    h.core_count,',
'    h.hardware_vendor,',
'    d. product,',
'    d.v_host_code,',
'    d.usage,',
'--    d.first_usage_date,',
'--    d.last_usage_date,',
'    d.baseline_id,',
'    l.price_per_processor,',
'    (l.price_per_processor * .1) maint_per_processor,',
'    (l.price_per_processor * .1) * h.lic_core server_maint,',
'    (l.price_per_processor  * h.lic_core) server_license',
'FROM',
'    v_lic_database_detail d',
'    ,v_lic_host_inv h',
'   ,v_lic_product_price_list l',
'where',
'd.v_host_code = h.host_code',
'and d.product = l.product_key(+)',
'and    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_DETAIL_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_DETAIL_C1" ("HOST_NAME", "LIC_CORE", "CORE_COUNT", "HARDWARE_VENDOR", "PRODUCT", "V_HOST_CODE", "USAGE", "BASELINE_ID", "PRICE_PER_PROCESSOR", "MAINT_PER_PROCESSOR", "SERVER_MAINT", "SERVER_LI'
||'CENSE") AS ',
'  SELECT distinct',
'    h.host_name,',
'    h.lic_core,',
'    h.core_count,',
'    h.hardware_vendor,',
'    d. product,',
'    d.v_host_code,',
'    d.usage,',
'--    d.first_usage_date,',
'--    d.last_usage_date,',
'    d.baseline_id,',
'    l.price_per_processor,',
'    (l.price_per_processor * .1) maint_per_processor,',
'    (l.price_per_processor * .1) * h.lic_core server_maint,',
'    (l.price_per_processor  * h.lic_core) server_license',
'FROM',
'    v_lic_database_detail d',
'    ,v_lic_host_inv h',
'   ,v_lic_product_price_list l',
'where',
'd.v_host_code = h.host_code',
'and d.product = l.product_key(+)',
'and    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.compare_key = ''COMP1''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_DETAIL_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_DETAIL_C2" ("HOST_NAME", "LIC_CORE", "CORE_COUNT", "HARDWARE_VENDOR", "PRODUCT", "V_HOST_CODE", "USAGE", "BASELINE_ID", "PRICE_PER_PROCESSOR", "MAINT_PER_PROCESSOR", "SERVER_MAINT", "SERVER_LI'
||'CENSE") AS ',
'  SELECT distinct',
'    h.host_name,',
'    h.lic_core,',
'    h.core_count,',
'    h.hardware_vendor,',
'    d. product,',
'    d.v_host_code,',
'    d.usage,',
'--    d.first_usage_date,',
'--    d.last_usage_date,',
'    d.baseline_id,',
'    l.price_per_processor,',
'    (l.price_per_processor * .1) maint_per_processor,',
'    (l.price_per_processor * .1) * h.lic_core server_maint,',
'    (l.price_per_processor  * h.lic_core) server_license',
'FROM',
'    v_lic_database_detail d',
'    ,v_lic_host_inv h',
'   ,v_lic_product_price_list l',
'where',
'd.v_host_code = h.host_code',
'and d.product = l.product_key(+)',
'and    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.compare_key = ''COMP2''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_PROD_SUM',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_PROD_SUM" ("PRODUCT", "LIC_CORE", "CORE_COUNT", "TOTAL_COST", "MAINT_COST") AS ',
'  SELECT',
'    s.product,',
'    sum(s.lic_core) lic_core,',
'    sum(s.core_count) core_count,',
'    sum(s.lic_core * l.price_per_processor ) total_cost,',
'    sum((s.lic_core * l.price_per_processor )* .1 ) maint_cost',
'FROM',
'    v_lic_server_detail s',
'    ,v_lic_product_price_list l',
'where    ',
's.product = l.product_key',
'group by s.product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_PROD_SUM_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_PROD_SUM_C1" ("PRODUCT", "LIC_CORE", "CORE_COUNT", "TOTAL_COST", "MAINT_COST") AS ',
'  SELECT',
'    s.product,',
'    sum(s.lic_core) lic_core,',
'    sum(s.core_count) core_count,',
'    sum(s.lic_core * l.price_per_processor ) total_cost,',
'    sum((s.lic_core * l.price_per_processor )* .1 ) maint_cost',
'FROM',
'    v_lic_server_detail_c1 s',
'    ,v_lic_product_price_list l',
'where    ',
's.product = l.product_key',
'group by s.product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_PROD_SUM_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_PROD_SUM_C2" ("PRODUCT", "LIC_CORE", "CORE_COUNT", "TOTAL_COST", "MAINT_COST") AS ',
'  SELECT',
'    s.product,',
'    sum(s.lic_core) lic_core,',
'    sum(s.core_count) core_count,',
'    sum(s.lic_core * l.price_per_processor ) total_cost,',
'    sum((s.lic_core * l.price_per_processor )* .1 ) maint_cost',
'FROM',
'    v_lic_server_detail_c2 s',
'    ,v_lic_product_price_list l',
'where    ',
's.product = l.product_key',
'group by s.product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_TOT_SUM',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_TOT_SUM" ("TOTAL_NAME", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    ''Server Fleet'' total_name,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_TOT_SUM_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_TOT_SUM_C1" ("TOTAL_NAME", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    ''Server Fleet'' total_name,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP1''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_TOT_SUM_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_TOT_SUM_C2" ("TOTAL_NAME", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    ''Server Fleet'' total_name,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP2''',
'    )',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_PROD_SUM',
'-------------------------------------------'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(46153197505810586)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_PROD_SUM" ("HARDWARE_VENDOR", "PRODUCT", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    hardware_vendor,    ',
'    product,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_server_detail',
'group by     hardware_vendor,product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_PROD_SUM_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_PROD_SUM_C1" ("HARDWARE_VENDOR", "PRODUCT", "LIC_CORE", "CORE_COUNT", "TOTAL_COST", "MAINT_COST") AS ',
'  SELECT',
'    s.hardware_vendor,    ',
'    s.product,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count,',
'    sum(s.lic_core * l.price_per_processor ) total_cost,',
'    sum((s.lic_core * l.price_per_processor )* .1 ) maint_cost',
'FROM',
'    v_lic_server_detail_c1 s',
'        ,v_lic_product_price_list l',
'where    ',
's.product = l.product_key',
'group by     hardware_vendor,product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_PROD_SUM_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_PROD_SUM_C2" ("HARDWARE_VENDOR", "PRODUCT", "LIC_CORE", "CORE_COUNT", "TOTAL_COST", "MAINT_COST") AS ',
'  SELECT',
'    s.hardware_vendor,    ',
'    s.product,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count,',
'    sum(s.lic_core * l.price_per_processor ) total_cost,',
'    sum((s.lic_core * l.price_per_processor )* .1 ) maint_cost',
'FROM',
'    v_lic_server_detail_c2 s',
'        ,v_lic_product_price_list l',
'where    ',
's.product = l.product_key',
'group by     hardware_vendor,product',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_SUM',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_SUM" ("HARDWARE_VENDOR", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    h.hardware_vendor,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'            b.status = ''Active''',
'    )    ',
'group by h.hardware_vendor',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_SUM_C1',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_SUM_C1" ("HARDWARE_VENDOR", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    h.hardware_vendor,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP1''',
'    )    ',
'group by h.hardware_vendor',
';',
'--------------------------------------------------------',
'--  DDL for View V_LIC_SERVER_VENDOR_SUM_C2',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LIC_SERVER_VENDOR_SUM_C2" ("HARDWARE_VENDOR", "TOTAL_HOSTS", "LIC_CORE", "CORE_COUNT") AS ',
'  SELECT',
'    h.hardware_vendor,',
'    count(distinct h.host_name) total_hosts,',
'    sum(lic_core) lic_core,',
'    sum(core_count) core_count',
'FROM',
'    v_lic_host_inv h',
'where    h.baseline_id = (',
'        SELECT',
'            MAX(baseline_id)',
'        FROM',
'            v_lic_baseline b',
'        WHERE',
'           compare_key like ''COMP2''',
'    )    ',
'group by h.hardware_vendor',
';',
'--------------------------------------------------------',
'--  DDL for View V_LOV_TBL_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_LOV_TBL_VW" ("LOV_VALUE", "LOV_CATEGORY", "LOV_ACTIVE") AS ',
'  SELECT',
'    t.lov_value',
'    ,t.lov_category',
'    ,t.lov_active',
'FROM',
'    v_lov_tbl t',
'union all',
'SELECT',
'    compare_key',
'    , ''BASELINE_KEY'' lov_category',
'    ,''ACTIVE'' lov_active ',
'FROM',
'    v_lic_baseline',
';',
'--------------------------------------------------------',
'--  DDL for View V_PATCH_SCHEDULE_CALENDAR',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_PATCH_SCHEDULE_CALENDAR" ("PATCH_SCHED_ID", "HOST_CODE", "PATCH_DATE", "DC_LOCATION", "PATCH_LOOKUP_ID", "PATCH_END", "PATCH_TARGET", "HOST_NAME", "CLUSTER_NAME", "PATCH_NAME", "TICKET_REF") AS ',
'  SELECT',
'    ps.patch_sched_id,',
'    ps.host_code,',
'    ps.patch_date,',
'        ps.dc_location,',
'--    ps.app_id,',
'    ps.patch_lookup_id,',
'    max(ps.patch_date + 4/24) patch_end,',
'    nvl(max(c.cluster_name),max(h.host_name)) patch_target,',
'    max(h.host_name) host_name,',
'    max(c.cluster_name) cluster_name,',
'    max(pl.PATCH_TYPE||'' ''||pl.SOFTWARE_VERSION||'' -''|| pl.PATCH_QUARTER||'' ''||pl.PATCH_YEAR) patch_name,',
'    max(ticket_ref) ticket_ref',
'   -- max(a.application_name) application_name,',
'  --  max(a.business_unit) business_unit',
'FROM',
'    charter2_inv.v_patch_schedule ps',
'     ,charter2_inv.v_host_inv_tbl h',
'   --  ,charter2_inv.v_application_details_tbl a',
'     , charter2_inv.v_cluster_member_tbl c',
'     ,charter2_inv.V_PATCH_LOOKUP_TBL pl',
' where',
' ps.host_code = h.host_code(+)',
'-- and ps.app_id = a.id(+)',
' and h.host_code = c.v_host_code(+)',
' and ps.patch_lookup_id = pl.id',
' group by ',
'    ps.patch_sched_id,',
'    ps.host_code,',
'    ps.patch_date,',
'        ps.dc_location,',
' --   ps.app_id,',
'    ps.patch_lookup_id',
';',
'--------------------------------------------------------',
'--  DDL for View V_PATCH_SCHEDULE_CALENDAR_08NOV',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_PATCH_SCHEDULE_CALENDAR_08NOV" ("PATCH_SCHED_ID", "HOST_CODE", "PATCH_DATE", "PATCH_LOOKUP_ID", "PATCH_END", "PATCH_TARGET", "HOST_NAME", "CLUSTER_NAME", "PATCH_NAME", "TICKET_REF") AS ',
'  SELECT',
'    ps.patch_sched_id,',
'    ps.host_code,',
'    ps.patch_date,',
'--    ps.app_id,',
'    ps.patch_lookup_id,',
'    max(ps.patch_date + 4/24) patch_end,',
'    nvl(max(c.cluster_name),max(h.host_name)) patch_target,',
'    max(h.host_name) host_name,',
'    max(c.cluster_name) cluster_name,',
'    max(pl.PATCH_TYPE||'' ''||pl.SOFTWARE_VERSION||'' -''|| pl.PATCH_QUARTER||'' ''||pl.PATCH_YEAR) patch_name,',
'    max(ticket_ref) ticket_ref',
'   -- max(a.application_name) application_name,',
'  --  max(a.business_unit) business_unit',
'FROM',
'    charter2_inv.v_patch_schedule ps',
'     ,charter2_inv.v_host_inv_tbl h',
'   --  ,charter2_inv.v_application_details_tbl a',
'     , charter2_inv.v_cluster_member_tbl c',
'     ,charter2_inv.V_PATCH_LOOKUP_TBL pl',
' where',
' ps.host_code = h.host_code(+)',
'-- and ps.app_id = a.id(+)',
' and h.host_code = c.v_host_code(+)',
' and ps.patch_lookup_id = pl.id',
' group by ',
'    ps.patch_sched_id,',
'    ps.host_code,',
'    ps.patch_date,',
' --   ps.app_id,',
'    ps.patch_lookup_id',
';',
'--------------------------------------------------------',
'--  DDL for View V_PATCH_SCHEDULE_CALENDAR_HOSTNAME',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_PATCH_SCHEDULE_CALENDAR_HOSTNAME" ("PATCH_SCHED_ID", "HOST_CODE", "PATCH_DATE", "DC_LOCATION", "PATCH_LOOKUP_ID", "PATCH_END", "PATCH_TARGET", "HOST_NAME", "CLUSTER_NAME", "PATCH_NAME", "TICKET_REF") AS ',
'  SELECT',
'    ps.patch_sched_id,',
'    h.host_code,',
'    ps.patch_date,',
'    ps.dc_location,',
'    ps.patch_lookup_id,',
'    max(ps.patch_date + 4/24) patch_end,',
'    nvl(max(c.cluster_name),max(h.host_name)) patch_target,',
'    max(h.host_name) host_name,',
'    max(c.cluster_name) cluster_name,',
'    max(pl.PATCH_TYPE||'' ''||pl.SOFTWARE_VERSION||'' -''|| pl.PATCH_QUARTER||'' ''||pl.PATCH_YEAR) patch_name,',
'    max(ticket_ref) ticket_ref',
'   -- max(a.application_name) application_name,',
'  --  max(a.business_unit) business_unit',
'FROM',
'    charter2_inv.v_patch_schedule ps',
'     ,charter2_inv.v_host_inv_tbl h',
'   --  ,charter2_inv.v_application_details_tbl a',
'     , charter2_inv.v_cluster_member_tbl c',
'     ,charter2_inv.V_PATCH_LOOKUP_TBL pl',
' where',
' ps.host_name = h.host_name(+)',
'-- and ps.app_id = a.id(+)',
' and h.host_code = c.v_host_code(+)',
' and ps.patch_lookup_id = pl.id',
' group by ',
'    ps.patch_sched_id,',
'    h.host_code,',
'    ps.patch_date,',
'    ps.dc_location,',
'    ps.patch_lookup_id',
';',
'--------------------------------------------------------',
'--  DDL for View V_SCHEDULE_QUEUE_VW',
'--------------------------------------------------------',
'',
'CREATE OR REPLACE FORCE VIEW "CHARTER2_INV"."V_SCHEDULE_QUEUE_VW" ("SCHEDULE_ID", "SCHEDULE_TYPE", "SCHEDULE_PROCESS", "TASK_ID", "APPROVAL_PROCESS_ID", "APPROVAL_REQUIRED", "TICKET_REF", "UNIQUE_GRP", "REQ_QUEUE_ID", "SELF_SERVICE_REQUEST_ID", "HOST'
||'_NAME", "TASK_PARMS", "REQUEST_START_TIME_C", "REQUEST_START_TIME", "PROCESS_START_TIME", "STATUS", "CREATED", "CREATED_BY", "UPDATED", "UPDATED_BY", "TASK_TYPE", "EXECUTION_MODE", "DESCRIPTION", "PRIVILEGE_ROLE", "TASK_STATUS", "TASK_KEY") AS ',
'  SELECT',
'    s.schedule_id,',
'    s.schedule_type,',
'    s.schedule_process,',
'    s.task_id,',
'    s.approval_process_id,',
'    s.approval_required,',
'    s.ticket_ref,',
'    s.unique_grp,',
'    s.req_queue_id,',
'    (select max(self_service_request_id)  from  v_schedule_queue_detail d',
'    where ',
'    d.schedule_id = s.schedule_id )self_service_request_id,',
'    s.host_name,',
'   s.task_parms,',
'    s.request_start_time_c,',
'    s.request_start_time,',
'    s.process_start_time,',
'    s.status,',
'    s.created,',
'    s.created_by,',
'    s.updated,',
'    s.updated_by,',
'    t.task_type,',
'    t.execution_mode,',
'    t.description,',
'    t.privilege_role,',
'    t.status task_status,',
'    t.task_key',
' FROM',
'    v_schedule_queue s',
'    ,V_SCHEDULE_TASK t',
'where',
' s.task_id = t.task_id',
';',
'CREATE OR REPLACE PACKAGE BODY "CHARTER2_INV"."OAC$ANSIBLE_UTL" wrapped ',
'a000000',
'1',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'b',
'90a5 1a1b',
'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',
'kUDtcTKc41in3LbyB57U1GkYsB0g+aWqPuvH/w==',
'',
'/',
'CREATE OR REPLACE  PACKAGE BODY "CHARTER2_INV"."STANDARD_TASK_MGR" wrapped ',
'a000000',
'1',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'abcd',
'b',
'4c2e 1656',
'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',
'no+KeNPk6nCp+NeqppXAPps=',
'',
'/',
'DECLARE',
'  P_ACTION VARCHAR2(200);',
'  P_PARM1 VARCHAR2(200);',
'  P_PARM2 VARCHAR2(200);',
'  P_PARM3 VARCHAR2(200);',
'    ',
'BEGIN',
'  P_ACTION := ''DAILY'';',
'  P_PARM1 := NULL;',
'  P_PARM2 := NULL;',
'  P_PARM3 := NULL;',
'',
'  OAC$ANSIBLE_UTL.setup_batch_jobs (  P_ACTION => P_ACTION,',
'P_PARM1 => P_PARM1,',
'P_PARM2 => P_PARM2,',
'P_PARM3 => P_PARM3) ;  ',
' commit;',
'END;',
'/',
'Insert into CHARTER2_INV.SOURCE_APP_UPDATE (APP_VERSION,RELEASED_DT,ACTIVE,APPLIED_DT,UPDATED,UPDATED_BY,SUMMARY,DESCRIPTION) ',
'values (''Version.May8'',to_date(''03-MAY-19'',''DD-MON-RR''),''Active'',sysdate,to_date(''03-MAY-19'',''DD-MON-RR''),''MPERRY'',''Recreate Views, triggers on users and roles, updates to package STANDARD_TASK_MGR, OACANSIBLE_UTL'','''');',
'commit;'))
);
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
