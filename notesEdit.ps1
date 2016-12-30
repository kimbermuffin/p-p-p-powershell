# For better user management
#
# kimber duke 2k16
#

$ticket = Read-Host -Prompt 'Enter ticket reference number'
$wave = Read-Host -Prompt 'Enter class and wave'
$admin = Read-Host -Prompt 'Enter sysadmin initials'

$date = Get-date

Import-CSV "C:\scripts\unames.csv" | ForEach-Object { 
$User = $_.UserName 
 $oldnotes = Get-ADUser $User -Properties info | %{ $_.info}
 Set-ADUser $User -Replace @{info="$($oldnotes)`n$ticket - $wave - $admin - $date"}
}