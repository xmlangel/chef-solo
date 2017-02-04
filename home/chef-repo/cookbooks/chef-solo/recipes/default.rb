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
%w{nano vim htop build-essential git-core openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config}.each do |pkg|
	package pkg do
		action :install
	end
end

# package ["vim","htop","build-essential""] do
# 	action :install
# end

#install knife-solo
gem_package "knife-solo" do
	action :install
end

#add .chef directory
directory '/root/.chef' do
	owner 'root'
	group 'root'
	mode '0751'
	action :create
end

# add knife.rb file
file "/root/.chef/knife.rb" do
	owner "root"
	group "root"
	mode 00644
	action :create
end

# change localtime to Seoul
execute "change-time to Seoul" do
  command "ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime"
  ignore_failure true
end
