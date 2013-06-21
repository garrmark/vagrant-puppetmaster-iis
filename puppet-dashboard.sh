#!/usr/bin/env bash

wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install -y build-essential irb libmysql-ruby libmysqlclient-dev libopenssl-ruby libreadline-ruby mysql-server rake rdoc ri ruby ruby-dev
apt-get install puppet-dashboard

sed -i -e '/max_allowed_packet/ s/16/32/' /etc/mysql/my.cnf
mysql --user=root --password=root <<EOF
CREATE DATABASE dashboard CHARACTER SET utf8;
CREATE USER 'dashboard'@'localhost' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON dashboard.* TO 'dashboard'@'localhost;
set max_allowed_packet = 33554432;
EOF

sed -i -e '/password:/ s/$/ my_password/' /usr/share/puppet-dashboard/config/database.yml

cd /usr/share/puppet-dashboard
rake RAILS_ENV=production db:migrate

cat > /etc/puppet/puppet.conf <<EOF
[master]
  reports = store, http
  reporturl = http://localhost:3000/reports/upload
EOF

puppet master --user root
rake RAILS_ENV=production jobs:work