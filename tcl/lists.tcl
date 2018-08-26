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


set n 10
#List ln from 1 to n
set ln {}
for {set x 1} {$x<=$n} {incr x} {lappend ln $x}

#2 lists of n elements each
set a {}
set b {}
foreach i $ln {
	set a [lappend a "a$i"]
	set b [lappend b "b$i"]
}


proc get_random_elements {} {
	#List of n random elements - maps the elements of list A to list B; CAVEAT: The elements are not unique - one-to-one mapping is not certain
	set c {}
	foreach j $ln {
		set c [lappend c [eval ::tcl::mathfunc::round [expr [eval ::tcl::mathfunc::rand]*5]]]
	}




	#List of n random elements - maps the elements of list A to list B; NOTE: The elements are UNIQUE - one-to-one mapping is certain

		#This loop fills in n random non-unique elements into the list
	#set c {0 0 0 0 0}
	set c {}
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
	
	return $c;
}