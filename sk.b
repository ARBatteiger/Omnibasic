DIM TempInt AS LONG
DIM ExitButton AS BUTTON
DIM TestArray(17) AS BUTTON
DIM ComboBox AS COMBOBOX
DIM ComboBox2 AS COMBOBOX
DIM TextBox AS TEXTBOX
DIM Frame AS FRAME
DIM Frame2 AS FRAME
DIM StaticText1 AS STATICTEXT
DIM StaticText2 AS STATICTEXT
DIM StaticText3 AS STATICTEXT
DIM ListBox AS LISTBOX
DIM Slider AS SLIDER
DIM Spinner AS SPINNER
DIM ProgressBar AS PROGRESSBAR
DIM Calendar AS CALENDAR
DIM Header AS Header
DIM TreeView AS TREEVIEW
DIM TabFolder AS TABFOLDER
DIM ResultBox AS STATICTEXT
DIM ButtonListBox AS BUTTONLISTBOX
DIM ToolBar AS TOOLBAR
DIM StatusBar AS STATUSBAR
DIM CheckBox AS CheckBox
DIM RadioButton1 AS RADIOBUTTON
DIM RadioButton2 AS RADIOBUTTON
DIM RadioButton3 AS RADIOBUTTON
DIM RadioButton4 AS RADIOBUTTON
DIM RadioButton5 AS RADIOBUTTON
DIM RadioButton6 AS RADIOBUTTON
DIM RadioButton7 AS RADIOBUTTON
DIM RadioButton8 AS RADIOBUTTON
DIM RadioButton9 AS RADIOBUTTON
DIM RadioButton10 AS RADIOBUTTON
dim test1(10) as button
dim a$ as string*32
type junk
x as long
y as long
z as long
endtype
dim trash(10) as junk

OBMain_Load:
SETPOSITION OBMain,200,100,624,568
OBMain.TEXT="Innomation Systems, Inc."

a$="Combo"

CONSTRUCT ToolBar

Construct StatusBar

CONSTRUCT ExitButton
SETPOSITION ExitButton,550,480,64,32
ExitButton.TEXT="E&xit"

CONSTRUCT ComboBox
SETPOSITION ComboBox,10,40,80,100
ComboBox.TEXT=a$
ComboBox.BACKCOLOR=$ffc0c0
ComboBox.FORECOLOR=$ff0000

CONSTRUCT Header
SETPOSITION Header,10,80,80,20
Header.TEXT="Header"

CONSTRUCT TextBox
SETPOSITION TextBox,100,40,80,20
TextBox.TEXT="TextBox"
TextBox.BACKCOLOR=$800080
TextBox.FORECOLOR=$0000ff

CONSTRUCT StaticText1
SETPOSITION StaticText1,190,40,100,15
StaticText1.TEXT="StaticText1"
StaticText1.FORECOLOR=$0000ff

CONSTRUCT StaticText2
SETPOSITION StaticText2,190,55,100,15
StaticText2.TEXT="StaticText2"
StaticText2.FORECOLOR=$ff0000

CONSTRUCT StaticText3
SETPOSITION StaticText3,190,70,100,15
StaticText3.TEXT="StaticText3"
StaticText3.FORECOLOR=$ffffff

CONSTRUCT Slider
SETSTYLE Slider,TBS_NOTICKS,TRUE
SETPOSITION Slider,300,40,120,20
Slider.BACKCOLOR=$0080ff

CONSTRUCT ProgressBar
SETPOSITION ProgressBar,390,100,100,20
ProgressBar.BACKCOLOR=$0000ff
ProgressBar.FORECOLOR=$00ffff

CONSTRUCT CheckBox
SETPOSITION CheckBox,440,40,100,20
CheckBox.TEXT="CheckBox"
CheckBox.BACKCOLOR=$ff0000
CheckBox.FORECOLOR=$00ffff

CONSTRUCT Frame
SETPOSITION Frame,10,70,130,140
Frame.TEXT="BackColor"
Frame.FORECOLOR=$ff00ff

CONSTRUCT RadioButton1 IN Frame
SETPOSITION RadioButton1,5,30,100,20
RadioButton1.TEXT="Red"
RadioButton1.FORECOLOR=$0000ff

CONSTRUCT RadioButton2 IN Frame
SETPOSITION RadioButton2,5,50,100,20
RadioButton2.TEXT="Green"
RadioButton2.FORECOLOR=$00ff00

CONSTRUCT RadioButton3 IN Frame
SETPOSITION RadioButton3,5,70,100,20
RadioButton3.TEXT="Blue"
RadioButton3.FORECOLOR=$ff0000

CONSTRUCT RadioButton4 IN Frame
SETPOSITION RadioButton4,5,90,100,20
RadioButton4.TEXT="Black"
RadioButton4.FORECOLOR=$000000

CONSTRUCT RadioButton5 IN Frame
SETPOSITION RadioButton5,5,110,100,20
RadioButton5.TEXT="White"
RadioButton5.FORECOLOR=$ffffff

CONSTRUCT Frame2
SETPOSITION Frame2,10,230,130,140
Frame2.TEXT="ForeColor"
Frame2.FORECOLOR=$ff00ff
Frame2.VISIBLE=FALSE

CONSTRUCT RadioButton6 IN Frame2
SETPOSITION RadioButton6,5,30,100,20
RadioButton6.TEXT="Red"
RadioButton6.FORECOLOR=$0000ff

CONSTRUCT RadioButton7 IN Frame2
SETPOSITION RadioButton7,5,50,100,20
RadioButton7.TEXT="Green"
RadioButton7.FORECOLOR=$00ff00

CONSTRUCT RadioButton8 IN Frame2
SETPOSITION RadioButton8,5,70,100,20
RadioButton8.TEXT="Blue"
RadioButton8.FORECOLOR=$ff0000

CONSTRUCT RadioButton9 IN Frame2
SETPOSITION RadioButton9,5,90,100,20
RadioButton9.TEXT="Black"
RadioButton9.FORECOLOR=$000000

CONSTRUCT RadioButton10 IN Frame2
SETPOSITION RadioButton10,5,110,100,20
RadioButton10.TEXT="White"
RadioButton10.FORECOLOR=$ffffff

RadioButton3.CHECKED=TRUE
RadioButton9.CHECKED=TRUE
CheckBox.CHECKED=TRUE

CONSTRUCT TabFolder
SETPOSITION TabFolder,10,400,100,100

CONSTRUCT ResultBox
SETPOSITION ResultBox,10,502,200,20
ResultBox.BackColor=$0080ff
ResultBox.ForeColor=$00ffff

CONSTRUCT ListBox
SETPOSITION ListBox,150,100,100,100
ListBox.ADDITEM "Item1"
ListBox.ADDITEM "Item2"
ListBox.ADDITEM "Item3"
ListBox.ADDITEM "Item4"
ListBox.ADDITEM "Item5"
ListBox.ADDITEM "Item6"
ListBox.ADDITEM "Item7"
ListBox.ADDITEM "Item8"
ListBox.FORECOLOR=$ff0000

CONSTRUCT ButtonListBox
SETPOSITION ButtonListBox,150,220,100,100

CONSTRUCT Spinner
SETPOSITION Spinner,270,100,100,20
Spinner.BACKCOLOR=$0000ff

CONSTRUCT TreeView
SETPOSITION TreeView,510,100,100,100
TreeView.BACKCOLOR=$c000c0

CONSTRUCT ComboBox2
SETPOSITION  ComboBox2,510,65,100,100
ComboBox2.BACKCOLOR=$808080
ComboBox2.FORECOLOR=$ffffff

CONSTRUCT Calendar
SETPOSITION Calendar,270,140,200,150
ComboBox2.TEXT="Murphy"
ComboBox2.ADDITEM "Havis1"
ComboBox2.ADDITEM "Havis2"
ComboBox2.ADDITEM "Havis3"
ComboBox2.ADDITEM "Havis4"
ComboBox2.ADDITEM "Havis5"
ComboBox2.ADDITEM "Havis6"
ComboBox2.ADDITEM "Havis7"
ComboBox2.ADDITEM "Havis8"
ComboBox2.ADDITEM "Havis9"
ComboBox2.ADDITEM "Havis10"

ComboBox.ADDITEM "Item1"
ComboBox.ADDITEM "Item2"
ComboBox.ADDITEM "Item3"
ComboBox.ADDITEM "Item4"
ComboBox.ADDITEM "Item5"
ComboBox.ADDITEM "Item6"

RETURN

OBMain_Command:
;TextBox.TEXT="TextBox"
StaticText1.FORECOLOR=$00ffff
StaticText1.TEXT="Goober"
CheckBox.CHECKED=FALSE
SETSTYLE Slider,TBS_VERT,TRUE
SETPOSITION Slider,510,100,20,100
Slider.BACKCOLOR=$ff0000
'SETSTYLE TextBox,ES_CENTER,FALSE
'SETSTYLE TextBox,ES_RIGHT,TRUE
TextBox.BACKCOLOR=$00ffff
ExitButton.ENABLED=TRUE
TextBox.BACKCOLOR=$00ffff
RETURN

ExitButton.command
END
END EVENT

StaticText1.command
ResultBox.text="StaticText1 COMMAND"
Frame2.VISIBLE=TRUE
Frame.FORECOLOR=$0000ff
Frame2.FORECOLOR=$00ff00
ComboBox.text="Havis"
'gosub StaticText2_command
END EVENT

StaticText2.command
ResultBox.text="StaticText2  COMMAND"
TextBox.BACKCOLOR=$00ffff
TextBox.TEXT="Diana"
DESTROY ButtonListBox
END EVENT

StaticText3.command
ResultBox.text="StaticTest3 COMMAND"
TreeView.VISIBLE=FALSE
SETSTYLE Slider,TBS_VERT,TRUE
SETPOSITION Slider,510,100,20,100
Slider.BACKCOLOR=$ff0000
ProgressBar.VALUE=50
Slider.VALUE=30
END EVENT

TextBox.change
ResultBox.text="TextBox CHANGE"
ListBox.backcolor=$ff00ff
END EVENT

ComboBox.change
ResultBox.text="ComboBox CHANGE"
ListBox.backcolor=$00ff00
END EVENT

ComboBox.select
ResultBox.text="ComboBox SELECT"
ListBox.backcolor=$ffff00
END EVENT

ListBox.command
ResultBox.text="ListBox COMMAND"
ListBox.BackColor=$ffffff
END EVENT

Slider.hscroll
GOSUB GetPos
END EVENT

Slider.vscroll
GOSUB GetPos
END EVENT

GetPos:
ResultBox.text="Slider SCROLL"
+invoke SendMessage,[Slider],TBM_GETPOS,0,0
+mov [TempInt],eax
ProgressBar.VALUE=TempInt
RETURN

RadioButton1.command
TextBox.backcolor=$0000ff
ResultBox.text="RadioButton1 COMMAND"
END EVENT

RadioButton2.command
TextBox.backcolor=$00ff00
ResultBox.text="RadioButton2 COMMAND"
END EVENT

RadioButton3.command
TextBox.backcolor=$ff0000
ResultBox.text="RadioButton3 COMMAND"
END EVENT

RadioButton4.command
TextBox.backcolor=$000000
ResultBox.text="RadioButton4 COMMAND"
END EVENT

RadioButton5.command
TextBox.backcolor=$ffffff
ResultBox.text="RadioButton5 COMMAND"
END EVENT

RadioButton6.command
Slider.backcolor=$0000ff
ResultBox.text="RadioButton6 COMMAND"
END EVENT

RadioButton7.command
Slider.backcolor=$00ff00
ResultBox.text="RadioButton7 COMMAND"
END EVENT

RadioButton8.command
Slider.backcolor=$ff0000
ResultBox.text="RadioButton8 COMMAND"
END EVENT

RadioButton9.command
Slider.backcolor=$000000
ResultBox.text="RadioButton9 COMMAND"
END EVENT

RadioButton10.command
Slider.backcolor=$ffffff
ResultBox.text="RadioButton10 COMMAND"
END EVENT

CheckBox.command
ResultBox.text="CheckBox COMMAND"
END EVENT



