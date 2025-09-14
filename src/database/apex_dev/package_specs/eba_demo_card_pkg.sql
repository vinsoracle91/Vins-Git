create or replace package eba_demo_card_pkg as
    function get_video_duration (
        p_video_id in varchar2
    ) return varchar2;

    procedure get_profile_image (
        p_empno in number
    );

end eba_demo_card_pkg;
/


-- sqlcl_snapshot {"hash":"2dce3bab19d5dcbf27b7353e65e11d03b4d044b9","type":"PACKAGE_SPEC","name":"EBA_DEMO_CARD_PKG","schemaName":"APEX_DEV","sxml":""}