program hello;
uses crt;
const 
  Message = 'Hello \n World!';
procedure GetKey(var code: integer);
var
    c: char;
  begin
    c:= ReadKey;
    if c= #0 then
    begin
      c := ReadKey;
      code := -ord(c)
    end
    else
    begin
      code := ord(c)
    end
  end;
procedure ShowMessage(x,y: integer; msg: string);
begin
  GotoXY(x,y);
  writeln(msg);
  writeln(msg);
  GotoXY(1,1)
end;
procedure HideMessage(x,y: integer; msg: string);
var
  len,i: integer;
begin
  len := length(msg);
  GotoXY(x,y);
  for i:=1 to len do
    write(' ');
  GotoXY(1,1)
end;
procedure MoveMessage(var x,y: integer; msg: string; dx,dy: integer);
begin
    HideMessage(x,y,msg);
    x:= x + dx;
    y:= y + dy;
    if (x<1) then
      x := 1;
    if (y<1) then
      y := 1;
    ShowMessage(x,y,msg)
end;

var
  CurX, CurY, c: integer;
begin
  clrscr;
  CurX:= (ScreenWidth - length(Message)) div 2;
  CurY:= ScreenHeight div 2;
  ShowMessage(CurX,CurY,Message);
  while true do
  begin
    GetKey(c);
    if c>0 then
      break;
    case c of
      -75:
        MoveMessage(CurX,CurY,Message,-1,0);
      -77:
        MoveMessage(CurX,CurY,Message,1,0);
      -72:
        MoveMessage(CurX,CurY,Message,0,-1);
      -80:
        MoveMessage(CurX,CurY,Message,0,1);
    end
  end;
  clrscr
end.
