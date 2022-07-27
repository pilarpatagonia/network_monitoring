Write-Output "Begin Test"
$names = Get-content "C:\hname.txt"
foreach($name in $names) {
if(Test-connection -ComputerName $name -Count 1 -ErrorAction SilentlyContinue){
write-host "$name is up" -ForegroundColor Green
$otput+="$name is up,"+"`n"
}
else{
Write-Host "$name is down" -ForegroundColor Red
$output+="$name is down,"+"`n"
Write-Output "SENDING E-MAIL"
$Email = "youremail@gmail.com";
$EmailTo = "emailtorecive@email.com";
$Subject = "Alert"
$Message = "Not Connection"
$ServerSMTP = "smtp.gmail.com"
$ClientSMTP = New-Object Net.Mail.SmtpClient($ServerSMTP, 587)
$ClientSMTP.EnableSsl = $true
$ClientSMTP.Credentials = New-Object System.Net.NetworkCredential("youremail@gmail.com", "yourPassword");
$ClientSMTP.Send($Email, $EmailTo, $Subject, $Message)
}
}
$output | Out-File "C:\result.txt"
Write-Output "End Of Test- 15 seg OFF"
Start-Sleep -s 15