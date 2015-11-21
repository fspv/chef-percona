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
package "percona-server-client"
