#
# Cookbook Name:: file-copy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "/tmp/redmart.txt" do
  owner 'root'
  group 'root'
  mode 0755
  content 'This is 1st test file'
  action :create
end
