create or replace editionable trigger biu_eba_demo_chart_stats before
    insert or update on eba_demo_chart_stats
    for each row
begin
    if :new.id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
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

alter trigger biu_eba_demo_chart_stats enable;


-- sqlcl_snapshot {"hash":"3922b6172adf99a5f3062ffb9da5ec201639cf58","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_STATS","schemaName":"APEX_DEV","sxml":""}