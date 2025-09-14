create or replace editionable trigger biu_eba_demo_chart_sample_data before
    insert or update on eba_demo_chart_sample_data
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

alter trigger biu_eba_demo_chart_sample_data enable;


-- sqlcl_snapshot {"hash":"5111e3790032ec05d263d52ed577a6c5bc46092c","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_SAMPLE_DATA","schemaName":"APEX_DEV","sxml":""}