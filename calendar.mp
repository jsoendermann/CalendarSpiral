
u := 1cm;

numeric daysInMonth[];
daysInMonth[0] = 31;
daysInMonth[1] = 28;
daysInMonth[2] = 31;
daysInMonth[3] = 30;
daysInMonth[4] = 31;
daysInMonth[5] = 30;
daysInMonth[6] = 31;
daysInMonth[7] = 31;
daysInMonth[8] = 30;
daysInMonth[9] = 31;
daysInMonth[10] = 30;
daysInMonth[11] = 31;

string monthLetters[];
monthLetters[0] = "J";
monthLetters[1] = "F";
monthLetters[2] = "M";
monthLetters[3] = "A";
monthLetters[4] = "M";
monthLetters[5] = "J";
monthLetters[6] = "J";
monthLetters[7] = "A";
monthLetters[8] = "S";
monthLetters[9] = "O";
monthLetters[10] = "N";
monthLetters[11] = "D";

pi := 3.141529;

beginfig(0)
  def drawDay(expr z, text) =
    pair pos;
    pos = z scaled u;
    draw unitsquare scaled u shifted pos;
    label(text, origin) scaled 2 shifted (pos + (.5u, .5u)) withcolor (0.8, 0.8, 0.8);
  enddef;

  def cos(expr n) =
    cosd(n / pi * 180)
  enddef;

  def sin(expr n) =
    sind(n / pi * 180)
  enddef;

  daysInYear := 0;
  for i=0 step 1 until 11:
    daysInYear := daysInYear + daysInMonth[i];
  endfor;

  numeric dayCounter;
  dayCounter := 0;

  def calculateAngle(expr n) =
    (0.6 * n ** 0.7 + (sin(n * pi * 2 * 0.6 / daysInYear) * 4))
  enddef;

  for month=0 step 1 until 11:
    for dayInMonth=0 step 1 until daysInMonth[month] - 1:
      numeric angle;
      angle := calculateAngle(dayCounter + 2.0);

      pair P;
      P := (
        cos(angle - calculateAngle(2)) * (2 + angle),
        sin(angle - calculateAngle(2)) * (2 + angle)
      );

      if dayInMonth = 0:
        drawDay(P, monthLetters[month]);
      else:
        drawDay(P, ""&decimal dayInMonth);
      fi;

      dayCounter := dayCounter + 1;
    endfor;
  endfor;

  
endfig;

end;