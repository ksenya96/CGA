unit Points;
uses GraphABC;
type 
    TPoint = class
      private
        x, y: real;
        col: color;
        exist: boolean;
      public
        constructor Create (x0, y0: real);
        procedure SetX (x0: real);
        function GetX: real;
        procedure SetY (y0: real);
        function GetY: real;
        procedure SetExist (exist0: boolean);
        function IsExist: boolean;
        //procedure Show;
        //procedure Hide;
      end;
      
constructor TPoint.Create (x0, y0: real);
begin
  x := x0;
  y := y0;
  col := clBlack;
  exist := true;
end;

procedure TPoint.SetX (x0: real);
begin
  x := x0;
end;

function TPoint.GetX: real;
begin
  GetX := x;
end;

procedure TPoint.SetY (y0: real);
begin
  y := y0;
end;

function TPoint.GetY: real;
begin
  GetY := y;
end;

procedure TPoint.SetExist (exist0: boolean);
begin
  exist := exist0;
end;

function TPoint.IsExist: boolean;
begin
  IsExist := exist;
end;

{procedure TPoint.Show;
begin
  SetPixel (x, y, col);
end;

procedure TPoint.Hide;
begin
  Setpixel (x, y, clWhite);
end;}

end.