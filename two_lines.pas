uses graphABC, Points;
var A, B, C, D: TPoint;
    zA, zB, zC, zD: integer;
    x1, x2, x3, x4: integer;
    y1, y2, y3, y4: integer;
    
procedure GetCoeffs (p1, p2, p3, p4: TPoint; z3, z4: integer);
var a, b, c: integer;
begin
  a := p2.GetY - p1.GetY;
  b := p1.GetX - p2.GetX;
  c := -a * p1.GetX - b * p1.GetY;
  z3 := a * p3.GetX + b * p3.GetY + c;
  z4 := a * p4.GetX + b * p4.GetY + c;
end;

procedure Svap (var x, y: integer);
var w: integer;
begin
  if x > y then
    begin
      w := x;
      x := y;
      y := w;
    end;
end;

begin
  read (x1, y1, x2, y2, x3, y3, x4, y4);
  A := new TPoint (x1, y1, clBlack);
  B := new TPoint (x2, y2, clBlack);
  C := new TPoint (x3, y3, clBlack);
  D := new TPoint (x4, y4, clBlack);
  GetCoeffs (A, B, C, D, zC, zD);
  GetCoeffs (C, D, A, B, zA, zB);
  if (zA = 0) and (zB = 0) then
    begin      
      Svap (x1, x2);
      Svap (x3, x4);
      if (x2 < x3) or (x4 < x1) then
        writeln ('Не пересекаются')
      else
        if x1 <> x2 then
          writeln ('Пересекаются')
        else
          begin            
            Svap (y1, y2);
            Svap (y3, y4);
            if (y2 < y3) or (y4 < y1) then
                writeln ('Не пересекаются')
            else
              if y1 <> y2 then
                writeln ('Пересекаются')
          end;
    end
  else
    if (zA * zB <= 0) and (zC * zD <= 0) then
      writeln ('Пересекаются')
    else
      writeln ('Не пересекаются');
end.