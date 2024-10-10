program deque;
type
  LongItem2p = ^LongItem2;
  LongItem2 = record
    data: longint;
    prev,next: LongItem2p;
  end;

  longDeque = record
    first,last:LongItem2p;
  end;

procedure LongDequeInit(var deque: LongDeque);
begin
  deque.first := nil;
  deque.last := nil;
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
  tmp: LongItem2p;
begin
  new(tmp);
  tmp^.data := n;
  tmp^.prev := nil;
  tmp^.next := deque.first;
  if deque.first = nil then
    deque.last := tmp
  else
    deque.first^.prev := tmp;
  deque.first := tmp;
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var
  tmp: LongItem2p;
begin
  new(tmp);
  tmp^.data := n;
  tmp^.next := nil;
  tmp^.prev := deque.last;
  if deque.last = nil then
    deque.first := tmp
  else
    deque.last^.next := tmp;
  deque.last := tmp;
end;

procedure LongDequePopFront(var deque: LongDeque; var n: longint);
var
  tmp: LongItem2p;
begin
  if deque.first <> nil then
  begin
    n := deque.first^.data;
    tmp := deque.first;
    deque.first := deque.first^.next;
    if deque.first = nil then
      deque.last := nil
    else
      deque.first^.prev := nil;
    dispose(tmp);
  end;
end;

procedure LongDequePopBack(var deque: LongDeque; var n: longint);
var
  tmp: LongItem2p;
begin
  if deque.last <> nil then
  begin
    n := deque.last^.data;
    tmp := deque.last;
    deque.last := deque.last^.prev;
    if deque.last <> nil then
      deque.last^.next := nil
    else
      deque.first := nil; ;
    dispose(tmp);
  end;
end;


function LongDequeIsEmpty(var deque: LongDeque) : boolean;
begin
  LongDequeIsEmpty := (deque.first = nil);
end;


var
  deq: LongDeque;
  n, pp: longint;
begin
  LongDequeInit(deq);

  while not SeekEof do
  begin
    read(n);
    LongDequePushBack(deq, n);
  end;
  while not LongDequeIsEmpty(deq) do
  begin
    if not LongDequeIsEmpty(deq) then
    begin
      LongDequePopFront(deq, pp);
      writeln('Popped from front: ', pp);
    end;
    if not LongDequeIsEmpty(deq) then
    begin
      LongDequePopBack(deq, pp);
      writeln('Popped from back: ', pp);
    end;
  end;
end.

