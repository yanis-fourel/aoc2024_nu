# Counts the number of occurence to `val` in the input list
def count [val: any]: list<any> -> int {
	each { if $in == $val { 1 } else { 0 } } | math sum
}

def main [] {
	let tab = open inputs/d1a | lines | split column -c ' '
	let l = $tab | get column1 | each { into int }
	let r = $tab | get column2 | each { into int }

	$l
	| each {|elt| $elt * ($r | count $elt)}
	| math sum
}
