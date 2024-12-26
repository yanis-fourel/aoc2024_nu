def main [] {
	let tab = open inputs/d1a | lines | split column -c ' '
	let l = $tab | get column1 | sort
	let r = $tab | get column2 | sort

	$l
	| zip $r 
	| reduce --fold 0 { |it, acc| $acc + (($it.0 | into int) - ($it.1 | into int) | math abs)}
}
