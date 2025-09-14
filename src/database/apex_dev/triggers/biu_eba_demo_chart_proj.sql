create or replace editionable trigger biu_eba_demo_chart_proj before
    insert or update on eba_demo_chart_projects
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

alter trigger biu_eba_demo_chart_proj enable;


-- sqlcl_snapshot {"hash":"c3c4431221288d5b9b04903c6ba3d735464c7861","type":"TRIGGER","name":"BIU_EBA_DEMO_CHART_PROJ","schemaName":"APEX_DEV","sxml":""}