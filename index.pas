uses Points, GraphABC, Lines;
const eps = 0.0001;
var a, b: TPoint;
    l: TLine;
    x1, y1, x2, y2: integer; 
    z1, z2: real;
    sign1, sign2: shortint;

function Dist (var a, b: TPoint): real;
begin
  Dist := sqrt(sqr(b.GetX - a.GetX) + sqr(b.GetY - a.GetY));
end;

function Sign (x: real): shortint;
begin
  if abs (x) < eps then
    Sign := 0
  else
    if x > 0 then
      Sign := 1
    else
      Sign := -1;
end;

begin
  read (x1, y1, x2, y2);
  a := new TPoint (x1, y1, clRed);
  //a.Show;
  b := new TPoint (x2, y2, clBlack);
  //b.Show;
  l := new TLine (6, 4, 0);
  
  z1 := l.GetA * x1 + l.GetB * y1 + l.GetC;
  z2 := l.GetA * x2 + l.GetB * y2 + l.GetC;
  
  sign1 := sign (z1);
  sign2 := sign (z2);
  
  if (sign1 = 0) then
    writeln ('Точка a лежит на прямой');
  if (sign2 = 0) then
    writeln ('Точка b лежит на прямой');
  if (sign1 = sign2) and (sign1 <> 0) then
    writeln ('Точки a и b лежат по одну сторону от прямой');
  if (sign1 <> sign2) then
    writeln ('Точки лежат по разные стороны от прямой');
end.