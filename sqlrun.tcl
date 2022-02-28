#!/bin/tclsh
proc runtimer { seconds } {
set x 0
set timerstop 0
while {!$timerstop} {
incr x
after 1000
  if { ![ expr {$x % 60} ] } {
          set y [ expr $x / 60 ]
          puts "Timer: $y minutes elapsed"
  }
update
if {  [ vucomplete ] || $x eq $seconds } { set timerstop 1 }
    }
return
}
puts "SETTING CONFIGURATION"
dbset db mssqls
diset connection mssqls_server 192.168.2.
diset connection mssqls_authentication sql
diset connection mssqls_uid sa
diset connection mssqls_pass admin
diset tpcc mssqls_driver timed
diset tpcc mssqls_rampup 2
diset tpcc mssqls_duration 5
vuset logtotemp 1
vuset delay 1
vuset repeat 1
vuset iterations 1
vuset showoutput 1
vuset logtotemp 1
vuset unique 1
vuset timestamps 1
loadscript
puts "SEQUENCE STARTED"
vuset vu 16
vucreate
vurun
#Runtimer in seconds must exceed rampup + duration
runtimer 450
vudestroy
after 500
puts "TEST SEQUENCE COMPLETE"
