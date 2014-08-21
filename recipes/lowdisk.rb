#
# Cookbook Name:: adminscripts
# Recipe:: lowdisk
#
# Copyright 2013, HiST AITeL
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Make sure reportaddress is always set
vars = node[:adminscripts][:lowdisk].dup
vars['reportaddress'] ||= node[:adminscripts][:reportaddress]

# Install mailutils to send mail
package 'bsd-mailx'

# Run script if modified
execute 'run-lowdisk' do
  command '/usr/local/sbin/adminscripts-lowdisk.sh'
  only_if { ::File.exists?('/usr/local/sbin/adminscripts-lowdisk.sh') }
  action :nothing
end

# Save template
template '/usr/local/sbin/adminscripts-lowdisk.sh' do
  source 'lowdisk.erb'
  owner vars['user'] if vars['user']
  mode 0555
  variables :attr => vars
  notifies :run, 'execute[run-lowdisk]'
end

# Set up cron job
cron_d 'adminscripts-lowdisk' do
  minute  vars['cron']['minute']
  hour    vars['cron']['hour']
  day     vars['cron']['day']
  month   vars['cron']['month']
  weekday vars['cron']['weekday']
  
  command '/usr/local/sbin/adminscripts-lowdisk.sh'
  user    vars['user']
  mailto  vars['reportaddress']
end
