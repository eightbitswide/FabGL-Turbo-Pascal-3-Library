
{ Learning Demo }

program learningdemo;

{$U+} {Allow CTRL-C}

{ defines }

var crayon,x,i,j,k:integer;


{$i fabgl.inc} {FabGL Pascal Library}



{ Main Program }



begin;

{ Set Variables }

j:=100; k:=0; i:=0;

{ Set Resolution }

SCREEN('320x200x64'); Apply;

Cursor(0); CLS;


{ Drawing Loop }

for x := 1 to 10 do
    begin
     i:=i+10;
     crayon:=crayon+20;
     PEN(150,crayon,128);
     delay(50);
     HOME;
     LINE(i,j,k,i);
    end;


readln;
cursor(1);
SCREEN('512x384x64');
Apply;
end.





