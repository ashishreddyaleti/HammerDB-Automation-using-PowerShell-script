puts "SETTING CONFIGURATION"
global complete
proc wait_to_complete {} {
global complete
set complete [vucomplete]
if {!$complete} { after 5000 wait_to_complete } else { exit }
}
puts "SETTING CONFIGURATION"
dbset db mssqls
diset connection mssqls_uid sa
diset connection mssqls_pass admin
diset connection mssqls_server 192.168.2.4
diset connection mssqls_authentication sql
diset tpcc mssqls_count_ware 1
diset tpcc mssqls_num_vu 1
vuset logtotemp 1
buildschema
wait_to_complete
vwait forever
