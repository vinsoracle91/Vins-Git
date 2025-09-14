create or replace editionable trigger biu_eba_demo_chart_products before
    insert or update on eba_demo_chart_products
    for each row
begin
    if :new.product_id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.product_id
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

alter trigger biu_eba_demo_chart_products enable;


-- sqlcl_snapshot {"hash":"7acd1e3c298bdd1c6abfe34299609aa1c52966f9","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_PRODUCTS","schemaName":"APEX_DEV","sxml":""}