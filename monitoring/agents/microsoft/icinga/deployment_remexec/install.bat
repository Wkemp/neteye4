@echo off
if %1.==. echo Run this command with remote hostname
if %1.==. goto :EOF

md \\%1\c$\temp
copy DeployAgent.ps1 \\%1\c$\temp
copy Icinga2Agent.psm1 \\%1\c$\temp
psexec64 \\%1 C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe Set-ExecutionPolicy Bypass
psexec64 \\%1 C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe c:\temp\DeployAgent.ps1
