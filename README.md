Description
============

Cookbook that contains a bunch of useful adminscripts that we want to deploy
in our enviroment.

Requirements
============

Chef version 11.0+

## Platform

Supported platforms by platform family:

* debian (debian, ubuntu)

Attributes
==========

Read attributes file, or see usage below.

Usage
=====

## adminscripts::lowdisk

Checks the monted drives (using df) to see if any of them has low free space.

Example role

    name 'myclient'
    run_list(
      'recipe[adminscripts::lowdisk]'
    )
    default_attributes(
      'adminscripts' => {
        'reportaddress' => 'email@addre.ss', # Report address
        'lowdisk' => {
          'reportaddress' => 'over@ride.ad', # Override address for these reports
          'threshold' => 90,                 # Threshold for low disk space (in percent)
          'ignore' => ['/home', '/tmp']      # Drives to ignore
          'user' => 'root'                   # User to run the script
          'cron' => {                        # Matching the cron_d lwrp
            'hour' => 06,
            'minute' => 00,
            'day' => '*',
            'month' => '*',
            'weekday' => '*'
          }
        }
      }
    )

## adminscripts::vmware_quiesce

Machines hosted on vmware kan run commands before and after snapshot to ensure the sanity
of files/filesystems inside the virtual machine. These scripts can help with shutting/freezing
services before snapshot and then starting/thawing after.

Example role

    name 'myclient'
    run_list(
      'recipe[adminscripts::vmware_quiesce']
    )
    default_attributes(
      'adminscripts' => {
        'reportaddress' => 'email@addre.ss', # Report address
        'vmware_quiesce' => {
          'services' => ['svc1', 'svc2'],   # Services to be stopped before and started after snapshot
          'commands' => {                   # Hash of commands run before and after
            'cmd1' => {                     # Name of first command
              'freeze' => '/run/before',
              'thaw' => '/run/after'
            }
          }
        }
      }
    )

License and Authors
===================
Author:: Boye Holden (<boye.holden@hist.no>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.