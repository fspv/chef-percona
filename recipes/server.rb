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

# Get all databases for this host and databases that must exist on all hosts
databases = search(:mysql_databases, "server:#{node['fqdn']} OR server:all")
# And create them
databases.each do |db|
  log db
  percona_database db['database'] do
    character_set db['character_set']
    collate db['collate']
  end
end

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

# Get all grants for this host and grants that must exist on all hosts
grants = search(:mysql_grants, "server:#{node['fqdn']} OR server:all")
# And create them
grants.each do |grant|
  percona_grant grant['id'] do
    privileges grant['privileges']
    database grant['database']
    table grant['table']
    user grant['user']
    host grant['host']
    with_option grant['with_option']
  end
end
