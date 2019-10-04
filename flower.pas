uses graphABC, system;
const n = 12;
      n_del = 60;
      dphi = 2 * pi/n;
      dphi_del = 2 * pi / 60;
      xClock = 300;
      yClock = 200;
      rClock = 150;
      rNum = 12;
      kSmall = 2/3; //коэффициент уменьшения маленькой стрелки
      
procedure Flower (x0, y0, R: integer);
var x, y, h, w: integer;
    i: byte;
    phi, phi_del: real;
    num: string;
begin
  phi := pi/2;
                          //оформление часов
  brush.Color := clBrown;
  circle (x0, y0, r + 3 * rNum);
  brush.Color := clGoldenrod;
  for i := n downto 1 do
    begin
      x := round (x0 + (R  + 2 * rNum)* cos (phi));
      y := round (y0 - (R  + 2 * rNum) * sin (phi));
      circle (x, y, rNum);
      phi := phi + dphi;
    end;
  
  Brush.GradientSecondColor := clBrown;
  brush.Color := clBrown;
  Brush.Style := bsGradient;
  circle (x0, y0, R + rNum); //окружность часов

  for i := n downto 1  do    //расставление цифр
    begin
      pen.Width := 2;
      x := round (x0 + (R - 20) * cos (phi));
      y := round (y0 - (R - 20) * sin (phi));
      SetFontSize (20);
      Font.Style := (fsBoldItalic);
      Font.Color := clGold;
      SetBrushStyle (bsClear);
      
      num := IntToStr (i);
      h := TextHeight (num);
      w := TextWidth (num);
      TextOut (x - w div 2, y - h div 2, num); 
      
      SetBrushStyle (bsSolid);
      phi := phi + dphi;      
    end;
    
  phi_del := pi/2;           //расставление делений
  brush.Color := clGold;
  for i := n_del downto 1 do
    begin
      x := round (x0 + R * cos (phi_del));
      y := round (y0 - R * sin (phi_del));
      if i mod 5 <> 0 then
        circle (x, y, 2)
      else
        circle (x, y, 5);
      phi_del := phi_del + dphi_del;
    end;
  brush.Color := clBlack;
end;

procedure Arrows (x0, y0, r: integer);
var rBig, rSmall: integer;   //радиус большой и маленькой стрелки
    dl: DateTime;
    phi: real;
    x, y, h, m, s: integer;
    h_s, m_s, s_s: string;
begin
  dl := DateTime.Now;             //получение текущего времени
  rBig := rClock - rNum;
  rSmall := round (kSmall * rBig);
  h := dl.Hour;
  m := dl.Minute;
  s := dl.Second;
  
  h_s := IntToStr (h);            //преобразование параметров времени в строки
  if (h >= 0) and (h < 10) then
    h_s := '0' + h_s;
  m_s := IntToStr (m);
  if (m >= 0) and (m < 10) then
    m_s := '0' + m_s;
  s_s := IntToStr (s);
  if (s >= 0) and (s < 10) then
    s_s := '0' + s_s;
  TextOut(x0 - 50, y0 + 45, h_s + ':' + m_s + ':' + s_s);  //вывод электронных часов
  
  pen.Color := clBlack;      //минутная стрелка
  pen.Width := 7;
  phi := pi / 2 - (m + s / 60) * (2 * pi / 60);
  x := round (x0 + rBig * cos (phi));
  y := round (y0 - rBig * sin (phi));
  line (x0, y0, x, y);
  
  
  pen.Width := 7;         //часовая стрелка
  phi := pi / 2 - (h + m / 60) * (2 * pi / 12);
  x := round (x0 + rSmall * cos (phi));
  y := round (y0 - rSmall * sin (phi));
  line (x0, y0, x, y);
  
  pen.Width := 2;          //секундная стрелка
  pen.Color := clRed;
  phi := pi / 2 - s * 2 * pi / 60;
  x := round (x0 + rBig * cos (phi));
  y := round (y0 - rBig * sin (phi));
  line (x0, y0, x, y);

  circle (x0, y0, 10);    
  brush.Color := clBlack;
  pen.Color := clBlack;
  redraw;
end;

begin
  Flower (xClock, yClock, rClock);
  Arrows (xClock, yClock, rClock);
  while true do
    begin
      LockDrawing;
      Flower (xClock, yClock, rClock);
      Arrows (xClock, yClock, rClock);
      ClearWindow;
    end;
end.