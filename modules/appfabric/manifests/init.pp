class appfabric {
  $appfab = "WindowsServerAppFabricSetup_x64.exe"
  file { "c:\\${appfab}":
    ensure => file,
    source => "puppet:///modules/${module_name}/${appfab}",
  }
  
  package { "Microsoft(R) Windows(R) Server AppFabric":
    ensure => present,
    source => "c:\\${appfab}",
    install_options => [ '/i' ],
  }

}
