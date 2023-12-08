@echo off

REM "管理者として起動しているか確認"
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
　@powershell start-process ”%~0" -verb runas
　exit
)

REM "PowerShellコマンドでVPNの接続情報を設定し登録"
REM "$vpnNameにVPN名を入力"
REM "$serverAddressに接続先IPアドレスを入力"
REM "-L2tpPskに事前共有鍵を入力"
powershell -command "$vpnName = '######'; $serverAddress = '###.###.###.###'; Add-VpnConnection -Name $vpnName -ServerAddress $serverAddress -TunnelType L2tp -EncryptionLevel Maximum -AuthenticationMethod MSChapv2 -RememberCredential -SplitTunneling -L2tpPsk '#########' -Force; Get-VpnConnection -Name $vpnName"
