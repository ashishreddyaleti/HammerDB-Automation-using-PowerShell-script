set-location -Path "C:\Users\hammerdb\HammerDB-4.3\"
Write-Host "Workload Starting"
Write "Starting Build"
.\hammerdbcli.bat auto sqlbuild.tcl
