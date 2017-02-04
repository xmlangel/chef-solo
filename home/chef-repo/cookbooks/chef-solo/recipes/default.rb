#
# Cookbook Name:: chef-solo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure true
  #only_if do
  #  File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
  #  File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  #end
end

package ["vim","gcc","htop"] do
	action :install
end

gem_package "knife-solo" do
	action :install
end