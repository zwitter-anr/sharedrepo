source lists.tcl

foreach k {1 2 3 4 5} {
	dict set d a$k b[lindex $c [expr $k-1]]
}