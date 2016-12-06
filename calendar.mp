u := .2cm;

numeric daysInMonth[];
daysInMonth[0] = 31;
daysInMonth[1] = 28; % Set this to 29 and recompile to make a leap year version
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

  %%%%%% Helper functions
  def makeGrayColor(expr v) =
    (v, v, v)
  enddef;

  def cos(expr n) =
    cosd(n / pi * 180)
  enddef;

  def sin(expr n) =
    sind(n / pi * 180)
  enddef;

  def pointAlongPath(expr t, path) =
    (point (arctime (t * arclength path) of path) of path)
  enddef;



  def drawDay(expr z, text) =
    draw unitsquare scaled u shifted z withpen pencircle scaled .3pt withcolor makeGrayColor(.8);
    label(text, origin) scaled 0.4 shifted (z + (.5u, .5u)) withcolor makeGrayColor(.8);
  enddef;

  

  daysInYear := 0; % We can't hard code this b/c of leap years
  for i=0 step 1 until 11:
    daysInYear := daysInYear + daysInMonth[i];
  endfor;

  path spiralPath;
  spiralPath = (20, 0); % Initial point

  for i=1 step 1 until 400:
    numeric angle, f;
    angle := 0.1 * i;
    f := (20 + 4 * angle);

    spiralPath := spiralPath--(f * cos(angle), f * sin(angle));
  endfor;
  
  dayCounter := 0;
  for month=0 step 1 until 11:
    for dayInMonth=0 step 1 until daysInMonth[month] - 1:
      if dayInMonth = 0:
        drawDay(pointAlongPath(dayCounter/daysInYear, spiralPath), monthLetters[month]);
      else:
        drawDay(pointAlongPath(dayCounter/daysInYear, spiralPath), decimal (dayInMonth + 1));
      fi;

      dayCounter := dayCounter + 1;
    endfor;
  endfor;
endfig;
end;