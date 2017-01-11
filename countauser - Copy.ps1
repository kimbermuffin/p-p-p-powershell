Import-CSV .\Users_AccountCreation.csv | ForEach-Object {
$Name = $_.Logon
$dname = $name
$count = 1

While ($count -le 10) {

        If($User = Get-ADObject -LDAPFilter "(sAMAccountName=$Name)"){
        Write-Host $User

        Write-Host "Checked $name"
        
        $Name = $dname + $count++
        
        # Write-Host "Checking if $Name exists"

        }
        else {
        Write-Host "Make $Name the user!"
        New-ADUser -SamAccountName $Name -EmployeeID $_.EmpID -Name $_.Firstname -DisplayName $_.Firstname -SurName $_.Lastname -Department $_.Department -Path “OU=GA IT Dept,OU=BE Users,DC=tucson,DC=local” -AccountPassword (ConvertTo-SecureString “C3connect123” -AsPlainText -force) -Enabled $True -PasswordNeverExpires $True -PassThru 
        
        break}
     }
}