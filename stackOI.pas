program stackOfLInt;
type
  itemp = ^item;
  item = record
    data: longint;
    next: itemp;
  end;
  StackOfLInts = itemp;

procedure SOLInit(var stack: StackOfLInts);
begin
  stack := nil
end;

procedure SOLPush(var stack: StackOfLInts; var n: longint);
var
  tmp: itemp;
begin
  new(tmp);
  tmp^.data := n;
  tmp^.next := stack;
  stack := tmp
end;

procedure SOLPop(var stack: StackOfLInts; var n: longint);
var
  tmp: itemp;
begin
  n :=stack^.data;
  tmp := stack;
  stack := stack^.next;
  dispose(tmp)
end;

function SOLIsEmpty(var stack: StackOfLInts) : boolean;
begin
  SOLIsEmpty := stack = nil
end;

var
  s: StackOfLInts;
  n: longint;

begin
  SOLInit(s);
  while not SeekEOF do
  begin
    read(n);
    SOLPush(s,n);
  end;
  while not SOLIsEmpty(s) do
  begin
    SOLPop(s,n);
    writeln(n)
  end
end.
