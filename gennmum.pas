program GenNumTxt;
const
  name = 'num.txt';
  start = 1000;
  step = 1001;
  count = 100;

var
  f: text;
  i,n: longint;
begin
  assign(f,name);
  rewrite(f);
  n:= start;
  for i := 1 to count do
  begin
    writeln(f,n);
    n := n+step
  end;
  close(f)
end.
