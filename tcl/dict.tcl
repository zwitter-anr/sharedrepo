set l_lists [source lists.tcl]
set a  [lindex $l_lists 0]
set b  [lindex $l_lists 1]
set c  [lindex $l_lists 2]
set n  [lindex $l_lists 3]
set ln [lindex $l_lists 4]


foreach k $ln {
	dict set d a$k b[lindex $c [expr $k-1]]
}