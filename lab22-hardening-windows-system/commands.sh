# Lab — Hardening a Windows System
# Commands Executed During Lab (sequential, no explanations)

Get-WindowsOptionalFeature -Online -FeatureName TelnetClient
Disable-WindowsOptionalFeature -Online -FeatureName TelnetClient
Get-WindowsOptionalFeature -Online -FeatureName TelnetClient

secedit /export /cfg C:\password_policy.cfg
Select-String -Path C:\password_policy.cfg -Pattern "PasswordHistorySize|MinimumPasswordLength|PasswordComplexity"

net accounts

$initial = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    TelnetClientState = (Get-WindowsOptionalFeature -Online -FeatureName TelnetClient).State
    MinPasswordLength = (net accounts | Select-String "Minimum password length").ToString().Split(":")[1].Trim()
    PasswordHistory = (net accounts | Select-String "Length of password history").ToString().Split(":")[1].Trim()
    LockoutThreshold = (net accounts | Select-String "Lockout threshold").ToString().Split(":")[1].Trim()
    LockoutDuration = (net accounts | Select-String "Lockout duration").ToString().Split(":")[1].Trim()
    LockoutWindow = (net accounts | Select-String "Lockout observation window").ToString().Split(":")[1].Trim()
}
$initial | Export-Csv -Path "C:\InitialSystemState.csv" -NoTypeInformation
Get-Item C:\InitialSystemState.csv | Select-Object Name, Length, LastWriteTime

$final = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    TelnetClientState = (Get-WindowsOptionalFeature -Online -FeatureName TelnetClient).State
    MinPasswordLength = (net accounts | Select-String "Minimum password length").ToString().Split(":")[1].Trim()
    PasswordHistory = (net accounts | Select-String "Length of password history").ToString().Split(":")[1].Trim()
    LockoutThreshold = (net accounts | Select-String "Lockout threshold").ToString().Split(":")[1].Trim()
    LockoutDuration = (net accounts | Select-String "Lockout duration").ToString().Split(":")[1].Trim()
    LockoutWindow = (net accounts | Select-String "Lockout observation window").ToString().Split(":")[1].Trim()
}
$final | Export-Csv -Path "C:\FinalSystemState.csv" -NoTypeInformation
Get-Item C:\FinalSystemState.csv | Select-Object Name, Length, LastWriteTime

Compare-Object (Import-Csv C:\InitialSystemState.csv) (Import-Csv C:\FinalSystemState.csv) -Property TelnetClientState,MinPasswordLength,PasswordHistory,LockoutThreshold,LockoutDuration,LockoutWindow
