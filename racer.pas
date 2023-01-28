
{ Racer: Avoid Traffic                }
{ A=Right / D=Left / ESC=Exit         }
{                                     }
{ Requries sprite data in text files: }
{                                     }
{ CAR1.SPR & CAR2.SPR in same drive.  }


program Racer;


var x,i,epos,position,ch,clock:integer;
label gameloop; label exit;


{$i fabgl.inc}  {FabGL Pascal Library}


{Inkey function stolen from Z80Dad. Thanks!}

FUNCTION Inkey : integer;
begin
 if bios(1) = 255 then inkey := bios(2) else inkey :=0;
end;



begin
randomize;


SCREEN('320x200x64'); Apply;
CURSOR(0);


SPRITECOUNT(2);

SPRITEDEFRGB2(0,16,23);
SPRITEFILEDATA('CAR2.SPR');
SPRITESET(0,0,1,1);


SPRITEDEFRGB2(1,16,23);
SPRITEFILEDATA('CAR1.SPR');
SPRITESET(1,0,1,1);




BRUSH(0,255,0);
FILLRECT(1,1,70,200);
BRUSH(0,255,0);
FILLRECT(150,1,220,200);



i:=0;
epos:=random(65);
epos:=epos+70;
position:=100;
clock:=0;


spriteset(1,1,100,150);



GAMELOOP:


ch:=inkey;


if ch=100 then begin
  position:=position+4;
  spriteset(1,1,position,150);
  end;

if ch=97 then begin
  position:=position-4;
  spriteset(1,1,position,150);
  end;

{Keep player on the road}
if position > 130 then position:=130;
if position < 75 then position:=75;

{Exit Game}
if ch=27 then goto exit;


{A game clock to prevent flooding serial out.}

clock:=clock+1;
if clock > 50 then begin

   i:=i+4;
   if i > 260 then begin
   epos:=random(70);
   epos:=epos+65;
   i:=0;
   end;

   SPRITESET(0,1,epos,i);
   clock:=0;
   end;


goto GAMELOOP;




EXIT:
CURSOR(1);
spriteset(0,0,1,1);
spriteset(1,0,1,1);
screen('512x384x64'); Apply;
{delay(50);}
end.
