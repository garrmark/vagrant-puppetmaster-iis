# Class: iis_role_setup
#
# This module manages iis_role_setup
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class iis_role_setup {
  dism { 'IIS-WebServerRole':
    ensure => present,
  }

  dism { 'IIS-ASPNET':
    ensure => present,
    require => [Dism['IIS-ISAPIFilter'], Dism['IIS-ISAPIExtensions'], Dism['IIS-NetFxExtensibility']]
  }

  dism { 'IIS-ISAPIFilter':
    ensure => present,
  }
  
  dism { 'IIS-ISAPIExtensions':
    ensure => present,
  }

  dism { 'IIS-NetFxExtensibility':
    ensure => present,
    require => Dism['IIS-WebServerRole']
  }
}