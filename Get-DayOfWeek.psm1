function Get-DayOfWeek {
	param (
		[Datetime] $Date
	)
	# Sunday 0, Monday 1, Tuesday 2, Wednesday 3, Thursday 4, Friday 5, Saturday 6, and Holiday 7
	# Japanease Holidays in 2021(you need update this data depend on year/country.)
	$ar = @("2021/1/1", "2021/1/11", "2021/2/11", "2021/2/23", "2021/3/20", "2021/4/29", `
			"2021/5/3", "2021/5/4", "2021/5/5", "2021/7/22", "2021/7/23", "2021/8/8", `
			"2021/8/9", "2021/9/20", "2021/9/23", "2021/11/3", "2021/11/23")
	$Holidays = $ar | ForEach-Object { [Datetime]$_ }
	if ( $Date.Date -in $Holidays ) {
		enum MyDayOfWeek { Holiday = 7 }
		[MyDayOfWeek]::Holiday
	}
	else {
		$Date.DayOfWeek
	}
}
