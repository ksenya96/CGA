uses graphABC;

const n = 1000;
      df = 3 * pi/n;
      leaf = 8;
      s_leaf = 1/2;
      
procedure Flower (x0, y0, R: integer; c: color);
var f: real;
    x, y: integer;
    R_min: integer;
begin
  f := 0;
  x := round (x0 + (R + s_leaf * R * sin (leaf * f)) * cos (f));
  y := round (y0 - (R + s_leaf * R * sin (leaf * f)) * sin (f));
  MoveTo (x, y);
  pen.Color := c;
  while (f < 2 * pi) do
    begin
      f := f + df;
      x := round (x0 + (R + s_leaf * R * sin (leaf * f)) * cos (f));
      y := round (y0 - (R + s_leaf * R * sin (leaf * f)) * sin (f));
      LineTo (x, y, c);      
    end;
  FloodFill (x0, y0, c);
  R_min := round (R - s_leaf * R);
  brush.Color := clYellow;
  circle (x0, y0, R_min);
end;

var i: integer;
begin
  for i := 1 to 20 do
    Flower (random (WindowWidth), random (WindowHeight) , 50, clRandom);

end.