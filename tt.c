/*Compiler Declaration and Variable Section*/

typedef struct {
void *_Ptr;
long _Len;
void *_Lnk;
} _vector;

typedef struct {
void *_BufPtr;
long _BufSiz;
} _buffer;

typedef struct {
long _Limit;
long _Step;
} _loopvec;

void _TrmStr();
void _PrtUsing();
void _ReadBool();
void _ReadByte();
void _ReadShort();
void _ReadLong();
void _ReadFlt();
void _ReadStr();
void _MovArg();
void _MovStr();
long _CmpStr();
long _StrLen();
long _SubStr();
void _MidStr();
void _LeftStr();
void _RightStr();
void _ClrConv();
double _AtoD();
long _AtoL();
void _ZLtoH();
void _ZLtoA();
void _LtoA();
void _DtoA();
void _LtoH();
void _PrintStr();
void _PrintTab();
void _InpData();
void _BtoA();
void _LCase();
void _UCase();
void _Remnant();

#define _BufSize 300
#include "basic.h"

long _d2;
long _PUArgs[15];
int _ArgCount;
long _ArgList;
long _ArgNum;
char _TestByte;
char _Prompt;
char _NewLine;
char _CRLF[2];
long STATUS;
jmp_buf _ebuf;
time_t _t;
struct tm *_systime;
long _ErrFlag;
unsigned char *_Poker;
void *_SrcAddr;
void *_DestAddr;
long _BlkCnt;
long _DummyArg;
long XferCount;
void *_XferAddr;
short _Digits;
short _Decimals;
long _ArgSafe0;
long _ArgSafe1;
float _FltArgSafe0;
float _FltArgSafe1;
long _SwitchInt;
_vector _SwitchStr;
double _DblArgSafe0;
double _DblArgSafe1;
unsigned char _IOPthNum;
FILE *_FilePtr;
unsigned char _PrtPthNum;
short _SafeZone;
long _IOBufPtr;
_vector _IOBufVec;
long POS;
int MX;
int MY;
int KM;
_vector _PBufVec;
unsigned char *_DataPtr;
unsigned char *_DataPtrSaf;
unsigned char _True;
char _ConvBuf[22];
char _ConvBuf1[22];
char ProgramName[40];
_vector _CBufVec;
_vector _CBuf1Vec;
char _NullStr[2];

char _IOBuffer[_BufSize];
char _PrintBuf[_BufSize];

static long _LoopCtr[10];

/*User Declaration and Variable Section*/

/*Temporary Vector*/
static _vector _TmpVec1;

/* LN:1  dim x:real */
static double x;

/*Temporary String Variable*/
static unsigned char _StrTmp1[22];

static char _StrConst1[]="True";
static char _StrConst2[]="False";

/*Code Section*/

main(argc,argv)
int argc;
char *argv[];
{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
register void *_a0;

/*Initialize Variables*/
_a0=_ConvBuf;
_CBufVec._Ptr=_a0;
_CBufVec._Len=22;
_CBufVec._Lnk=0;
_a0=_ConvBuf1;
_CBuf1Vec._Ptr=_a0;
_CBuf1Vec._Len=22;
_CBuf1Vec._Lnk=0;
_a0=_PrintBuf;
_PBufVec._Ptr=_a0;
_PBufVec._Len=300;
_PBufVec._Lnk=0;
_a0=_IOBuffer;
_IOBufVec._Ptr=_a0;
_IOBufVec._Len=300;
_IOBufVec._Lnk=0;
/*Set ERROR Vector*/
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto ErrExit;
/*Initialize System Variables*/
_Digits=15;
_Decimals=2;
POS=0;
errno=0;
XferCount=0;
STATUS=0;
_CRLF[0]=0x0d;
_CRLF[1]=0x0a;
_NewLine=10;
_Prompt='?';
_ArgCount=argc;
_ArgNum=0;
_ArgList=(long)argv;
_TmpVec1._Ptr=ProgramName;
_TmpVec1._Len=28;
_TmpVec1._Lnk=0;
_MovArg(&_TmpVec1,_ArgList);

/* LN:2  x = 3.33 - 3.32 */
_d0f=3.33;
_d1f=3.32;
_d0f=_d0f-_d1f;
x=_d0f;
/* LN:3  print x */
_PrtPthNum=1;
_d0f=x;
_DtoA(_d0f);
_a0=_StrTmp1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=22;
_TmpVec1._Lnk=0;
_MovStr(&_TmpVec1,&_CBuf1Vec);
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:5  if x = 0.01 then */
_True=0;
_d0f=x;
_d1f=0.01;
if (_d0f == _d1f) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl1;
/* LN:6   print "True" */
_PrtPthNum=1;
_a0=_StrConst1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=5;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:7  else */
goto _Lbl2;
_Lbl1:;
/* LN:8   print "False" */
_PrtPthNum=1;
_a0=_StrConst2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=6;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:9  endif */
_Lbl2:;
exit(0);
ErrExit:;
puts("Error Exit");
exit(errno);
}

/*Function and Subroutine Section*/

