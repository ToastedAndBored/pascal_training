program diamond;
var
  a,b,t,i:longint;
begin
  readln(a);
  while (a mod 2 = 0) or (a<0) do
    begin
      writeln('Напиши нечётное и положительное');
      readln(a)
    end;
  b:= a div 2;
  for t:= 1 to b+1 do
    begin
      for i:= 1 to b+1-t do
        write(' ');
      write('*');
      if t>1 then
        begin
          for i:= 1 to 2*t-3 do
            write(' ');
          write('*')
        end;
        writeln
    end;
  for t:= b downto 1 do
    begin
      for i:=1 to b+1-t do
        write(' ');
      write('*');
      if t>1 then
        begin
          for i:= 1 to t*2-3 do
            write(' ');
          write('*');
        end;
        writeln
    end
end.
