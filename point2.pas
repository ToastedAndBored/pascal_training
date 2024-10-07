program point2;
type
  itemp = ^item;
  item = record
    data: integer;
    next: itemp;
  end;
var
  first, last,tmp: itemp;
  n,i: integer;
begin
  first := nil;
  last := nil;
  while not SeekEOF do
  begin
    read(n);
    if first = nil then
    begin
      new(first);
      last := first
    end
    else
    begin
      new(last^.next);
      last := last^.next
    end;
    last^.data := n;
    last^.next := nil;
  end;
  for i := 1 to 2 do
  begin
    tmp := first;
    while tmp <> nil do
    begin
      writeln(tmp^.data);
      tmp := tmp^.next;
    end;
  end;
end.
