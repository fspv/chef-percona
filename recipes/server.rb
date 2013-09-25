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

percona_database "test3" do
end

percona_user "test3" do
  password '123'
end

percona_grant "test3" do
  database 'test3'
  user 'test3'
  host '%'
end
