$creds = Get-Credential -Credential meetech.com\james.bond
$ip = 10,11,12,13,14,16,18,2,22,23,24,25,26,27,28,29,30,37,4,40,5,6,7,8,9




forEach ($i in $ip) {
    $session = New-PSSession -computername 11.25.20.$i -Credential $creds
    Invoke-Command -session $session -ScriptBlock { get-Service SplunkForwarder }
    Remove-PSSession -Session $session
}