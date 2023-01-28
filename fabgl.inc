
{ FabGL Includes for Pascal }
{ Written BY Eightbitswide  }

{ string define types }

type Workstring=string[255];

type filename=string[255];
var textTmp:string[255];
var myfile:Text;

var datn:string[255];
var xjx:integer;


{ procedures }

procedure SPRITECOUNT(gsprcnt:integer); begin
 writeln (#27,'_GSPRITECOUNT',gsprcnt,'$');
end;

procedure SPRITEDEFRGB2(indxx,widt,heig:integer); begin
 write (#27,'_GSPRITEDEF',indxx,';',widt,';',heig,';2;');
end;

procedure SPRITESET(xdix,visa,xsp,ysp:integer); begin
 write (#27,'_GSPRITESET',xdix,';');
 if visa = 0 then write('H;');
 if visa = 1 then write('V;');
 write('0;',xsp,';',ysp,'$');
end;

procedure SCREEN(resolut:Workstring); begin
 write (#27,'_#',resolut,'$');
end;

procedure APPLY; begin
 write (#27,'_#APPLYSETTINGS$');
 delay(1200);
end;

procedure CLS; begin
 write (#27,'[2J',#27,'[H')
 ;
end;

procedure HOME; begin
 write (#27,'[H');
end;

procedure PEN(penrr,pengg,penbb:integer); begin
 write (#27,'_GPEN',penrr,';',pengg,';',penbb,'$');
end;

procedure BRUSH(brurr,brugg,brubb:integer); begin
 write (#27,'_GBRUSH',brurr,';',brugg,';',brubb,'$');
end;

procedure RECT(Rectx,recty,rectxx,rectyy:integer); begin
 write (#27,'_GRECT',rectx,';',recty,';',rectxx,';',rectyy,'$');
end;

procedure FILLRECT(frx,fry,frxx,fryy:integer); begin
 write (#27,'_GFILLRECT',frx,';',fry,';',frxx,';',fryy,'$');
end;

procedure LINE(gxx1,gyy1,gxx2,gyy2:integer); begin
 write (#27,'_GLINE',gxx1,';',gyy1,';',gxx2,';',gyy2,'$');
end;

procedure CURSOR(blinkybox:integer); begin
 write (#27,'_E',blinkybox,'$');
end;

procedure LOCATE(blinkyboxcol,blinkyboxrow:integer); begin
 write (#27,'_F',blinkyboxcol,';',blinkyboxrow,'$');
end;

procedure CLEAR; begin
 write (#27,'_GCLEAR$');
end;

procedure PLOT(pixelxx,pixelyy:integer); begin
 write (#27,'_GPIXEL',pixelxx,';',pixelyy,'$');
end;

procedure SCROLL(offsetX,offsetY:integer); begin
 write (#27,'_GSCROLL',offsetX,';',offsetY,'$');
end;

procedure ELLIPSE(ellx,elly,ellw,ellh:integer); begin
 write (#27,'_GELLIPSE',ellx,';',elly,';',ellw,';',ellh,'$');
end;

procedure FILLELLIPSE(fellx,felly,fellw,fellh:integer); begin
 write (#27,'_GFILLELLIPSE',fellx,';',felly,';',fellw,';',fellh,'$');
end;

procedure PLAY(waveform,freq,dur,vol:integer); begin
 write (#27,'_S',waveform,';',freq,';',vol,';',vol,'$');
end;


procedure SPRITEDATA(sprdata:Workstring); begin

{Convert Single Character Sprite Data to
 16 Color FabGL compatible Spirte Data.}

      for xjx := 1 to length(sprdata) do
      begin
        datn:=Copy(sprdata,xjx,1);
        if datn = '0' then write('00'); {Black}
        if datn = '1' then write('D5'); {Grey}
        if datn = '2' then write('AA'); {LGrey}
        if datn = '3' then write('F3'); {Pink}
        if datn = '4' then write('C3'); {Red}
        if datn = '5' then write('46'); {Brown}
        if datn = '6' then write('D7'); {Peach}
        if datn = '7' then write('C7'); {Orange}
        if datn = '8' then write('4F'); {Yellow}
        if datn = '9' then write('CC'); {Green}
        if datn = 'A' then write('BC'); {Cyan}
        if datn = 'B' then write('B8'); {LBlue}
        if datn = 'C' then write('B4'); {Blue}
        if datn = 'D' then write('B2'); {Magenta}
        if datn = 'E' then write('E1'); {Purple}
        if datn = 'F' then write('FF'); {White}
      end;

end;


procedure SPRITEFILEDATA(getfile:filename); begin
 Assign(myfile,getfile);
 Reset(myfile);
 repeat
   readln(myfile,textTmp);
   SPRITEDATA(textTmp);
 Until Eof(myfile);
 close(myfile);
 writeln('$');
end;


