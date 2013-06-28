if ($env:computername -ne "AGENT1")
{
  "192.168.50.5`t`tpuppet.mypartssource.com" | Out-File -encoding ASCII "C:\Windows\System32\drivers\etc\hosts"
  msiexec /qn /i \\VBOXSVR\vagrant\puppet-3.1.1.msi

  wmic computersystem where name="%COMPUTERNAME%" call rename name="AGENT1"
  shutdown /r /t 0
}