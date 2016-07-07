$promptstring1 = "Enter HostName"
$hostname = Read-Host "Enter HostName"
Get-Service -ComputerName $hostname -Name "ManageEngine NetFlow Analyzer" | Restart-Service -Verbose
