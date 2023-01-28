
{ Simple Sprites Demo }

program simplespritesdemo;

var clock,key,x,direction:integer;
label GameLoop; label ExitLoop;

{$i fabgl.inc} {FabGL Pascal Library}

FUNCTION inkey : integer;
begin
 if bios(1) = 255 then inkey := bios(2) else inkey :=0;
end;



{ Main Program }


begin;

{ Set Variables }

x:=0; clock:=0; direction:=0;

{ Set Resolution }

SCREEN('320x200x64'); Apply;
Cursor(0); CLS;

gotoXY(10,5);
writeln('Blinky is on the move!');
gotoXY(10,6);
writeln('    [ESC] to exit');


SPRITECOUNT(2);                  {Total Sprites}
SPRITEDEFRGB2(0,16,15);          {#,XSize,YSize}
SPRITEDATA('0000000000000000');
SPRITEDATA('0000004444000000');  {16 Color Data}
SPRITEDATA('0000444444440000');
SPRITEDATA('0004444444444000');
SPRITEDATA('004FF4444FF44400');
SPRITEDATA('00FFFF44FFFF4400');
SPRITEDATA('00CCFF44CCFF4400');
SPRITEDATA('04CCFF44CCFF4440');
SPRITEDATA('044FF4444FF44440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0440444004440440');
SPRITEDATA('0400044004400040');
SPRITEDATA('$');


SPRITEDEFRGB2(1,16,15);
SPRITEDATA('0000000000000000');
SPRITEDATA('0000004440000000');
SPRITEDATA('0000444444440000');
SPRITEDATA('0004444444444000');
SPRITEDATA('00444FF4444FF400');
SPRITEDATA('0044FFFF44FFFF00');
SPRITEDATA('0044FFCC44FFCC00');
SPRITEDATA('0444FFCC44FFCC40');
SPRITEDATA('04444FF4444FF440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0444444444444440');
SPRITEDATA('0440444004440440');
SPRITEDATA('0400044004400040');
SPRITEDATA('$');


spriteset(0,0,x,100);
spriteset(1,0,x,100);

{Main Loop}

GameLoop:

key:=inkey;
if key=27 then goto ExitLoop;

{Using SETSPRITE inside a small delay clock. }
{Prevents output commands from overunning    }
{the possible input of an ESC key to exit.   }

clock:=clock+1;
   if clock > 2 then begin
   if direction=0 then spriteset(0,1,x,100);
   if direction=1 then spriteset(1,1,x,100);
   if direction=0 then x:=x-1;
   if direction=1 then x:=x+1;
   clock:=0
   end;

{Determine limits and set movement direction.}

if x > 300 then spriteset(1,0,x+1,100);
if x > 300 then direction:=0;
if x < 1 then spriteset(0,0,x-1,100);
if x < 1 then direction:=1;

goto GameLoop;



{ Reset Cursor & Screen Resolution }
ExitLoop:

cursor(1);
SCREEN('512x384x64');
Apply;

end.





