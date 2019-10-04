uses graphABC;

var x1, y1, x2, y2: integer;
    found: boolean;
procedure KeyDown (Key: integer);
begin
  found := true;
end;

begin
  while not found do
    begin
      OnKeyDown := KeyDown;
      ClearWindow;
      x1 := random (WindowWidth);
      y1 := random (WindowHeight);
      x2 := random (WindowWidth);
      y2 := random (WindowHeight);
      pen.Color := clRandom;
      brush.Color := clRandom;
      rectangle (x1, y1, x2, y2);
      sleep (1000);
    end;
end.