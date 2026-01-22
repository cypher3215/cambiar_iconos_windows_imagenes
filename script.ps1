# ejecutar en powershell

$ext = ".txt"
$icon = "C:\ruta\a\tu_icono.ico"

$regPath = "HKCU:\Software\Classes\$ext"
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "(Default)" -Value "txtfile_custom"

$iconPath = "HKCU:\Software\Classes\txtfile_custom\DefaultIcon"
New-Item -Path $iconPath -Force | Out-Null
Set-ItemProperty -Path $iconPath -Name "(Default)" -Value $icon

Stop-Process -Name explorer -Force
