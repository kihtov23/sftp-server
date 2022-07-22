set ^
$rsgExists=az group exists -n sftp-server ^
if ($rsgExists -eq 'false') { ^
    az group create -l "westeurope" -n sftp-server ^
}

az deployment group create ^
  --name createstorageaccount ^
  --resource-group sftp-server ^
  --template-file "C:\Oleg\src\sftp-server\infrastructure\arm-template-storageaccount\template.json" ^
  --parameters "C:\Oleg\src\sftp-server\infrastructure\arm-template-storageaccount\parameters.json"
pause
