#!/usr/bin/env ruby
# Runs lsyncd service.
#
# Recipe:: run
# Cookbook Name:: lsyncd
# Author:: Greg Albrecht <gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0
#


supervisor_service 'lsyncd' do
  action [:enable, :start]
  only_if{ ::File.exists?(node['lsyncd']['bin']) }
  command node['lsyncd']['cmd']
  process_name 'lsyncd'
  autorestart true
end
