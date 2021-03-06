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
unsigned char _PrtPthNum;
short _SafeZone;
long _IOBufPtr;
_vector _IOBufVec;
long ErrVec;
long POS;
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

/* LN:1 dim havis as label */
static long havis;
/* LN:2 dim array(10) as label */
static long array[10];
/* LN:3 type type1 */
/* LN:7 dim complex as type1 */
static short complex[4];
/* LN:8 dim complexarray(10) as type1 */
static short complexarray[40];
/* LN:9 dim longarray(10) as long */
static long longarray[10];

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

__asm__ __volatile__("l1:");
/* LN:13 longarray(5)=8 */
_a0=longarray;
_d0=0x5;
_d0--;
_d0=_d0*4;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=0x8;
*((long*)_TmpVec1._Ptr)=_d0;
/* LN:15 havis=l1 */
__asm__ __volatile__("_havis=l1");
/* LN:17 goto l1 */
__asm__ __volatile__("jmp l1");
/* LN:18 gosub l1 */
__asm__ __volatile__("call l1");
/* LN:20 goto [havis] */
__asm__ __volatile__("movl _havis,%eax");
__asm__ __volatile__("jmp *%eax");
/* LN:21 gosub [havis] */
__asm__ __volatile__("movl _havis,%eax");
__asm__ __volatile__("call *%eax");
/* LN:22 goto [array(7)] */
_a0=array;
_d0=0x7;
_d0--;
_d0=_d0*4;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("jmp *%eax");
/* LN:23 gosub [array(7)] */
_a0=array;
_d0=0x7;
_d0--;
_d0=_d0*4;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("call *%eax");
/* LN:24 goto [complex.label1] */
_a0=complex;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("jmp *%eax");
/* LN:25 gosub [complex.label2] */
_a0=complex;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+4;
(long)_TmpVec1._Ptr=_d0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("call *%eax");
/* LN:26 goto [complexarray(3).label1] */
_a0=complexarray;
_d0=0x3;
_d0--;
_d0=_d0*8;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("jmp *%eax");
/* LN:27 gosub [complexarray(3).label2] */
_a0=complexarray;
_d0=0x3;
_d0--;
_d0=_d0*8;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+4;
(long)_TmpVec1._Ptr=_d0;
_ArgSafe0=(long)_TmpVec1._Ptr;
__asm__ __volatile__("movl __ArgSafe0,%eax");
__asm__ __volatile__("call *%eax");
/* LN:29 array(5)=l1 */
_a0=array;
_d0=0x5;
_d0--;
_d0=_d0*4;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
__asm__ __volatile__("__TmpVec1=l1");
exit(0);
__asm__ __volatile__("_ErrExit:");
puts("Error Exit");
exit(errno);
}
