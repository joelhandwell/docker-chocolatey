$packageName    = 'docker'
$url            = 'https://get.docker.com/builds/Windows/i386/docker-1.8.1.exe'
$checksum       = '5665ee207da5fc043f7875952f2fa5a8'
$url64          = 'https://get.docker.com/builds/Windows/x86_64/docker-1.8.1.exe'
$checksum64     = 'd77766fd438dcd45096a5ada2af65340'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"
