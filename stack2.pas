program stack2;
type
  item2ptr = ^item2;
  item2 = record
    data: integer;
    prev,next: item2ptr;
  end;

var
  tmp,first,last,current: item2ptr;
  n: integer;

begin
  first := nil;
  last := nil;
  current := nil;
  while not SeekEOF do
  begin
    read(n);
    new(tmp);
    tmp^.prev := current;
    tmp^.next := current^.next;
    tmp^.data := n;
    if first = nil then
    begin
      first := tmp;
      current := tmp;
      last := tmp;
      continue;
    end;
    if current^.next = nil then
      last := tmp
    else
      current^.next^.prev := tmp;
    current^.next := tmp;
    current := tmp;
  end;
  while true do
  begin
    writeln(first^.data);
    if first^.next = nil then
      break;
    first := first^.next;
  end;
end.
