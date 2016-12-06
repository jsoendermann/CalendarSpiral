calendarmake: calendar.mp
	mpost calendar
	mptopdf calendar.0
	rm -f ./calendar.pdf
	mv calendar-0.pdf calendar.pdf