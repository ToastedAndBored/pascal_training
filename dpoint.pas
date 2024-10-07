program point;
type 
  itemp = ^item;
  item = record
    data: integer;
    next: itemp;
  end;
var
  tmp,first:itemp;
  n:integer;
begin
  first:= nil;
  while true do
  begin
    writeln('Напиши циферку ');
    read(n);
    if n = 0 then
    begin
      break;
    end;
    new(tmp);
    tmp^.data := n;
    tmp^.next : nil;
    if first <> nil then
      tmp^.next:= first
    else
      tmp^.next := nil;
    first := tmp;
  end;
  while true do
  begin
    writeln(first^.data);
    if first^.next = nil then
      break;
    first := first^.next;
  end;
end.
