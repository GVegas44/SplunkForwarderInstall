$creds = Get-Credential -Credential meetech.com\james.bond
$ip = 2,4,5,6,7




forEach ($i in $ip) {
    $session = New-PSSession -computername 11.25.15.$i -Credential $creds
    Invoke-Command -session $session -ScriptBlock { Get-Service SplunkForwarder }
    Remove-PSSession -Session $session
}