#
# Cookbook Name:: chef-solo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#package repo update
execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure true
end
#install package
package ["vim","htop"] do
	action :install
end

#install knife-solo
gem_package "knife-solo" do
	action :install
end