alter table eba_demo_card_emp
    add constraint eba_demo_card_emp_mgr_fk
        foreign key ( mgr )
            references eba_demo_card_emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"695859f9a4cea4723172062190f367010ffed4cb","type":"REF_CONSTRAINT","name":"EBA_DEMO_CARD_EMP_MGR_FK","schemaName":"APEX_DEV","sxml":""}