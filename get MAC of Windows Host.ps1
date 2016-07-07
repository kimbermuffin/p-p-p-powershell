$promptstring1 = "Enter HostName"
$hostname = Read-Host "Enter HostName"
Invoke-Command -ComputerName $hostname -Credential (Get-Credential) -ScriptBlock {Get-CimInstance -ClassName Win32_NetworkAdapter | FT Name,MacAddress -AutoSize}
