unit Lines;
uses Points, graphABC;
type 
    TLine = class
      private
        a, b, c: real;
        col: color;
      public
        constructor Create (a0, b0, c0: real);
        procedure GetCoeffs (p1, p2: TPoint);
        procedure SetA (a0: real);
        function GetA: real;
        procedure SetB (b0: real);
        function GetB: real;
        procedure SetC (c0: real);
        function GetC: real;
    end; 
    
constructor TLine.Create (a0, b0, c0: real);
begin
  a := a0;
  b := b0;
  c := c0;
  col := clBlack;
end;

procedure TLine.GetCoeffs (p1, p2: TPoint);
begin
  a := p2.GetY - p1.GetY;
  b := p1.GetX - p2.GetY;
  c := -a * p1.GetX - b * p1.GetY;
end;

procedure TLine.SetA (a0: real);
begin
  a := a0;
end;

function TLine.GetA: real;
begin
  GetA := a;
end;

procedure TLine.SetB (b0: real);
begin
  b := b0;
end;

function TLine.GetB: real;
begin
  GetB := b;
end;

procedure TLine.SetC (c0: real);
begin
  c := c0;
end;

function TLine.GetC: real;
begin
  GetC := c;
end;
end.