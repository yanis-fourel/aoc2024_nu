def main [] {
	let tab = open inputs/d1a | lines | split column -c ' '
	let l = $tab | get column1 | sort
	let r = $tab | get column2 | sort

	$l
	| zip $r 
	| each {|elt| ($elt.0 | into int) - ($elt.1 | into int) | math abs}
	| math sum
}
