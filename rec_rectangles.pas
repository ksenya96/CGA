uses graphABC;
const n = 2;
var x1, y1, x2, y2: integer;

procedure square (x0, y0, a: integer; k: integer);
var x1, y1, x2, y2, x3, y3, qa, ha: integer;
begin
  x1 := x0;
  y1 := y0 - a;
  x2 := x1 + a;
  y2 := y1;
  x3 := x2;
  y3 := y0;
  rectangle (x0, y0, x2, y2);
  if k < n then
    begin
      qa := a div 4;
      ha := a div 2;
      Square (x0 - qa, y0 + qa, ha, k + 1);
      Square (x1 - qa, y1 + qa, ha, k + 1);
      Square (x2 - qa, y2+ qa, ha, k + 1);
      Square (x3 - qa, y3 + qa, ha, k + 1);
    end;
end;

begin
  square (300, 200, 100, 0);
end.