program hello;
uses crt;
type 
  cell = (Void,X,O);
  map = array [0..2,0..2] of cell;

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

procedure GameLoop(var key:integer; var CurMap: map; var CurX,CurY: integer;
                  var play,turn:boolean);
begin
  case key of
    // TODO limit cursor movements
    -75:
      CurX:= CurX-1;
    -77:
      CurX := CurX + 1;
    -72:
      CurY := CurY - 1;
    -80:
      CurY := CurY + 1;
    113:
      play:= false;
    32:
    begin
      if CurMap[CurX][CurY] = Void then begin
        if turn then
          CurMap[CurX][CurY] := X;
        if not turn then
          CurMap[CurX][CurY] := O;
        turn := not turn;
      end;
    end;
  end;
  // TODO check for win
end;

procedure ShowGame(var CurMap: map; var CurX,CurY: integer);
var
  row,col: integer;
begin
  for row := 0 to 2 do begin
    for col := 0 to 2 do begin
      GotoXY((row*2)+2,(col*2)+2);
      if (row = CurX) and (col = CurY) then
        begin
        TextBackground(White);
        TextColor(Black);
        end;
      case CurMap[row][col] of
        X:
          write('X');
        O:
          write('O');
        Void:
          write(' ');
      end;
     TextColor(White);
     TextBackground(Black);
    end;
  end;
  // TODO Show current turn symbol
  writeln();
  writeln();
end;

procedure DrawBorders();
var
  row,col: integer;
begin 
  for row := 0 to 6 do begin
    for col := 0 to 6 do begin
      GotoXY(row+1,col+1);
      if (row mod 2 = 0) and (col mod 2 = 0) then
        write('+')
      else if col mod 2 = 0 then
        write('-')
      else
        write('|');
    end;
  end;
  writeln();
  writeln();
end;

var
  key:integer;
  CurMap: map;
  CurX,CurY: integer;
  i, j: integer;
  play,turn: boolean;
begin
  CurX := 1;
  CurY := 2;
  play := true;
  turn := true;
  clrscr;
  DrawBorders();
  ShowGame(CurMap,CurX,CurY);
  while play do begin
    GetKey(key);
    GameLoop(key,CurMap,CurX,CurY,play,turn);
    ShowGame(CurMap,CurX,CurY);
  end;
end.
