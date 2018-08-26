package require Tk

wm title . "List mapping"
grid [ttk::frame .c -padding "3 3 12 12"] -column 0 -row 0 -sticky nwes
grid columnconfigure . 0 -weight 1; 
grid rowconfigure . 0 -weight 1







source lists.tcl;

proc get_stimulus {} {
	set c [get_random_elements]
	#This loop fills in the mapping between the two lists using Tk labels
	foreach i $ln {
		grid [label .c.a$i -text "[lindex $a [expr $i-1]]"] -column 0 -row $i -sticky w
		grid [label .c.d$i -text "         [lindex $c [expr $i-1]]         "] -column 1 -row $i -sticky e
		grid [label .c.b$i -text "[lindex $b [expr [lindex $c [expr $i-1]]-1]]"] -column 2 -row $i -sticky e
	}
}
get_stimulus;
grid [button .c.btn -text "Randomize" -command get_stimulus] -column 1 -row [expr $n+1] -sticky w

#bind . <Return> {get_stimulus}