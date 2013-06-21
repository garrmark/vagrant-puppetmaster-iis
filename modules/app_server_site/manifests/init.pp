define app_server_site ($bindings) {
  file {"C:\\inetpub\\wwwroot\\${title}":
    ensure          => directory,
    require => Dism['IIS-WebServerRole']
  }

  file {"C:\\inetpub\\wwwroot\\${title}\\default.aspx":
    content =>
'<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
<title>Managed by Puppet</title>
</head>
<body>
<h1>Managed by Puppet</h1>

<strong>Time:</strong> <%= DateTime.UtcNow.ToString("s") + "Z" %>
</body>
</html>'
  }

  iis_apppool {$title:
    ensure                => present,
    managedpipelinemode   => 'Integrated',
    managedruntimeversion => 'v4.0',
    enable32bitapponwin64 => 'true',
    processmodel_identitytype => 'NetworkService',
    require               => Dism['IIS-WebServerRole']
  }

  iis_site {$title:
    ensure   => present,
    bindings => $bindings,
  }

  iis_app {"${title}/":
    ensure          => present,
    applicationpool => $title,
  }

  iis_vdir {"${title}/":
    ensure       => present,
    iis_app      => "${title}/",
    physicalpath => "C:\\inetpub\\wwwroot\\${title}"
  }
}
