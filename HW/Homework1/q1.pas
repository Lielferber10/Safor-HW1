program PascalTriangle;

var m: Integer;
function Factorial(n: qword): qword;
begin
    if n=0 then 
    Factorial := 1
    else
    Factorial := n * Factorial(n - 1);
end;


procedure constructLine(var line: array of Integer; i: Integer);
begin
    for m := 0 to i-1 do
    begin
        line[m] := Round(Factorial(i-1) / (Factorial(m) * Factorial(i-1-m)));
    end;
end;

var j: Integer;
procedure printLine(var line: array of Integer; i: Integer);
begin
  for j := 0 to i-2 do
  begin
    if (j=i-1) then Write(line[j])
    else Write(line[j], ' ');
  end;
  WriteLn(line[i-1]);
end;


var n: integer;
var i: integer;
var line: array [0..14] of Integer;

begin
for i := 0 to 14 do
    begin
        line[i] := 0;
    end;
ReadLn(n);
for i := 1 to n do
    begin
        constructLine(line, i);
        printLine(line ,i);
    end;
end.
