source lists.tcl

foreach k $ln {
	dict set d a$k b[lindex $c [expr $k-1]]
}