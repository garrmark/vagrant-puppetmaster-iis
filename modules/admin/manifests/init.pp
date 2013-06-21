class admin {
  $exe_name = "add_admin_users.bat"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\add_admin_users.bat'

  file { $on_disk:
    ensure => file,
    source => $location,
    mode   => '750',
  }

  exec { $on_disk:
    subscribe => File[$on_disk],
    refreshonly => true
  }

}
