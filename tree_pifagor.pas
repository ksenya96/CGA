uses GraphABC;
const 
     deep = 15;
     k1 = sqrt (2)/2;
     k2 = sqrt (2)/2;
     df1 = pi/4;
     df2 = pi/4;
     
procedure Tree (x0, y0, d: integer; f: real; level: integer);
var x1, y1, x2, y2, x3, y3: integer;
begin
  x1 := trunc (x0 + d * cos (f));
  y1 := trunc (y0 - d * sin (f));
  x2 := trunc (x0 + d * sin (f));
  y2 := trunc (y0 + d * cos (f));
  x3 := trunc (x2 + d * cos (f));
  y3 := trunc (y2 - d * sin (f));
  line (x0, y0, x1, y1);
  line (x1, y1, x3, y3);
  line (x3, y3, x2, y2);
  line (x2, y2, x0, y0);
  if (level < deep) then
    begin
      Tree (trunc (x1 + d * k1 * sin (f + df1)), trunc (y1 + d * k1 * cos (f + df1)), trunc (k1 * d), f - df1, level + 1);
      Tree (x1, y1, trunc (k2 * d), f + df2, level + 1);
    end;
end;

begin
  Tree (300, 400, 100, pi/2, 0);
end.