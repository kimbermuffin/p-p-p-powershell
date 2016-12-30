
Import-CSV "C:\scripts\unames.csv" | ForEach-Object { 
$User = $_.UserName 
 $oldnotes = Get-ADUser $User -Properties info | %{ $_.info}
 Set-ADUser $User -Replace @{info="$($oldnotes)`nNewTextGoesHere"}
}
