#
# Cookbook Name:: percona
# Recipe:: server
#
# Copyright 2013, Pavel Safronov
#
# All rights reserved - Do Not Redistribute
#

# Include recipe with repos
include_recipe "percona::repo"

# Install percona server
package "percona-server-server-5.5"

service "mysql" do
  # Enable autorun of mysql service and start it
  action [ :enable, :start ]
end

execute "mysql-set-root-password" do 
  # Set root password for already created database
  command "mysqladmin -u root password '#{node['percona']['mysql']['password']}'"
  not_if "mysql -uroot -p'#{node['percona']['mysql']['password']}' -e ';'"
end

execute "mysql-set-new-root-password" do
  # Set new root password if we know old password
    command "mysqladmin -u root -p'#{node['percona']['mysql']['old_password']}' password #{node['percona']['mysql']['password']}"
  only_if "mysql -uroot -p'#{node['percona']['mysql']['old_password']}' -e ';'"
end

template "/etc/mysql/my.cnf" do
  # Create mysql configuration file
  source "my.cnf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :reload, resources(:service => "mysql"), :delayed
end

if Chef::DataBag.list.key?('mysql_databases')
  # Get all databases for this host and databases that must exist on all hosts
  databases = search(:mysql_databases, "server:#{node['fqdn']} OR server:all")
  # And create them
  databases.each do |db|
    if not node['percona']['allowed_character_sets'].include? db['character_set']
      # Set default charset if there is no match with allowed
      db['character_set'] = node['percona']['database_default_character_set']
    end
    if not node['percona']['allowed_collations'].include? db['collate']
      # Set default collation if there is no match with allowed
      db['collate'] = node['percona']['database_default_collate']
    end
    percona_database db['database'] do
      character_set db['character_set']
      collate db['collate']
    end
  end
end

if Chef::DataBag.list.key?('mysql_users')
  # Get all users for this host and users that must exist on all hosts
  users = search(:mysql_users, "server:#{node['fqdn']} OR server:all")
  # And create them
  users.each do |user|
    percona_user user['user'] do
      host user['host']
      password user['password']
      update_password user['update_password'] == 'true' ? true : false
    end
  end
end

if Chef::DataBag.list.key?('mysql_grants')
  # Get all grants for this host and grants that must exist on all hosts
  grants = search(:mysql_grants, "server:#{node['fqdn']} OR server:all")
  # And create them
  grants.each do |grant|
    if grant['privileges'] == 'All'
      privs = [
        'Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv',
        'Create_priv', 'Drop_priv', 'References_priv', 'Index_priv',
        'Alter_priv', 'Create_tmp_table_priv', 'Lock_tables_priv',
        'Create_view_priv', 'Show_view_priv', 'Create_routine_priv',
        'Alter_routine_priv', 'Execute_priv', 'Event_priv', 'Trigger_priv'
      ]
    else
      privs = grant['privileges']
    end
    percona_grant grant['id'] do
      privileges privs
      database grant['database']
      table grant['table']
      user grant['user']
      host grant['host']
      action :create
    end
  end
end
