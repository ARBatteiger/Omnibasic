;Compiler Delaration Section

format PE console

entry _Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=300
; End of Declaration Section
section '.data' data readable writeable

align 4

ERR dd 0
_ErrVec dd 0
STATUS dd 0
POS dd 0
XferCount dd 0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
_ErrExitMsg db 'Error exit',0
align 4
_IOBuffer dd _IOBuffer+12
 dd 300
 dd 0
 rb 300
align 4
_PrintBuf dd _PrintBuf+12
 dd 300
 dd 0
 rb 300
align 4
_NullStr dd _NullStr+12
 dd 1
 dd 0
 rb 1
align 4
_CRLF dd _CRLF+12
 dd 2
 dd 0
 rb 2
align 4
_Prompt dd _Prompt+12
 dd 1
 dd 0
 rb 1
align 4
_ConvBuf dd _ConvBuf+12
 dd 32
 dd 0
 rb 32
align 4
_ConvBuf1 dd _ConvBuf1+12
 dd 32
 dd 0
 rb 32
align 4
ProgramName dd ProgramName+12
 dd 28
 dd 0
 rb 28
align 4
_SwitchStr dd _SwitchStr+12
 dd 300
 dd 0
 rb 300
_StrConst1 db "true",0
_StrConst2 db "false",0
_StrConst3 db "true",0
_StrConst4 db "false",0
; End of Initialized Data Section

; Start of Uninitialized Data Section

align 4
_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_LoopCtr rd 10
_hInstance rd 1
_InHandle rd 1
_OutHandle rd 1
_IOPthNum rd 1
_XferAddr rd 1
_PUArgs rd 15
_ArgList rd 1
_ArgNum rd 1
_Poker rd 1
_DummyArg rd 1
_ArgSafe0 rd 1
_ArgSafe1 rd 1
_SwitchInt rd 1
_ByteCounter rd 1
_PrtPthNum rd 1
_DataPtr rd 1
_Decimals rw 1
_Digits rw 1

align 4

; LN:1 dim x as long
align 4
x rd 1
q equ x
; LN:2 dim b as boolean
b rb 1
; LN:3 dim a as byte vector
align 4
a rd 3

;Temporary Variable
_Tmp1 rd 1


;Temporary String Variable
_StrTmp1 rb 32


;Temporary Vector
_TmpVec1 rd 3
; End of Uninitialized Data Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'
include 'include\cproc.inc'

include 'include\macro\import.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'

section '.idata' import data readable writeable

library kernel32, 'kernel32.dll',\
        user32,'User32.dll',\
        gdi,'GDI32.DLL',\
        comctl,'COMCTL32.DLL',\
        comdlg,'COMDLG32.DLL',\
        shell,'SHELL32.DLL',\
        advapi,'ADVAPI32.DLL',\
	msvcrt,'msvcrt.dll'

kernel32:
        import  Beep,'Beep',\
                CloseHandle,'CloseHandle',\
		CreateDirectory,'CreateDirectoryA',\
                CreateFile,'CreateFileA',\
                CreatePipe,'CreatePipe',\
                CreateProcess,'CreateProcessA',\
                DeleteFile,'DeleteFileA',\
                ExitProcess,'ExitProcess',\
                GetCommandLine,'GetCommandLineA',\
                GetCurrentProcess,'GetCurrentProcess',\
		GetCurrentDirectory,"GetCurrentDirectoryA",\
                GetFileSize,'GetFileSize',\
                GetFileType,'GetFileType',\
                GetFullPathName,'GetFullPathNameA',\
		GetLastError,'GetLastError',\
		GetLocalTime,'GetLocalTime',\
                GetModuleHandle,'GetModuleHandleA',\
                GetStdHandle,'GetStdHandle',\
                ReadConsole,'ReadConsoleA',\
                ReadFile,'ReadFile',\
		RemoveDirectory,'RemoveDirectoryA',\
                SetCurrentDirectory,'SetCurrentDirectoryA',\
                SetFilePointer,'SetFilePointer',\
                VirtualAlloc,'VirtualAlloc',\
                VirtualFree,'VirtualFree',\
                WinExec,'WinExec',\
                WriteConsole,'WriteConsoleA',\
                WriteFile,'WriteFile'

user32:
        import  CheckDlgButton,'CheckDlgButton',\
                wvsprintf,'wvsprintfA'

gdi:
        import  CreateFontIndirect,'CreateFontIndirectA',\
                DeleteObject,'DeleteObject'

comctl:
        import  CreateMappedBitmap,'CreateMappedBitmap',\
                _TrackMouseEvent,'_TrackMouseEvent'

comdlg:
        import  ChooseFont,'ChooseColorA',\
                ReplaceText,'ReplaceTextA'

shell:
        import  DragAcceptFiles,'DragAcceptFiles',\
                Shell_NotifyIcon,'Shell_NotifyIcon'

advapi:
        import  RegCreateKeyEx,'RegCreateKeyExA',\
                RegCloseKey,'RegCloseKey'

msvcrt:
	import	abs,'abs',\
		atol,'atol',\
		ltoa,'_ltoa',\
		printf,'printf',\
		puts,'puts',\
		sprintf,'sprintf',\
		system,'system'

; End of Import Section




section '.code' code readable executable
; Main Code Section

_Start:

invoke GetModuleHandle, NULL
mov dword [_hInstance], eax
invoke GetCommandLine
mov dword [_ArgList],eax
mov dword edi,ProgramName
call __MovArg
invoke GetStdHandle, STD_INPUT_HANDLE
mov dword [_InHandle], eax
invoke GetStdHandle, STD_OUTPUT_HANDLE
mov dword [_OutHandle], eax
mov byte [_CRLF+12],13
mov byte [_CRLF+13],10
mov byte [_CRLF+14],0
mov byte [_Prompt+12],63
mov byte [_Prompt+13],0
mov byte [_NullStr+12],0
mov dword [_ErrVec],_ErrExit
; End of PreCode Section

; LN:5 setvec a=addr(b)
mov esi,b
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [a],eax
; LN:6 x=$55
mov dword [q],85
; LN:7 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl1
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl1:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:8 x=shl(q,1)
mov eax, dword [q]
mov edx,1
mov ecx,edx
shl eax,cl
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:9 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl2
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl2:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:10 x=0
mov dword [q],0
; LN:11 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl3
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl3:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:12 x=bitset(q,4)
mov eax, dword [q]
mov edx,4
mov ecx,edx
bts eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:13 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl4
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl4:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:14 x=bitchg(q,2)
mov eax, dword [q]
mov edx,2
mov ecx,edx
btc eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:15 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl5
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl5:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:16 x=bitchg(q,2)
mov eax, dword [q]
mov edx,2
mov ecx,edx
btc eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:17 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl6
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl6:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:18 x=bitclr(q,4)
mov eax, dword [q]
mov edx,4
mov ecx,edx
btr eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:19 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl7
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl7:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:20 x=bitset(q,15)
mov eax, dword [q]
mov edx,15
mov ecx,edx
bts eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:21 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl8
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl8:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:22 x=bitset(q,31)
mov eax, dword [q]
mov edx,31
mov ecx,edx
bts eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:23 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl9
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl9:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:24 b=bittst(q,31)
mov eax, dword [q]
mov edx,31
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
mov al, byte [_Tmp1]
mov byte [b],al
; LN:25 print a
mov edi,[a]
xor eax,eax
mov al, byte [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl10
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl10:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:26 if b=true then
xor bh,bh
mov al, byte [b]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1
; LN:27 print "true"
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl11
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl11:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:28 else
jmp _Lbl2
_Lbl1:
; LN:29 print "false"
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl12
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl12:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:30 endif
_Lbl2:
; LN:31 x=bitchg(q,31)
mov eax, dword [q]
mov edx,31
mov ecx,edx
btc eax,ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [q],eax
; LN:32 print bin$(x)
mov eax, dword [q]
cinvoke ltoa,eax,[_ConvBuf1],2
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl13
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl13:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:33 b=bittst(q,31)
mov eax, dword [q]
mov edx,31
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
mov al, byte [_Tmp1]
mov byte [b],al
; LN:34 print a
mov edi,[a]
xor eax,eax
mov al, byte [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl14
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl14:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:35 if b=true then
xor bh,bh
mov al, byte [b]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl3
; LN:36 print "true"
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl15
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl15:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:37 else
jmp _Lbl4
_Lbl3:
; LN:38 print "false"
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl16
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl16:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:39 endif
_Lbl4:

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section
__SetStrConst:
mov al,[esi]; Get char
mov [edi],al; Put char
or al,al; Test for NULL
je __SetStrConstDone
inc esi; Bump source ptr
inc edi; Bump dest ptr
jmp __SetStrConst
__SetStrConstDone:
ret

__TrmStr:

ret

__PrtUsing:

ret

__ReadBool:
; Enter with target byte addr in esi, src addr in _DataPtr
mov edi,[_DataPtr]; Get data addr
mov al,[edi]; Get boolean value
cmp al,$30; Is it false?
jne __ReadBoolTrue; No, must be true
xor al,al; Set to false
jmp __ReadBoolDone
__ReadBoolTrue:
mov al,1; Set to true
__ReadBoolDone:
mov [esi],al;  Save in target var
add edi,2; Point to next data field
mov [_DataPtr],edi; Save for next use
ret

__ReadByte:
; Enter with target byte addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],al; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadShort:
; Enter with target word addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],ax; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadLong:
; Enter with target long addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],eax; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadFlt:

ret

__ReadStr:
; Enter with target string addr in esi, src addr in _DataPtr
mov edi,[_DataPtr]; Get dest addr
__ReadStrLoop:
mov al,[edi]; Get data
mov [esi],al; Put data
inc edi; Bump src ptr
inc esi; Bump dest ptr
cmp al,0; Is it a null?
jne __ReadStrLoop; No, proc next char
mov [_DataPtr],edi; Save result
ret

__UpdataDataPtr:
mov esi,[_DataPtr]; Get ptr
__UpdataDataPtrLoop:
mov al,[esi]; Get char
cmp al,0; Is it null?
je __UpdataDataPtrDone
inc esi; Bump ptr
jmp __UpdataDataPtrLoop
__UpdataDataPtrDone:
inc esi; Point to next data field
mov [_DataPtr],esi; Save result
ret

__MovArg:
; Enter with cmdline ptr in [_ArgList], dst vector in edi
mov esi,[_ArgList]; Point to next char in cmdline
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__MovArg1:
mov al,[esi]; Get next char
cmp al,32; Space?
je __MovArgSpace; End of this arg
mov [edi],al; Store in dest
or al,al; Set z flag
je __MovArgDone; End of cmdline
inc esi; Point to nexr char
inc edi; Point to next dest
dec edx; Dec max len
je __MovArgDone; dest len maxed out
jmp __MovArg1; Do next
__MovArgSpace:
xor al,al; Make string terminator
mov [edi],al; Store terminator in dest
inc esi; Point to nexr char
__MovArgDone:
mov [_ArgList],esi; Save cmdline ptr
ret

__MovStr:
; Enter with src vector addr in esi, dst vector addr in edi
push ebx; Save _True flag
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__MovStr1:
mov ecx,[esi+4]; Get src len
or ecx,ecx; Set z flag
je __MovStrDone1; Bail out if 0 len in src
mov ebx,[esi]; Get src ptr
__MovStr2:
mov al,[ebx]; Get char
mov [edi],al; Put char
inc edi; Inc dst ptr
inc ebx; Inc src ptr
dec edx; Dec dst len
je __MovStrDone2; Quit if dst len=0
or al,al; was last char term char?
je __MovStr3; Yes, undo and get next src lnk
dec ecx; Dec src len
jne __MovStr2; Move next char
jmp __MovStr4; Skip dst ptr undo
__MovStr3:
dec edi; Point back before term char
__MovStr4:
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __MovStrDone1
mov esi,ecx; Move lnk to src vec addr
jmp __MovStr1; Process new src vec
__MovStrDone1:
mov byte [edi],0; Tack on null because dest len not reached
__MovStrDone2:
pop ebx; Restore _True flag
ret

__CmpStr:
; Enter with src vector addr in esi, dst vector addr in edi
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
mov ecx,[esi+4]; Get src len
mov esi,[esi]; Get src ptr
__CmpStrLoop:
mov al,[edi]; Get dest char
mov ah,[esi]; Get src char
cmp al,0; Src end?
je __CmpStrDone; Yes, quit
cmp ah,0; Dst end?
je __CmpStrDone; Yes, quit 
cmp al,ah; Compare chars
jne __CmpStrDiff; Found a difference, time to quit
inc edi; Inc dst ptr
inc esi; Inc src ptr
dec edx; Dec dst len
je __CmpStrDone; Quit if dst len=0
dec ecx; Dec src len
jne __CmpStrLoop; Move next char
__CmpStrDone:
cmp al,ah; Compare chars
__CmpStrDiff:
ret

__StrLen:
; Enter with vector addr in esi
xor eax,eax; Clear len ctr
__StrLenGetVec:
mov edi,[esi]; Get vec ptr
mov edx,[esi+4]; Get vec len
__StrLenLp:
mov cl,[edi]; Get next str char
cmp cl,0; Is it term char?
je __StrLenChkLnk; Yes, check lnk
inc eax; Inc len
dec edx; Dec len ctr
je __StrLenChkLnk; Yes, check lnk
inc edi; Point to next char
jmp __StrLenLp; Go chk next char
__StrLenChkLnk:
mov esi,[esi+8]; Get vec lnk
or esi,esi; Set z flag
jne __StrLenGetVec; Zero lnk means done
ret

__SubStr:

ret

__MidStr:
; Enter with vector addr in esi, start pos in eax, quan in edx
dec eax; Convert offset to 0 base
mov edi,[esi]; Get vec ptr
add edi,eax; Get new start pos
mov [esi],edi; Save new vec ptr
mov [esi+4],edx; Set new len
ret

__RightStr:
; Enter with vector addr in esi, quan in eax
mov edi,[esi]; Get vec ptr
mov ecx,[esi+4]; Get vec len
__RightStrLen:
mov dl,[edi]; Read char
or dl,dl; Is it a null?
je __RightStr2
dec ecx; Dec len
je __RightStr1
inc edi; Bump ptr
jmp __RightStrLen
__RightStr1:
inc edi; Correction factor
__RightStr2:
sub edi,eax; Set new ptr
mov [esi],edi; Save ptr
mov [esi+4],eax; Save len
ret

__ClrConv:

ret

__AtoD:

ret

__AtoL:
mov dl,[esi]; Get first byte of conv string
cmp dl,'$'; Is it a '$'?
jne __NotHex
call __NumScan
__HexLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'$'; Term char?
je __AtoLDone
cmp dl,$39; More than '9'?
jg __HexLetter
and dl,$0f; Strip off all but numeric value
jmp __HexAcc; Accumulate result
__HexLetter:
and dl,$0f; Strip off all but numeric offset
add dl,9; Add numeric base to offset
__HexAcc:
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,16; Set multiplier for next digit 
jmp __HexLoop; Do next
__NotHex:
cmp dl,'%'; Is it a '%'?
jne __NotOctal
call __NumScan
__OctalLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'%'; Term char?
je __AtoLDone
and dl,$07; Strip off all but octal value
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,8; Set multiplier for next digit 
jmp __OctalLoop; Do next
__NotOctal:
cmp dl,'&'; Is it a '&'?
jne __NotBinary
call __NumScan
__BinaryLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'&'; Term char?
je __AtoLDone
and dl,$01; Strip off all but octal value
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,2; Set multiplier for next digit 
jmp __OctalLoop; Do next
__NotBinary:
cinvoke atol,esi; Do non-hex convert
__AtoLDone:
ret

__NumScan:
inc esi; Bump ptr
mov dl,[esi]; Get next char
cmp dl,0; Term char?
jne __NumScan; Do next
xor eax,eax; Clear acc
mov ecx,1; First digit multiplier

__ZLtoH:

ret

__ZLtoA:

ret

__LtoA:

ret

__DtoA:

ret

__LtoH:

ret

__PrintStr:

ret

__PrintTab:

ret

__InpData:
invoke ReadConsole,[_InHandle],[_IOBuffer],_BufSize,XferCount,0
push eax; Save API result
cmp [_ArgSafe1],6; Is data type 'string'?
je __InpDataString
cmp [_ArgSafe1],1; Is data type 'boolean'?
je __InpDataBool
cmp [_ArgSafe1],2; Is data type 'byte'?
je __InpDataByte
cmp [_ArgSafe1],3; Is data type 'short'?
je __InpDataShort
cmp [_ArgSafe1],5; Is data type 'float'?
je __InpDataFloat
; Get here if data type 'long'
call __GetNumVal
mov [esi],eax; Save result into target
jmp __InpDataDone
__InpDataString:
mov edi,[_ArgSafe0]; Get dst vec
mov edx,edi
add edx,4; Point to max len
mov edx,[edx]; Get max len
mov edi,[edi]; Get string addr
mov ecx,[XferCount]; Get len
mov esi,[_IOBuffer]; Get src addr
__InpDataStringLp:
mov al,[esi]; Get char
cmp al,$0d; CR?
jne __NotCR
mov byte [edi],0; Mark end
jmp __InpDataDone
__NotCR:
mov [edi],al; Put char
dec edx; Dec max count
je __InpDataDone; Quit if target max reached
inc esi; Bump src ptr
inc edi; Bump dst ptr
jne __InpDataStringLp; Get next char
jmp __InpDataDone
__InpDataBool:

jmp __InpDataDone
__InpDataByte:
call __GetNumVal
mov [esi],al; Save result into target
jmp __InpDataDone
__InpDataShort:
call __GetNumVal
mov [esi],ax; Save result into target
jmp __InpDataDone
__InpDataFloat:

__InpDataDone:
pop eax; Restore API result
ret

__GetNumVal:
mov esi,[_IOBuffer]; Get buf addr
cinvoke atol,[_IOBuffer]
mov esi,[_ArgSafe0]; Get target vec
mov esi,[esi];  Get target addr
ret

__BtoA:
; Enter with al as bool 
mov edi,[_ConvBuf1]; Point to build str
or al,al; Set z flag
je __BoolFalse; If zero, is false
mov esi,_TrueStr; Point to true str
jmp __BldBool; Go build str
__BoolFalse:
mov esi,_FalseStr; Point to false str
__BldBool:
mov al,[esi]; Get char from src
mov [edi],al; Put next char in ConvBuf1
cmp al,0; Is it term char?
je __BtoADone; Yes, all done
inc esi; Point to next char in src
inc edi; Point to next char in dest
jmp __BldBool; Go to next char
__BtoADone:
mov [edi],al; Put term char into dest
ret

__LCase:
; Enter with vector addr in esi
mov ecx,[esi+4]; Get vec len
mov esi,[esi]; Get vec ptr
__LCaseLoop:
mov al,[esi]; Get char
or al,al; Is it a null?
je __LCaseDone; Yes, quit 
cmp al,$41; Is it less than 'A'?
jb __NotUpper; Yes... don't convert
cmp al, $5a; Is it more than "Z'?
ja __NotUpper; Yes... don't convert
or al,$20; Convert to lower case
__NotUpper:
mov [esi],al; Put char
inc esi; Bump ptr
dec ecx; Dec len
jne __LCaseLoop; Proc next char
__LCaseDone:
ret

__UCase:
; Enter with vector addr in esi
mov ecx,[esi+4]; Get vec len
mov esi,[esi]; Get vec ptr
__UCaseLoop:
mov al,[esi]; Get char
or al,al; Is it a null?
je __UCaseDone; Yes, quit 
cmp al,$61; Is it less than 'a'?
jb __NotLower; Yes... don't convert
cmp al, $7a; Is it more than "z'?
ja __NotLower; Yes... don't convert
and al,$df; Convert to upper case
__NotLower:
mov [esi],al; Put char
inc esi; Bump ptr
dec ecx; Dec len
jne __UCaseLoop; Proc next char
__UCaseDone:
ret

__TailStr:
; Enter with vector addr in esi, quan in eax
push ebx; Save ebx
mov edi,[esi]; Get vec ptr
mov ecx,[esi+4]; Get vec len
xor edx,edx; Clear edx
dec eax; Set value as offset
add eax,edi; Calc new ptr
__TailStrLen:
mov bl,[edi]; Read char
or bl,bl; Is it a null?
je __TailStr2
dec ecx; Dec len
je __TailStr1
inc edi; Bump ptr
inc edx; Bump new len
jmp __TailStrLen
__TailStr1:
inc edi; Correction factor
__TailStr2:
mov [esi],eax; Save new ptr
mov [esi+4],edx; Save new len
pop ebx; restore ebx
ret

; Function Code Section

; End of Function Section
