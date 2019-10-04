uses graphABC;

const n = 1000;
      df = 3 * pi/n;
      leaf = 5;
      s_leaf = 1/2;
      d_alpha = pi / 8;

      
procedure Flower (x0, y0, R: integer; c: color; alpha: real);
var f: real;
    x, y: integer;
    R_min: integer;
begin
  f := alpha;
  x := round (x0 + (R + s_leaf * R * sin (leaf * f)) * cos (f + alpha));
  y := round (y0 - (R + s_leaf * R * sin (leaf * f)) * sin (f + alpha));
  MoveTo (x, y);
  pen.Color := c;
  //вращение
  while (f < 2 * pi + alpha) do
    begin
      f := f + df;
      x := round (x0 + (R + s_leaf * R * sin (leaf * f)) * cos (f + alpha));
      y := round (y0 - (R + s_leaf * R * sin (leaf * f)) * sin (f + alpha));
      LineTo (x, y, c);      
    end;
  FloodFill (x0, y0, c);
  R_min := round (R - s_leaf * R);
  brush.Color := clYellow;
  circle (x0, y0, R_min);
end;

var alp: real;
    x, y, R_max, dx, dy, R: integer;
begin
  LockDrawing;
  alp := 0;
  x := 300;
  y := 200;
  R := 50;
  R_max := round (R + s_leaf * R);
  dx := 5;
  dy := 5;
  while true do
    begin
      Flower (x, y , R, clRed, alp);
      redraw;
      sleep (50);
      Window.Clear;  
      alp := alp + d_alpha;
      //отражение
      if (x + dx + R_max > WindowWidth) or (x + dx - R_max < 0) then
        dx := - dx;
      if (y + dy + R_max > WindowHeight) or (y + dy - R_max < 0) then
        dy := - dy;
      x := x + dx;
      y := y + dy;
    end;
end.