uses GraphABC;
const 
     deep = 10;
     k1 = 2/3;
     k2 = 2/3;
     df1 = pi/4;
     df2 = pi/4;
     
procedure Tree (x0, y0, d: integer; f: real; level: integer);
var x1, y1: integer;
begin
  x1 := trunc (x0 + d * cos (f));
  y1 := trunc (y0 - d * sin (f));
  line (x0, y0, x1, y1);
  if (level < deep) then
    begin
      Tree (x1, y1, trunc (k1 * d), f - df1, level + 1);
      Tree (x1, y1, trunc (k2 * d), f + df2, level + 1);
    end;
end;

begin
  Tree (300, 400, 100, pi/2, 0);
end.