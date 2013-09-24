#
# Cookbook Name:: percona
# Recipe:: repo
#
# Copyright 2013, Pavel Safronov
#
# All rights reserved - Do Not Redistribute
#

case node['platform_family']

when "debian"
  include_recipe "apt"

  # Pin this repo as to avoid upgrade conflicts with distribution repos.
  apt_preference "00percona" do
    glob "*"
    pin "release o=Percona Development Team"
    pin_priority "1001"
  end

  apt_repository "percona" do
    uri 'http://repo.percona.com/apt'
    distribution node['lsb']['codename']
    components [ "main" ]
    keyserver 'keys.gnupg.net'
    key 'CD2EFD2A'
    action :add
  end

end

