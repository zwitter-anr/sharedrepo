package require Tk

wm title . "List mapping"
grid [ttk::frame .c -padding "3 3 12 12"] -column 0 -row 0 -sticky nwes
grid columnconfigure . 0 -weight 1; 
grid rowconfigure . 0 -weight 1






proc get_stimulus {a b c n ln} {
	set c [get_random_elements $ln $n]
	#This loop fills in the mapping between the two lists using Tk labels
	foreach i $ln {
		set ::albl$i [lindex $a [expr $i-1]]
		set ::blbl$i "         [lindex $c [expr $i-1]]         "
		set ::clbl$i [lindex $b [expr [lindex $c [expr $i-1]]-1]]
	}
}


set l_lists [source lists.tcl]
set a  [lindex $l_lists 0]
set b  [lindex $l_lists 1]
set c  [lindex $l_lists 2]
set n  [lindex $l_lists 3]
set ln [lindex $l_lists 4]

get_stimulus $a $b $c $n $ln;
foreach i $ln {
	grid [label .c.a$i -textvariable albl$i] -column 0 -row $i -sticky w
	grid [label .c.d$i -textvariable blbl$i] -column 1 -row $i -sticky e
	grid [label .c.b$i -textvariable clbl$i] -column 2 -row $i -sticky e
}
grid [button .c.btn -text "Randomize" -command {get_stimulus $a $b $c $n $ln}] -column 1 -row [expr $n+1] -sticky w

#bind . <Return> {get_stimulus}