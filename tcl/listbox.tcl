package require Tk

wm title . "List mapping"
grid [ttk::frame .c -padding "3 3 12 12"] -column 0 -row 0 -sticky nwes
grid columnconfigure . 0 -weight 1; 
grid rowconfigure . 0 -weight 1





proc lshift {l i} {
	puts $i; 
	# if the item already exists, just return the list back
	if {![lsearch $l $i]} {return $l}
	# insert new item at the top
	set l [linsert $l 0 $i]
	# delete the one at the end
	return [lrange $l 0 end-1]
}

#List of n rand elements - maps the elements of list A to list B; NOTE: The elements are UNIQUE - one-to-one mapping is certain
	#This loop fills in 5 random non-unique elements into the list
set c {}
set n 10
while {($n != [llength $c])} {
	puts "rand(c) = $c"
	puts "sort(c) = [lsort -unique $c]"
	lappend c [eval ::tcl::mathfunc::round [expr ([eval ::tcl::mathfunc::rand]*($n-1))+1]]
}
puts $c

	#This loop replaces the n elements with unique random elements
while {([lsort $c] != [lsort -unique $c])} {
	set c [lshift $c [eval ::tcl::mathfunc::round [expr ([eval ::tcl::mathfunc::rand]*($n-1))+1]]]
}
puts $c



#This loop fills in the mapping between the two lists using Tk labels
foreach i {1 2 3 4 5 6 7 8 9 10} {
	grid [label .c.a$i -text "a$i"] -column 0 -row $i -sticky w
	grid [label .c.d$i -text "         [lrange $c [expr $i-1] [expr $i-1]]         "] -column 1 -row $i -sticky e
	grid [label .c.b$i -text "b[lrange $c [expr $i-1] [expr $i-1]]"] -column 2 -row $i -sticky e
}

grid [button .c.btn -text "Randomize"] -column 1 -row [expr $n+1] -sticky w
