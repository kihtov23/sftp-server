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


az storage account local-user create ^
  --account-name sftpstorageaccounteu ^
  -g sftp-server ^
  -n adminb ^
  --permission-scope permissions=rw service=file resource-name=share2 ^
  --ssh-authorized-key key="ssh-rsa a2V5" --has-ssh-key true --has-ssh-password --has-shared-key false

az storage account local-user create ^
  --account-name sftpstorageaccounteu ^
  -g sftp-server ^
  -n adminb ^
  --permission-scope permissions=rw service=file resource-name=share2 ^
  --has-ssh-password true

az storage account local-user regenerate-password --account-name sftpstorageaccounteu -g sftp-server -n adminb 