$promptstring1 = "Enter HostName"
Invoke-Command -ComputerName tuc-services-01.tucson.local -ScriptBlock {
  $scopes = Get-DhcpServerv4Scope
  do {
    $hostname = Read-Host "Enter HostName"
    if ($hostname -ne '') {
      Clear-Host
      foreach ($scope in $scopes) {Get-DhcpServerv4Lease -ScopeId $scope.ScopeId | where {$_.HostName -like "$hostname*"} |
        ForEach-Object -Process {
          $testcomputer = Test-Connection -CN $_.IPAddress -Count 1 -BufferSize 16 -Quiet
          IF ($testcomputer -match 'True') {
            Write-Host -ForegroundColor green $_.HostName
            Write-Host -ForegroundColor green $_.IPAddress
            Write-Host -ForegroundColor green $_.LeaseExpiryTime
            Write-Host `n
          }
          ELSE {
            Write-Host -ForegroundColor red $_.HostName
            Write-Host -ForegroundColor red $_.IPAddress
            Write-Host -ForegroundColor red $_.LeaseExpiryTime
            Write-Host `n
          }
        }
      }
    }
  } while ($hostname -ne '')}