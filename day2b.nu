use day2a.nu is-report-valid

def main [] {
	open inputs/day2.txt
	| lines
	| filter {
		let report = split row ' ' | each { into int } 

		if ($report | is-report-valid) {
			return true
		}

		for i in 0..($report | length) {
			let r = $report | drop nth $i
			if ($r | is-report-valid) {
				return true
			}
		}

		return false
	}
	| length
}
