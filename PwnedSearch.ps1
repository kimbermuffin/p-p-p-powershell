# PwnedSearch for Enterprise
# V 0.1 by kimber
# searches a .xslx provided by HaveIBeenPwned domain 
# search and provides a list of email addresses from 
# the domain

# function adapted from https://zeleskitech.com/2014/10/26/convert-xlsx-csv-powershell/
Function ExcelCSV ($File)
{
    $c = 0
    $excelFile = "$pwd\" + $File + ".xlsx"
    $Excel = New-Object -ComObject Excel.Application
    $Excel.Visible = $false
    $Excel.DisplayAlerts = $false
    $wb = $Excel.Workbooks.Open($excelFile)
    foreach ($ws in $wb.Worksheets)
    {
        $ws.SaveAs("$pwd\" + $File + $c + ".csv", 6)
        $c++
    }
    $Excel.Quit()
}

$FileName = Read-Host "Input file name"  
ExcelCSV -File "$FileName"

$newFile = $FileName + "0.csv"
$newFile2 = $FileName + "1.csv"

$breach = Read-Host "What breach do you want to search for?"
$newBreach = "*" + $breach + "*"

Import-Csv $newfile | Where {$_.Breach -match $breach} | Select Email | Out-File $breach" Emails.txt"

Write-Host "Exported file " + $Filename + "Emails.txt"

rm $newFile
rm $newFile2


