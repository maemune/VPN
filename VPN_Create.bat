@echo off

REM Check for Admin privileges
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
　@powershell start-process ”%~0" -verb runas
　exit
)

REM Configure and register VPN connection via PowerShell
REM Set VPN Name
REM Set Server IP Address
REM Set Pre-Shared Key (PSK)

powershell -command "$vpnName = '######'; ^
$serverAddress = '###.###.###.###'; ^
Add-VpnConnection -Name $vpnName ^
-ServerAddress $serverAddress ^
-TunnelType L2tp ^
-EncryptionLevel Maximum ^
-AuthenticationMethod MSChapv2 ^
-RememberCredential ^
-SplitTunneling ^
-L2tpPsk '#########' ^
-Force; ^
Get-VpnConnection -Name $vpnName"