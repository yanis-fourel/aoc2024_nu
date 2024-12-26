export def all-same-sign [] list<int> -> bool {
	let min = $in | math min
	let max = $in | math max

	($min < 0 and $max < 0) or ($min > 0 and $max > 0) or ($min == 0 and $max == 0)
}

def is-report-valid [] list<int> -> bool {
	$in
	| window 2
	| each {|elt|
		$elt.1 - $elt.0
	}
	| (
		($in | all-same-sign)
		and ($in | math max) < 4
		and ($in | math min) > -4
	)
}

def main [] {
	open inputs/day2.txt
	| lines 
	| filter {
		split row ' ' | each { into int } | is-report-valid
	}
	| length
}

export def "main test" [] {
	use std assert
	assert ([1, 2, 3] | all-same-sign)
	assert ([-1, -2, -3] | all-same-sign)
	assert ([0, 0, 0] | all-same-sign)
	assert not ([1, 2, 0] | all-same-sign)
	assert not ([-1, 2, 0] | all-same-sign)
	assert not ([-1, 2, 3] | all-same-sign)
	assert not ([-1, 2, -3] | all-same-sign)

	print "ok"
}
