#2 arrays/lists with parametrized mapping one-to-one.

proc lshift {l i} {
	puts $i; 
	# if the item already exists, just return the list back
	if {![lsearch $l $i]} {return $l}
	# insert new item at the top
	set l [linsert $l 0 $i]
	# delete the one at the end
	return [lrange $l 0 end-1]
}

#2 lists of 5 elements each
set a {}
set b {}
foreach i {1 2 3 4 5} {
	set a [lappend a "a$i"]
	set b [lappend b "b$i"]
}

#List of 5 rand elements - maps the elements of list A to list B; CAVEAT: The elements are not unique - one-to-one mapping is not certain
set c {}
set n 10
foreach j {1 2 3 4 5} {
	set c [lappend c [eval ::tcl::mathfunc::round [expr [eval ::tcl::mathfunc::rand]*5]]]
}

#List of 5 rand elements - maps the elements of list A to list B; NOTE: The elements are UNIQUE - one-to-one mapping is certain
	#This loop fills in 5 random non-unique elements into the list
#set c {0 0 0 0 0}
set c {}
while {(5 != [llength $c])} {
	puts "rand(c) = $c"
	puts "sort(c) = [lsort -unique $c]"
	lappend c [eval ::tcl::mathfunc::round [expr ([eval ::tcl::mathfunc::rand]*4)+1]]
}
puts $c

	#This loop replaces the 5 elements with 5 unique random elements
while {([lsort $c] != [lsort -unique $c])} {
	set c [lshift $c [eval ::tcl::mathfunc::round [expr ([eval ::tcl::mathfunc::rand]*4)+1]]]
}
puts $c
