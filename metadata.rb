name             'adminscripts'
maintainer       'Boye Holden'
maintainer_email 'boye.holden@hist.no'
license          'Apache 2.0'
description      'Collection of useful adminscripts we want to deploy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe 'adminscripts::lowdisk', 'Creates a script that sends an warning if low disk space'

%w(ubuntu debian).each do |os|
  supports os
end

%w(postfix).each do |pkg|
  suggests pkg
end

%w(cron).each do |pkg|
  depends pkg
end
