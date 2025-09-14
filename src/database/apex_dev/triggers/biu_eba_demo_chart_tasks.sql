create or replace editionable trigger biu_eba_demo_chart_tasks before
    insert or update on eba_demo_chart_tasks
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

    if inserting then
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger biu_eba_demo_chart_tasks enable;


-- sqlcl_snapshot {"hash":"658793656a2ab7d770a2d15b46e30df2cbff1d7a","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_TASKS","schemaName":"APEX_DEV","sxml":""}