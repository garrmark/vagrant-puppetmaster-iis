class dotnet {
  $exe_name = "dotNetFx40_Full_x86_x64.exe"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\dotnetfx.exe'

  file { $on_disk:
    ensure => file,
    source => $location,
    mode   => '750',
  }

  package { "Microsoft .NET Framework 4 Extended":
    ensure => present,
    source => $on_disk,
    install_options => [ '/q', '/norestart' ],
  }
  
  $appfab = "WindowsServerAppFabricSetup_x64_6.1.exe"
  file { "c:\\${appfab}":
    ensure => file,
    source => "puppet:///modules/${module_name}/${appfab}",
  }
  
  package { "Test":
    ensure => present,
    source => "c:\\${appfab}",
    install_options => [ '/i', '/l c:\abbfab_install.txt' ],
  }

}
