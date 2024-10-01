program GenNumBin;
const
  name = 'nums.bin';
  start = 1000;
  step = 1001;
  count = 100;

var
  f: file of longint;
  i,n: longint;
begin
  assign(f,name);
  rewrite(f);
  n := start;
  for i := 1 to count do
  begin
    write(f,n);
    n := n+step
  end;
  close(f)
end.
