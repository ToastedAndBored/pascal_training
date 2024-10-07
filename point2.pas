program point2;
type
  itemp = ^item;
  item = record
    data: integer;
    next: itemp;
  end;
var
  first, tmp: itemp;
  n: integer;
begin
  first := nil;
  while not SeekEOF do
  begin
    read(n);
    new(tmp);
    tmp^.data := n;
    tmp^.next := first;
    first := tmp;
  end;
  //tmp := first;
  while tmp <> nil do
  begin
    writeln(tmp^.data);
    tmp := tmp^.next;
  end
end.
