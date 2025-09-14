create or replace editionable trigger biu_eba_demo_chart_orders before
    insert or update on eba_demo_chart_orders
    for each row
begin
    if :new.order_id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.order_id
        from
            dual;

    end if;

    if inserting then
        :new.created := current_timestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := current_timestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

    if inserting
    or updating then
        :new.updated := current_timestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger biu_eba_demo_chart_orders enable;


-- sqlcl_snapshot {"hash":"8d04246eb30d09705a0d40d2bb5768ef70875699","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_ORDERS","schemaName":"APEX_DEV","sxml":""}