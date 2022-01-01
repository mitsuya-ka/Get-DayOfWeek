function Get-DayOfWeek {
	param (
		[Datetime] $Date,
		[String] $PathHD = 'Holidays.txt',
		[Switch] $WorkDay
	)
	# Sunday 0, Monday 1, Tuesday 2, Wednesday 3, Thursday 4, Friday 5, Saturday 6, Holiday 7
	# Holidays data from "https://uic.jp/calendar/"
	if ( $WorkDay ) {
		[Datetime[]]$Holidays = (Get-Content -Path $PathHD | Where-Object { $_ -notmatch '^#' }).Replace('A ', '')
	}
	else {
		[Datetime[]]$Holidays = Get-Content -Path $PathHD | Where-Object { $_ -notmatch '^[#A]' }
	}
	if ( $Date.Date -in $Holidays ) {
		enum MyDayOfWeek { Holiday = 7 }
		[MyDayOfWeek]::Holiday
	}
	else {
		$Date.DayOfWeek
	}
}
