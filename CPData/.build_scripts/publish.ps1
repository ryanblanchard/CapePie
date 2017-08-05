param
(
    [string] $Option = "publish",
    [string] $location = "local"
)

$prj_name = "CPData"
$prj_root_folder = (Resolve-Path ..).Path
$sln_root_folder = (Resolve-Path ..\..).Path

# assumes you have downloaded 16.5 for Visual Studio 2015. 2013 will need to go to "13.0"
$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\130\sqlpackage.exe"

# validate the $option for action parameter
if (-not ($Option -match "publish" -or ( $Option -match "script")))
{
    Throw 'You must enter either "publish" or "script" in $option to continue'
}
$a = "/Action:$Option"

# validate and set connection string accordingly
if (-not ($location -match "test" -or ( $location -match "local")))
{
    Throw 'You must enter either "test" or "local" in $location to continue'
}
if ($location -eq "test")
{
	#intentionally left blank; you need to provide connection string to your sql azure instance
    $sqlconnection = ""
}
else
{
    $sqlconnection = "SERVER=localhost;Integrated Security=True"
}

$dacpac_file = Get-ChildItem -Path ($sln_root_folder + "\dac_packages\latest") -Filter ($prj_name + "_*.dacpac")

$tcs = "/TargetConnectionString:$sqlconnection"
$pr = "/Profile:" + $prj_root_folder + "\publish\" + $prj_name + ".publish.xml"
$dsp = "/DeployScriptPath:" + $sln_root_folder + "\dac_packages\latest\" + $prj_name + ".deploy_script.sql"
$drp = "/DeployReportPath:" + $sln_root_folder + "\dac_packages\latest\" + $prj_name + ".deploy_report.xml"
$sf = "/SourceFile:" + $dacpac_file.FullName

& $sqlpackage $a $tcs $pr $dsp $drp $sf

Write-Output ""
Write-Output("DACPAC: " + $dacpac_file.FullName)
