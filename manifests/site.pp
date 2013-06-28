node 'agent1.mypartssource.com' {
  include dotnet
  include iis_role_setup
  include chocolatey
  include admin
  
  $iis_sites = hiera('iis_sites', [])
  create_resources('app_server_site',$iis_sites)
#  app_server_site { 'PFAppServer-Dev':
#    port => 60014
#  }
#  
#  app_server_site { 'PFGPServer-Dev':
#    port => 60114
#  }
#  
#  app_server_site { 'MyOEMServer-Dev':
#    port => 60214
#  }
  
  package { [['notepadplusplus'],['GoogleChrome']]:
    ensure          => installed,
    provider        => 'chocolatey',
    install_options => '-pre',
  }
}
