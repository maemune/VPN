@echo off

set VPN_NAME=############
set SERVER_ADDR=###.###.###.###

powershell -command "$n='%VPN_NAME%'; $s='%SERVER_ADDR%'; $p='%PSK_KEY%'; Add-VpnConnection -Name $n -ServerAddress $s -SplitTunneling -Force; Get-VpnConnection -Name $n"
