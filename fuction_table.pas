uses GraphABC, Points;
const n = 800;
      a = -20;
      b = 20;
      h = (b - a) / n;
      eps = 1e-3;
      LeftWin = 150;
      TopWin = 20;
      WidthWin = 700;
      HeightWin = 700;
      
var x, y, y_pred: integer;
    t: array [1..n + 1] of TPoint;
    i, j: integer;
    kx, ky: real;
    x0, y0: integer;
    p: Picture;
     
function f(x: real): real;
begin
  f := exp ((1 / x) * ln (2));
end;

function D (x: real): boolean;
begin
  if abs (x) < eps then
    D := false
  else
    D := true;
end;

function maxy : real;
var max : real;
    i: integer;
begin
  max := t[1].GetY;
  for i := 2 to n + 1 do
    if (max > t[i].GetY) and (t[i].IsExist) then
      max := t[i].GetY;
  maxy := max;
end; 

function miny: real;
var min: real;
    i: integer;
begin
  min := t[1].GetY;
  for i := 2 to n + 1 do
    if (min < t[i].GetY) and (t[i].IsExist) then
      min := t[i].GetY;
  miny := min;
end;

procedure GetXY;
var i: integer;
    x: real;
begin
  i := 0;
  x := a;
  while x < b + eps do
    begin
      inc (i);
      if D (x) then
        begin
          t[i].SetX(x);
          t[i].SetY(f(x));
        end
      else
        t[i].SetExist (false);
      x := x + h;
    end;
end;

begin
  for i := 1 to  n + 1 do
    t[i] := new TPoint (0, 0);
    
  MaximizeWindow;
  
  p := new Picture ('funct.jpg');
  p.Draw (700, 10);
  GetXY;
  
  //вывод таблицы значений
  line (120, 0, 120, 350);
  line (120, 350, 0, 350);
  writeln ('   x                y');
  i := 1;
  while (i <= n + 1) do
    begin
      if t[i].IsExist then
        writeln (t[i].GetX:6:4, t[i].GetY:10:4);
      i := i + 40;
    end;
    
  line (0, 0, 120, 0);
  line (0, 16, 120, 16);
  line (50, 0, 50, 350);
    
  kx := WidthWin / (b - a);
  //ky := HeightWin / (2 * (maxy-miny));
  
  SetFontStyle (fsItalic);
  //начало координат
  x0 := LeftWin + WidthWin div 2;
  y0 := TopWin + HeightWin div 2;
  TextOut (x0 - 10, y0 + 5, '0');
  
  SetFontSize (15);
  
  //ось OY
  line (x0, y0 - HeightWin div 2, x0, y0 + HeightWin div 2);
  line (x0, y0 - HeightWin div 2, round (x0 - 10 * cos (pi / 4)), round ((y0 - HeightWin div 2) + 10 * sin (pi / 4)));
  line (x0, y0 - HeightWin div 2, round (x0 + 10 * cos (pi / 4)), round ((y0 - HeightWin div 2) + 10 * sin (pi / 4)));
  TextOut (x0 + 15, y0 - HeightWin div 2, 'y');
  
  //ось OX
  line (LeftWin, y0, x0 + WidthWin div 2, y0);
  line (x0 + WidthWin div 2, y0, round (x0 + WidthWin div 2 - 10 * cos (pi / 4)), round (y0 - 10 * sin (pi / 4)));
  line (x0 + WidthWin div 2, y0, round (x0 + WidthWin div 2 - 10 * cos (pi / 4)), round (y0 + 10 * sin (pi / 4)));
  TextOut (x0 + WidthWin div 2 - 5, y0 + 10, 'x');
  
  SetFontSize (10);
  //деления на оси OX
  x := round (x0);
  for i := 0 to b - 2 do
    begin
      line (x, y0, x, y0 + 5);
      line (x, y0, x, y0 - 5);
      if i <> 0 then
        TextOut (x - 4, y0 + 7, IntToStr (i));
      x := round (x + kx);
    end;
    
  x := round (x0);
  for i := 0 downto a + 1 do
    begin
      line (x, y0, x, y0 + 5);
      line (x, y0, x, y0 - 5);
      if i <> 0 then
        TextOut (x - 6, y0 + 7, IntToStr (i));
      x := round (x - kx);
    end;
  
  //деления на оси OY
  y :=  round (y0);
  j := 0;
  while (y < y0 + HeightWin div 2) do
    begin
      line (x0, y, x0 - 5, y);
      line (x0, y, x0 + 5, y);
      if j <> 0 then
        TextOut (x0 - 25, y - 7, IntToStr (j));
      dec (j);
      y := round (y + kx);
    end;
  
  y :=  round (y0);
  j := 0;
  while (y > y0 - HeightWin div 2) do
    begin
      line (x0, y, x0 - 5, y);
      line (x0, y, x0 + 5, y);
      if j <> 0 then
        TextOut (x0 - 25, y - 7, IntToStr (j));
      inc (j);
      y := round (y - kx);
    end;
    
  //построение графика 
  pen.color := clRed;
  pen.Width := 2;
  x := round (x0 + t[1].GetX * kx );
  y := round (y0 - t[1].GetY * kx );
  MoveTo (x, y);
  for i := 2 to n + 1 do
    begin
      x := round (x0 + t[i].GetX * kx );
      y := round (y0 - t[i].GetY * kx );
      y_pred := round (y0 - t[i - 1].GetY * kx );
      if (t[i - 1].IsExist) and (t[i].IsExist) and 
         (y > y0 - HeightWin div 2) and (y_pred > y0 - HeightWin div 2) then
        LineTo (x, y)
      else
        MoveTo (x, y);
    end;
   
  SetFontSize (15);
  TextOut (700, 500, 'Автор: Пиляк Ксения Юрьевна')
end.