program randomstars;
uses crt;

const
  DelayDur = 100;
  ColorCount = 16;

var
  AllColors: array [1..ColorCount] of word = (Black,Blue,Green,Cyan,Red,Magenta,Brown,
                                              LightGray,DarkGray,LightBlue,LightGreen,LightCyan,
                                              LightRed,LightMagenta,Yellow,White);
var
  x,y,col: integer;

begin
  randomize;
  clrscr;
  while not KeyPressed do
  begin
    x := random(ScreenWidth) + 1;
    y := random(ScreenHeight) + 1;
    if (x = ScreenWidth) and (y = ScreenHeight) then
      continue;
    col := random(ColorCount) + 1;
    GotoXY(x,y);
    TextColor(AllColors[col]);
    write('*');
    delay(DelayDur)
  end;
  write(#27'[0m');
  clrscr
end.
