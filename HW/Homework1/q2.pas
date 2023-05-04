program Passwords;
var str1, str2: string;
var list1, list2: array [0..25] of Integer;
var valid: boolean;
var i: Integer;

procedure makeHistogram(var list: array of Integer; var str: string);
begin
    for i := 1 to Length(str) do
    begin
        list[ord(str[i])-97] := list[ord(str[i])-97] + 1; 
    end;
end;

function compareLists(var list1: array of Integer; var list2: array of Integer): boolean;
begin
    compareLists := True;
    for i := 0 to 25 do
    begin
        if((list1[i] > 0) and (list2[i] > 0)) then compareLists := FALSE;
    end;
end;

begin
    ReadLn(str1);
    ReadLn(str2);
    for i := 0 to 25 do
    begin
        list1[i] := 0;
        list2[i] := 0;
    end;    
    makeHistogram(list1, str1);
    makeHistogram(list2, str2);
    valid := compareLists(list1, list2);
    if(valid) then writeLn('TRUE')
    else writeLn('FALSE');
    for i := 0 to 25 do
    begin
        if(list1[i] + list2[i] > 0) then writeLn(chr(97+i), ' ', list1[i] + list2[i]);
    end;
end.