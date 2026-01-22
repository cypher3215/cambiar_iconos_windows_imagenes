$icon = "C:\Users\Usuario\Downloads\corazoncito.ico"
$ruta = "C:\Users\Usuario\Desktop"  # Cambia esta ruta si quieres

Get-ChildItem -Path $ruta -Directory | ForEach-Object {
    $desktopIni = Join-Path $_.FullName "desktop.ini"

    Set-Content -Path $desktopIni -Value "[.ShellClassInfo]`nIconResource=$icon,0" -Encoding ASCII

    attrib +h +s $desktopIni
    attrib +r $_.FullName
}

Stop-Process -Name explorer -Force
