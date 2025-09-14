alter table eba_demo_card_emp
    add constraint eba_demo_card_emp_dept_fk
        foreign key ( deptno )
            references eba_demo_card_dept ( deptno )
        enable;


-- sqlcl_snapshot {"hash":"302bd3605ca475419ba2b52a69a0b70e4e2c901a","type":"REF_CONSTRAINT","name":"EBA_DEMO_CARD_EMP_DEPT_FK","schemaName":"APEX_DEV","sxml":""}