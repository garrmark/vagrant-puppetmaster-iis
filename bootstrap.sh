#!/usr/bin/env bash

cat > /etc/puppet/hiera.yaml <<EOF
:hierarchy:
  - '%{::fqdn}'
  - common
:yaml:
  :datadir: /etc/puppet/hiera
EOF

ln -s /etc/puppet/hiera.yaml /etc/hiera.yaml

puppet master --user root

