action :create do
  # Create grants if they are not exists already
  execute "#{new_resource.user}@#{new_resource.host}: GRANT #{new_resource.privileges}" do
    command "mysql -e \"
      INSERT INTO mysql.db
      SET Host='#{new_resource.host}',
          Db='#{new_resource.database}',
          User='#{new_resource.user}',
          Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}',
          Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}',
          Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}',
          Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}',
          Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}',
          Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}',
          Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}',
          References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}',
          Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}',
          Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}',
          Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}',
          Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}',
          Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}',
          Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}',
          Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}',
          Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}',
          Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}',
          Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}',
          Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}'
      ON DUPLICATE KEY UPDATE
          Host='#{new_resource.host}',
          Db='#{new_resource.database}',
          User='#{new_resource.user}',
          Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}',
          Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}',
          Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}',
          Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}',
          Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}',
          Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}',
          Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}',
          References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}',
          Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}',
          Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}',
          Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}',
          Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}',
          Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}',
          Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}',
          Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}',
          Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}',
          Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}',
          Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}',
          Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}';
        FLUSH PRIVILEGES;\""
    not_if "test $(mysql -r -N -B -e \"
      SELECT COUNT(*) FROM mysql.db WHERE
        Host='#{new_resource.host}' AND
        Db='#{new_resource.database}' AND
        User='#{new_resource.user}' AND
        Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}' AND
        Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}' AND
        Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}' AND
        Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}' AND
        Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}' AND
        Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}' AND
        Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}' AND
        References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}' AND
        Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}' AND
        Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}' AND
        Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}' AND
        Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}' AND
        Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}' AND
        Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}' AND
        Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}' AND
        Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}' AND
        Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}' AND
        Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}' AND
        Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}';\") = 1"
  end
end

action :delete do
  # Revoke grants if they are exists
  execute "#{new_resource.user}@#{new_resource.host}: REVOKE #{new_resource.privileges}" do
    command "mysql -r -N -B -e \"
      DELETE FROM mysql.db WHERE
        Host='#{new_resource.host}' AND
        Db='#{new_resource.database}' AND
        User='#{new_resource.user}';
      FLUSH PRIVILEGES;\""
    only_if "test $(mysql -r -N -B -e \"
      SELECT COUNT(*) FROM mysql.db WHERE
        Host='#{new_resource.host}' AND
        Db='#{new_resource.database}' AND
        User='#{new_resource.user}' AND
        Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}' AND
        Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}' AND
        Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}' AND
        Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}' AND
        Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}' AND
        Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}' AND
        Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}' AND
        References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}' AND
        Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}' AND
        Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}' AND
        Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}' AND
        Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}' AND
        Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}' AND
        Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}' AND
        Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}' AND
        Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}' AND
        Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}' AND
        Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}' AND
        Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}';\") = 1"
  end
end
