class chocolatey {
    exec { 'install':
        path    => ["${systemroot}/system32", "${systemroot}/System32/WindowsPowerShell/v1.0"],
        creates => "${systemdrive}/chocolatey/bin/chocolatey.bat",
        command => 'cmd.exe /c start /w powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString(\'https://chocolatey.org/install.ps1\'))"'
    }
}

Package <| provider == 'chocolatey' |> {
    require => Class['chocolatey']
}
