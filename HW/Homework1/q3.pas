program Safot;
var a, b, c, i : Integer;
var d : char;
function Pfunc(var a: Integer; b: Integer; c: Integer) : boolean;
begin
    if ((a*a+b*b) = c*c) then Pfunc := TRUE
    else Pfunc:= False;
end;

function Cfunc(var c: char; d: Integer) : char;
begin
    Cfunc := Chr(Ord(c) + d);
end;

function Gfunc(var a: Integer; b: Integer) : Integer;
begin
    if b<55 then Gfunc:=b
    else Gfunc:=Round(0.8 * b + 0.2 * a);
end;

type Return = record
    case returnType : char of
        'P' : (rP : boolean);
        'C' : (rC : char);
        'G' : (rG : Integer);
    end;

procedure print(var a: Return);
begin
    case a.returnType of
        'P': WriteLn(a.rP);
        'C': WriteLn(a.rC);
        'G': WriteLn(a.rG);
    end
end;

var arr: array [0..4] of char;
var returnArr: array [0..4] of Return;

begin
for i:=0 to 4 do
    begin
    ReadLn(arr[i]);
    end;
for i:=0 to 4 do
    begin
    if arr[i] = 'P' then
        begin
        ReadLn(a);
        ReadLn(b);
        ReadLn(c);
        returnArr[i].returnType := 'P';
        returnArr[i].rP := Pfunc(a, b, c);
        end;
    if arr[i] = 'C' then
        begin
        ReadLn(d);
        ReadLn(b);
        returnArr[i].returnType := 'C';
        returnArr[i].rC := Cfunc(d, b);
        end;
    if arr[i] = 'G' then
        begin
        ReadLn(a);
        ReadLn(b);
        returnArr[i].returnType := 'G';
        returnArr[i].rG := Gfunc(a, b);
        end;
    end;
for i:=0 to 4 do
    begin
    print(returnArr[4-i]);
    end;
end.