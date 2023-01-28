# FabGL-Turbo-Pascal-3-Library
Turbo Pascal 3 include library for FabGL Ansi Terminal

Insert into your own TP3 programs using <B> {$i fabgl.inc) </B>

Supports most of the graphics/sound FabGL Specific Terminal Sequences in Ansi Terminal.<BR>
Also supports the additional resolution/font change capability of Ansi Terminal Mod.

FabGL Terminal Sequences: http://www.fabglib.org/special_term_escapes.html <BR>

  Commands <B>SCREEN</B> & <B>APPLY</B> require Ansi Terminal Mods Version of Ansi Terminal.<BR>
Ansi Terminal Mods: https://github.com/eightbitswide/FabGL-AnsiTerminal-Mods-

* Adds a simple 16 color font definition.
* Adds the ability to load font data from code or external text file.
<BR><BR>
<I>Note: I'm a Turbo Pascal beginner.  While code has been tested to work, it is likely not optimized.</i>
<BR>
## Procedures:
<BR>

<B>SPRITECOUNT(X);</B>
<pre>
FabGL Sequence:
  ESC "_GSPRITECOUNT" count "$"

Parameters:
  count: number of sprites that will be defined by "SPRITEDEFRGB2"

Example:
  // allocates two sprites
  SPRITECOUNT(2);

</pre>
<B>SPRITEDEFRGB2(SpriteNumber,Width,Height)</B>
<pre>
FabGL Sequence:
  ESC "_GSPRITEDEF" spriteIndex ";" width ";" height ";"2"

Parameters:
  spriteIndex: sprite index (0...)
  width:       bitmap width
  height:      bitmap height
  format:
      "2" = Assumed bitmap format is 64 colors 
Example:
  // allocates one sprite and assign a 16x23 64 Color Sprite.
  SPRITECOUNT(1);
  SPRITEDEFRGB2(0,16,23);

Important Note:
This Command must be followed with either SPRITEDATA or SPRITEFILEDATA,
providing the expected data to the sprite being defined.

</pre>
<B>SPRITEDATA(DATA);</B>
<pre>
FabGL Sequence: (Sends the sprite data expected by SPRITEDEFRGB2 when not reading it from an external text file.)
  ;DATA

Parameters:
  0-F define 16 colors in the sprite as follows:
    * 0 = {Black}
    * 1 = {Grey}
    * 2 = {Light Grey}
    * 3 = {Pink}
    * 4 = {Red}
    * 5 = {Brown}
    * 6 = {Peach}
    * 7 = {Orange}
    * 8 = {Yellow}
    * 9 = {Green}
    * A = {Cyan}
    * B = {Light Blue}
    * C = {Blue}
    * D = {Magenta}
    * E = {Purple}
    * F = {White}
    * $ = {End of Sprite Data}

Example:
  // allocate one sprite, assign a 16x15 16 Color Sprite, sent from code.
  SPRITECOUNT(1);
  SPRITEDEFRGB2(0,16,15);    
  SPRITEDATA('0000000000000000');
  SPRITEDATA('0000004444000000');
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
  
  Important Note:
  Sprite data sent from code in this fashion must end with a SPRITEDATA('$'); to finish defining the sprite.
  
  </pre>
  <B>SPRITEFILEDATA('DATAFILE');</B>
<pre>
FabGL Sequence: (Sends the sprite data expected by SPRITEDEFRGB2 front an external text file.)
  ;DATA

Parameters:
  0-F define 16 colors in the sprite as follows:
    * 0 = {Black}
    * 1 = {Grey}
    * 2 = {Light Grey}
    * 3 = {Pink}
    * 4 = {Red}
    * 5 = {Brown}
    * 6 = {Peach}
    * 7 = {Orange}
    * 8 = {Yellow}
    * 9 = {Green}
    * A = {Cyan}
    * B = {Light Blue}
    * C = {Blue}
    * D = {Magenta}
    * E = {Purple}
    * F = {White}
    * $ = {End of Sprite Data}

Example:
  // allocate one sprite, assign a 16x15 16 Color Sprite, sent from code.
  SPRITECOUNT(1);
  SPRITEDEFRGB2(0,16,23);
  SRPITEFILEDATA('MYSPRITE.TXT');

Example Text File: (MYSPRITE.TXT) 
0002220000222000
0BBB88BBBB88BBB0
0BBB88BBBB88BBB0
1BBB88BBBB88BBB1
1BBB88BBBB88BBB1
1BBB88BBBB88BBB1
1BBB11111111BBB1
1BB1111111111BB1
0B111111111111B0
0B1B88BBBB88B1B0
0BBB88BBBB88BBB0
0B1B88BBBB88B1B0
0B1B88BBBB88B1B0
0B1B88BBBB88B1B0
1BBB88BBBB88BBB1
1BBB11111111BBB1
1BBB81111118BBB1
1BB88BBBBBB88BB1
1BB88BBBBBB88BB1
0BB88BBBBBB88BB0
0BB88BBBBBB88BB0
0BB88BBBBBB88BB0
0002000000002000

Important Note:
  Sending SPRITEDATA('$'); is not required.  Included in the routine.
  
  </pre>
<B>SPRITESET(SpriteNumber,Visible,X,Y)</B>
<pre>
FabGL Sequence:
  ESC "_GSPRITESET" spriteIndex ";" visible ";" frameIndex ";" X ";" Y "$"
  
Parameters:
  spriteIndex: sprite index (0...)
  visible:     "0" = hidden, "1" = visible
  X:           horizontal position
  Y:           vertical position

Example:
  // make sprite 0 visible at position 50,120 with first added bitmap
  SPRITESET(0,1,50,120);
  
</pre>
<B>SCREEN('DATA');</B>
<pre>
Specific to Ansi Terminal Mods which gives resolution and font control to your programs.

Parameters: (resolution)

     * 1280x768x2
     * 1024x720x4
     * 800x600x8
     * 720x520x16
     * 640x480@73x16
     * 640x480@60x16
     * 640x350x16
     * 512x384x64
     * 400x300x64
     * 320x200x64
     
Parameters: (font) 
     * Auto
     * VGA 4x6
     * VGA 5x7
     * VGA 5x8
     * VGA 6x8
     * VGA 6x9
     * VGA 6x10
     * VGA 6x12
     * VGA 6x13
     * VGA 7x13
     * VGA 7x14
     * VGA 8x8
     * VGA 8x9
     * VGA 8x13
     * VGA 8x14
     * VGA 8x16
     * VGA 8x19
     * VGA 9x15
     * VGA 9x18
     * VGA 10x20
     * BigSerif 8x14
     * BigSerif 8x16
     * Block 8x14
     * Broadway 8x14
     * Computer 8x14
     * Courier 8x14
     * LCD 8x14
     * Old English 8x16
     * Sans Serif 8x14
     * Sans Serif 8x16
     * Slant 8x14
     * Wiggly 8x16 

Example:
  // make resolution 320x200, 64 Colors with VGA 8x8 font and Apply.
  SCREEN('320x200x64');
  SCREEN('VGA 8x8');
  APPLY;

Important Note:
An APPLY command must be send to make the make the SCREEN changes happen.

</pre>
<B>APPLY;</B>
<pre>

Must be executed after use of the SCREEN command. 

</pre>

## Additional Commands:
  
  <B>PEN(RED,GREEN,BLUE);</B>
  <BR>
  <B>BRUSH(RED,GREEN,BLUE);</B>
  <BR>
    <B>RECT(X1,Y1,X2,Y2);</B>
  <BR>
    <B>FILLRECT(X1,Y1,X2,Y2);</B>
  <BR>
    <B>LINE(X1,Y1,X2,Y2);</B>
  <BR>
    <B>CURSOR(0/1);</B>
  <BR>
    <B>CLS;</B>
  <BR>
    <B>HOME;</B>
  <BR>
    <B>CLEAR;</B>
  <BR>
    <B>PLOT(X,Y);</B>
  <BR>
    <B>SCROLL<offsetX,offsetY);</B>
  <BR>
    <B>ELLIPSE(X1,Y1,WIDTH,HEIGHT);</B>
  <BR>
    <B>FILLELLIPSE(X1,Y1,WIDTH,HEIGHT);</B>
  <BR>
    <B>PLAY(WAVEFORM,FREQ,DURATION,VOLUME);</B>
  <BR>
    
