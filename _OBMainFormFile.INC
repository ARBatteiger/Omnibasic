SETPOSITION OBMain,340,150,640,480
OBMain.TEXT="OBMain"
OBMain.BACKCOLOR=$c8d0d4
DIM OBLogFont AS LOGFONT
DIM OBFont AS FONT
DIM OBButton1 AS OBButton
CREATE OBButton1,410,340,130,20,DEFAULT+FLAT TEXT="Flat Button"
OBButton1.BACKCOLOR=$ffff
OBButton1.FORECOLOR=$80
OBButton1.TOOLTIP="Flat Button"
DIM OBBitmap1 AS BITMAP
CREATE OBBitmap1,C:\NB\_PAINT.BMP
OBButton1.BITMAP=OBBitmap1
DIM OBButton2 AS OBButton
CREATE OBButton2,410,370,130,20 TEXT="Havis"
OBButton2.BACKCOLOR=$ff0000
OBButton2.FORECOLOR=$ffffff
DIM OBBitmap2 AS BITMAP
CREATE OBBitmap2,C:\NB\_PASTE.BMP
OBButton2.BITMAP=OBBitmap2
DIM Button1 AS BUTTON
CREATE Button1,410,400,90,20 TEXT="Plain"
DIM OBButton(20) AS OBButton
CREATE OBButton(1),10,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap3 AS BITMAP
CREATE OBBitmap3,C:\NB\_OPEN.BMP
OBButton(1).BITMAP=OBBitmap3
CREATE OBButton(2),40,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap4 AS BITMAP
CREATE OBBitmap4,C:\NB\_OPEN.BMP
OBButton(2).BITMAP=OBBitmap4
CREATE OBButton(3),70,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap5 AS BITMAP
CREATE OBBitmap5,C:\NB\_OPEN.BMP
OBButton(3).BITMAP=OBBitmap5
CREATE OBButton(4),100,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap6 AS BITMAP
CREATE OBBitmap6,C:\NB\_OPEN.BMP
OBButton(4).BITMAP=OBBitmap6
CREATE OBButton(5),130,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap7 AS BITMAP
CREATE OBBitmap7,C:\NB\_OPEN.BMP
OBButton(5).BITMAP=OBBitmap7
CREATE OBButton(6),160,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap8 AS BITMAP
CREATE OBBitmap8,C:\NB\_OPEN.BMP
OBButton(6).BITMAP=OBBitmap8
CREATE OBButton(7),190,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap9 AS BITMAP
CREATE OBBitmap9,C:\NB\_OPEN.BMP
OBButton(7).BITMAP=OBBitmap9
CREATE OBButton(8),220,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap10 AS BITMAP
CREATE OBBitmap10,C:\NB\_OPEN.BMP
OBButton(8).BITMAP=OBBitmap10
CREATE OBButton(9),250,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap11 AS BITMAP
CREATE OBBitmap11,C:\NB\_OPEN.BMP
OBButton(9).BITMAP=OBBitmap11
CREATE OBButton(10),280,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap12 AS BITMAP
CREATE OBBitmap12,C:\NB\_OPEN.BMP
OBButton(10).BITMAP=OBBitmap12
CREATE OBButton(11),310,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap13 AS BITMAP
CREATE OBBitmap13,C:\NB\_OPEN.BMP
OBButton(11).BITMAP=OBBitmap13
CREATE OBButton(12),340,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap14 AS BITMAP
CREATE OBBitmap14,C:\NB\_OPEN.BMP
OBButton(12).BITMAP=OBBitmap14
CREATE OBButton(13),370,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap15 AS BITMAP
CREATE OBBitmap15,C:\NB\_OPEN.BMP
OBButton(13).BITMAP=OBBitmap15
CREATE OBButton(14),400,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap16 AS BITMAP
CREATE OBBitmap16,C:\NB\_OPEN.BMP
OBButton(14).BITMAP=OBBitmap16
CREATE OBButton(15),430,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap17 AS BITMAP
CREATE OBBitmap17,C:\NB\_OPEN.BMP
OBButton(15).BITMAP=OBBitmap17
CREATE OBButton(16),460,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap18 AS BITMAP
CREATE OBBitmap18,C:\NB\_OPEN.BMP
OBButton(16).BITMAP=OBBitmap18
CREATE OBButton(17),490,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap19 AS BITMAP
CREATE OBBitmap19,C:\NB\_OPEN.BMP
OBButton(17).BITMAP=OBBitmap19
CREATE OBButton(18),520,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap20 AS BITMAP
CREATE OBBitmap20,C:\NB\_OPEN.BMP
OBButton(18).BITMAP=OBBitmap20
CREATE OBButton(19),550,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap21 AS BITMAP
CREATE OBBitmap21,C:\NB\_OPEN.BMP
OBButton(19).BITMAP=OBBitmap21
CREATE OBButton(20),580,10,20,20,DEFAULT+FLAT TEXT=""
DIM OBBitmap22 AS BITMAP
CREATE OBBitmap22,C:\NB\_OPEN.BMP
OBButton(20).BITMAP=OBBitmap22
DIM OBButton4 AS OBButton
CREATE OBButton4,10,40,590,20 TEXT=""
OBButton4.TOOLTIP="Test Tooltip"
DIM StaticText1 AS STATICTEXT
CREATE StaticText1,410,310,130,20 TEXT=""
StaticText1.BACKCOLOR=$ff00
DIM OBButton5 AS OBButton
CREATE OBButton5,30,290,120,20 TEXT="OBButton5"
DIM OBButton6 AS OBButton
CREATE OBButton6,30,320,120,20,DEFAULT+FLAT TEXT="OBButton6"
DIM OBButton7 AS OBButton
CREATE OBButton7,30,350,120,20 TEXT="OBButton7"
DIM OBButton8 AS OBButton
CREATE OBButton8,10,70,610,210 TEXT="OBButton8"
DIM OBButton9 AS OBButton
CREATE OBButton9,190,290,140,110 TEXT="Text"
OBButton9.BACKCOLOR=$ff8000
OBLogFont.lfHeight=-19
OBLogFont.lfWidth=0
OBLogFont.lfEscapement=0
OBLogFont.lfOrientation=0
OBLogFont.lfWeight=700
OBLogFont.lfItalic=0
OBLogFont.lfUnderline=0
OBLogFont.lfStrikeOut=0
OBLogFont.lfCharSet=0
OBLogFont.lfOutPrecision=3
OBLogFont.lfClipPrecision=2
OBLogFont.lfQuality=1
OBLogFont.lfPitchAndFamily=66
OBLogFont.lfFaceName="Old English Text MT"
CREATE OBFont,OBLogFont
OBButton9.FONT=OBFont
DIM OBBitmap23 AS BITMAP
CREATE OBBitmap23,C:\NB\_SPELL.BMP
OBButton9.BITMAP=OBBitmap23
DIM DP1 AS DRAWPROGRESS
CREATE DP1,560,300,40,140 TEXT="DP1"
