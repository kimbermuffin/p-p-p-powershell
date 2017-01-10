$Name = "kduke"
$dname = $name
$count = 1

While ($count -le 10) {

        If($User = Get-ADObject -LDAPFilter "(sAMAccountName=$Name)"){
        Write-Host $User

        Write-Host "Checked $name"
        
        $Name = $dname + $count++
        
        Write-Host "We have incremented to $Name"

        }
        else {
        Write-Host "Make $Name the user!";break}
     }

