#
# Cookbook Name:: adminscripts
# Attribute:: default
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

# Default e-mail address to report to
default[:adminscripts][:reportaddress]            = 'root'

## LOW DISK SCRIPT ##

# Run as user
default[:adminscripts][:lowdisk][:user]           = 'root'

# Cron defaults
default[:adminscripts][:lowdisk][:cron][:minute]  = 10
default[:adminscripts][:lowdisk][:cron][:hour]    = 06
default[:adminscripts][:lowdisk][:cron][:day]     = '*'
default[:adminscripts][:lowdisk][:cron][:month]   = '*'
default[:adminscripts][:lowdisk][:cron][:weekday] = '*'

# Threshold to send e-mail, in percent (without %)
default[:adminscripts][:lowdisk][:threshold]      = 90
