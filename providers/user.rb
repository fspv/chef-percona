action :create do
  # Create user if it is not exists
  execute "mysql-create-user: #{new_resource.name}@#{new_resource.host}" do
    command "mysql -r -B -N -e \"
      INSERT INTO mysql.user
      SET Host='#{new_resource.host}',
          User='#{new_resource.name}',
          Password=PASSWORD('#{new_resource.password}'),
          Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}',
          Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}',
          Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}',
          Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}',
          Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}',
          Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}',
          Reload_priv='#{new_resource.privileges.include?('Reload_priv') ? 'Y' : 'N'}',
          Shutdown_priv='#{new_resource.privileges.include?('Shutdown_priv') ? 'Y' : 'N'}',
          Process_priv='#{new_resource.privileges.include?('Process_priv') ? 'Y' : 'N'}',
          File_priv='#{new_resource.privileges.include?('File_priv') ? 'Y' : 'N'}',
          Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}',
          References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}',
          Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}',
          Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}',
          Show_db_priv='#{new_resource.privileges.include?('Show_db_priv') ? 'Y' : 'N'}',
          Super_priv='#{new_resource.privileges.include?('Super_priv') ? 'Y' : 'N'}',
          Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}',
          Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}',
          Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}',
          Repl_slave_priv='#{new_resource.privileges.include?('Repl_slave_priv') ? 'Y' : 'N'}',
          Repl_client_priv='#{new_resource.privileges.include?('Repl_client_priv') ? 'Y' : 'N'}',
          Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}',
          Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}',
          Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}',
          Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}',
          Create_user_priv='#{new_resource.privileges.include?('Create_user_priv') ? 'Y' : 'N'}',
          Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}',
          Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}',
          Create_tablespace_priv='#{new_resource.privileges.include?('Create_tablespace_priv') ? 'Y' : 'N'}'
        ON DUPLICATE KEY UPDATE
          Host='#{new_resource.host}',
          User='#{new_resource.name}',
          Password=PASSWORD('#{new_resource.password}'),
          Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}',
          Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}',
          Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}',
          Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}',
          Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}',
          Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}',
          Reload_priv='#{new_resource.privileges.include?('Reload_priv') ? 'Y' : 'N'}',
          Shutdown_priv='#{new_resource.privileges.include?('Shutdown_priv') ? 'Y' : 'N'}',
          Process_priv='#{new_resource.privileges.include?('Process_priv') ? 'Y' : 'N'}',
          File_priv='#{new_resource.privileges.include?('File_priv') ? 'Y' : 'N'}',
          Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}',
          References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}',
          Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}',
          Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}',
          Show_db_priv='#{new_resource.privileges.include?('Show_db_priv') ? 'Y' : 'N'}',
          Super_priv='#{new_resource.privileges.include?('Super_priv') ? 'Y' : 'N'}',
          Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}',
          Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}',
          Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}',
          Repl_slave_priv='#{new_resource.privileges.include?('Repl_slave_priv') ? 'Y' : 'N'}',
          Repl_client_priv='#{new_resource.privileges.include?('Repl_client_priv') ? 'Y' : 'N'}',
          Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}',
          Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}',
          Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}',
          Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}',
          Create_user_priv='#{new_resource.privileges.include?('Create_user_priv') ? 'Y' : 'N'}',
          Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}',
          Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}',
          Create_tablespace_priv='#{new_resource.privileges.include?('Create_tablespace_priv') ? 'Y' : 'N'}';
        FLUSH PRIVILEGES;\""
    # Update user password only if it is defined explicitly
    not_if "test $(mysql -r -N -B -e \"
      SELECT COUNT(*) FROM mysql.user WHERE
          Host='#{new_resource.host}' AND
          User='#{new_resource.name}' AND
          Password=PASSWORD('#{new_resource.password}') AND
          Select_priv='#{new_resource.privileges.include?('Select_priv') ? 'Y' : 'N'}' AND
          Insert_priv='#{new_resource.privileges.include?('Insert_priv') ? 'Y' : 'N'}' AND
          Update_priv='#{new_resource.privileges.include?('Update_priv') ? 'Y' : 'N'}' AND
          Delete_priv='#{new_resource.privileges.include?('Delete_priv') ? 'Y' : 'N'}' AND
          Create_priv='#{new_resource.privileges.include?('Create_priv') ? 'Y' : 'N'}' AND
          Drop_priv='#{new_resource.privileges.include?('Drop_priv') ? 'Y' : 'N'}' AND
          Reload_priv='#{new_resource.privileges.include?('Reload_priv') ? 'Y' : 'N'}' AND
          Shutdown_priv='#{new_resource.privileges.include?('Shutdown_priv') ? 'Y' : 'N'}' AND
          Process_priv='#{new_resource.privileges.include?('Process_priv') ? 'Y' : 'N'}' AND
          File_priv='#{new_resource.privileges.include?('File_priv') ? 'Y' : 'N'}' AND
          Grant_priv='#{new_resource.privileges.include?('Grant_priv') ? 'Y' : 'N'}' AND
          References_priv='#{new_resource.privileges.include?('References_priv') ? 'Y' : 'N'}' AND
          Index_priv='#{new_resource.privileges.include?('Index_priv') ? 'Y' : 'N'}' AND
          Alter_priv='#{new_resource.privileges.include?('Alter_priv') ? 'Y' : 'N'}' AND
          Show_db_priv='#{new_resource.privileges.include?('Show_db_priv') ? 'Y' : 'N'}' AND
          Super_priv='#{new_resource.privileges.include?('Super_priv') ? 'Y' : 'N'}' AND
          Create_tmp_table_priv='#{new_resource.privileges.include?('Create_tmp_table_priv') ? 'Y' : 'N'}' AND
          Lock_tables_priv='#{new_resource.privileges.include?('Lock_tables_priv') ? 'Y' : 'N'}' AND
          Execute_priv='#{new_resource.privileges.include?('Execute_priv') ? 'Y' : 'N'}' AND
          Repl_slave_priv='#{new_resource.privileges.include?('Repl_slave_priv') ? 'Y' : 'N'}' AND
          Repl_client_priv='#{new_resource.privileges.include?('Repl_client_priv') ? 'Y' : 'N'}' AND
          Create_view_priv='#{new_resource.privileges.include?('Create_view_priv') ? 'Y' : 'N'}' AND
          Show_view_priv='#{new_resource.privileges.include?('Show_view_priv') ? 'Y' : 'N'}' AND
          Create_routine_priv='#{new_resource.privileges.include?('Create_routine_priv') ? 'Y' : 'N'}' AND
          Alter_routine_priv='#{new_resource.privileges.include?('Alter_routine_priv') ? 'Y' : 'N'}' AND
          Create_user_priv='#{new_resource.privileges.include?('Create_user_priv') ? 'Y' : 'N'}' AND
          Event_priv='#{new_resource.privileges.include?('Event_priv') ? 'Y' : 'N'}' AND
          Trigger_priv='#{new_resource.privileges.include?('Trigger_priv') ? 'Y' : 'N'}' AND
          Create_tablespace_priv='#{new_resource.privileges.include?('Create_tablespace_priv') ? 'Y' : 'N'}';\") = 1"
    end
end

action :delete do
  # Drop mysql user if it is exists
  execute "mysql-drop-user: #{new_resource.name}@#{new_resource.host}" do
    command "mysql -r -N -B -e \"
      DELETE FROM mysql.user WHERE
        Host='#{new_resource.host}' AND
        User='#{new_resource.name}';
      FLUSH PRIVILEGES;\""
    only_if "test $(mysql -r -N -B -e \"
      SELECT COUNT(*) FROM mysql.user WHERE
          Host='#{new_resource.host}' AND
          User='#{new_resource.name}';\") = 1"
  end
end
