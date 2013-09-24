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

execute "mysqladmin -u root password '#{node['percona']['mysql']['password']}'" do
  # Set root password for already created database
  not_if "mysql -uroot -p'#{node['percona']['mysql']['password']}' -e ';'"
end

execute "mysqladmin -u root -p'#{node['percona']['mysql']['old_password']}' password #{node['percona']['mysql']['password']}" do
  # Set new root password if we know old password
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
