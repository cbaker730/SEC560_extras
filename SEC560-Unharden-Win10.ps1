#This powershell set of cmdlet's will get a Windows 10 system to be unhardened
#For class.
#by Moses Frost - source https://gist.github.com/mosesrenegade/f39c7a2c7164a29e5ff85520f34c2625
#obviously open up powershell terminal as administrator

# Disable Defender
Set-MpPreference -DisableRealTimeMonitoring $true
New-ItemProperty -Path 'HKLM:\SOftware\Policies\Microsoft\Windows Defender' -Name DisableAntiSpyware -PropertyType Dword -Value 1

# Disable Firewalls
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Disable DEP
Set-Processmitigation -System -Disable DEP

# Disable UAC
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType Dword -Value 0 -Force

# Disable ControlFlowControl
Set-Processmitigation -System -Disable CFG

# Disable ASLR
Set-Processmitigation -System -Disable ForceRelocateImages

# Disable ASLR
Set-Processmitigation -System -Disable BottomUp

# Disable ASLR
Set-Processmitigation -System -Disable HighEntropy

# Disable SEHOP
Set-Processmitigation -System -Disable SEHOP

# Disable StrictCFG
Set-Processmitigation -System -Disable StrictCFG

# Disable SEHOPTelemetry
Set-Processmitigation -System -Disable SEHOPTelemetry

# Disable TerminateOnError
Set-Processmitigation -System -Disable TerminateonError

# SmartScreen Disable HACK
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -ErrorAction Stop -Value Off -Force
