$creds = Get-Credential -Credential meetech.com\james.bond
$ip = 2,22,23,26,28,3,4,5,7,8




forEach ($i in $ip) {
    $session = New-PSSession -computername 11.25.10.$i -Credential $creds
    #Copy-Item -Path C:\Users\BlackGuard\sysmonconfig-export.xml -Destination 'c:\Users\james.bond\Documents\' -ToSession $session
    #Copy-Item -Path C:\Users\BlackGuard\splunkforwarder-8.1.1-08187535c166-x64-release.msi -Destination 'c:\Users\james.bond\Documents\' -ToSession $session
    #Copy-Item -Path C:\Users\BlackGuard\Sysmon.exe -Destination 'c:\Users\james.bond\Documents\' -ToSession $session
    #Invoke-Command -session $session -ScriptBlock { c:\Users\james.bond\Documents\sysmon.exe -i -n -accepteula}
    Invoke-Command -session $session -ScriptBlock { Msiexec /i c:\Users\james.bond\Documents\splunkforwarder-8.1.1-08187535c166-x64-release.msi FORWARD_SERVER="172.31.2.55:9997" DEPLOYMENT_SERVER="172.31.2.55:9997" SPLUNKPASSWORD=1qaz2wsx!QAZ@WSX WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_SEC_ENABLE=1  WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_FWD_ENABLE=1  AGREETOLICENSE=YES /quiet }
    Start-Sleep -Seconds 30
    #Copy-Item -Path C:\Users\BlackGuard\inputs.conf -Destination 'C:\Program Files\SplunkUniversalForwarder\etc\system\local\' -ToSession $session
    #Copy-Item -Path C:\Users\BlackGuard\outputs.conf -Destination 'C:\Program Files\SplunkUniversalForwarder\etc\system\local\' -ToSession $session
    Invoke-Command -session $session -ScriptBlock { Restart-Service SplunkForwarder }
    Remove-PSSession -Session $session
}