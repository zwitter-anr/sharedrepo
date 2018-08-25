proc sumofatob {a b} {
    set i $a
	set sum 0
    while {$i <= $b} {
		set sum [expr $sum + $i]
        set i [expr $i + 1]
    }
    return $sum
}

proc sumofatob1 {a b} {
	set sum 0
    while {$a <= $b} {
		set sum [expr $sum + $a]
        set a [expr $a + 1]
    }
    return $sum
}

proc sumofatob2 {a b} {
	return [expr (($b*($b+1)/2) - (($a-1)*$a/2))]
}

