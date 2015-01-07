 Import-Module 'C:\Program Files (x86)\Microsoft Configuration Manager\bin\ConfigurationManager.psd1'
CD FVE:
$applications=Get-CMApplication |Select-Object ApplicationName,LocalizedDisplayName, CIVersion |Where-Object CIVersion -eq "1" 
foreach ($app in $applications)
{
$app=$app.LocalizedDisplayName
Write-host "Application :" "$app" -ForegroundColor DarkCyan

$dpttypes=Get-CMDeploymentType -ApplicationName $app

foreach ($dpt in $dpttypes)
{
$dptname=$dpt.LocalizedDisplayName
Write-Host "Deployment Type:" "$dptname" -ForegroundColor DarkGreen
Update-CMDistributionPoint -ApplicationName $app -DeploymentTypeName $dptname 
  }
  }


