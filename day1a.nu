def main [] {
	let tab = open inputs/day1.txt | lines | split column -c ' '
	let l = $tab | get column1 | each { into int } | sort
	let r = $tab | get column2 | each { into int } | sort

	$l
	| zip $r 
	| each {|elt| $elt.0 - $elt.1 | math abs}
	| math sum
}
