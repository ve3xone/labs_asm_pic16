subtitle "Microchip MPLAB XC8 C Compiler v2.36 (Free license) build 20220127204148 Og9 "

pagewidth 120

	opt flic

	processor	16F84A
include "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\16f84a.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 55 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
INDF equ 00h ;# 
# 62 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TMR0 equ 01h ;# 
# 69 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PCL equ 02h ;# 
# 76 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
STATUS equ 03h ;# 
# 162 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
FSR equ 04h ;# 
# 169 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PORTA equ 05h ;# 
# 213 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PORTB equ 06h ;# 
# 275 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EEDATA equ 08h ;# 
# 282 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EEADR equ 09h ;# 
# 289 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PCLATH equ 0Ah ;# 
# 309 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
INTCON equ 0Bh ;# 
# 387 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
OPTION_REG equ 081h ;# 
# 457 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TRISA equ 085h ;# 
# 501 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TRISB equ 086h ;# 
# 563 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EECON1 equ 088h ;# 
# 607 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EECON2 equ 089h ;# 
# 55 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
INDF equ 00h ;# 
# 62 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
TMR0 equ 01h ;# 
# 69 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
PCL equ 02h ;# 
# 76 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
STATUS equ 03h ;# 
# 162 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
FSR equ 04h ;# 
# 169 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
PORTA equ 05h ;# 
# 213 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
PORTB equ 06h ;# 
# 275 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
EEDATA equ 08h ;# 
# 282 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
EEADR equ 09h ;# 
# 289 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
PCLATH equ 0Ah ;# 
# 309 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
INTCON equ 0Bh ;# 
# 387 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
OPTION_REG equ 081h ;# 
# 457 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
TRISA equ 085h ;# 
# 501 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
TRISB equ 086h ;# 
# 563 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
EECON1 equ 088h ;# 
# 607 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84.h"
EECON2 equ 089h ;# 
# 55 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
INDF equ 00h ;# 
# 62 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TMR0 equ 01h ;# 
# 69 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PCL equ 02h ;# 
# 76 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
STATUS equ 03h ;# 
# 162 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
FSR equ 04h ;# 
# 169 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PORTA equ 05h ;# 
# 213 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PORTB equ 06h ;# 
# 275 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EEDATA equ 08h ;# 
# 282 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EEADR equ 09h ;# 
# 289 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
PCLATH equ 0Ah ;# 
# 309 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
INTCON equ 0Bh ;# 
# 387 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
OPTION_REG equ 081h ;# 
# 457 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TRISA equ 085h ;# 
# 501 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
TRISB equ 086h ;# 
# 563 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EECON1 equ 088h ;# 
# 607 "C:\Program Files\Microchip\xc8\v2.36\pic\include\proc\pic16f84a.h"
EECON2 equ 089h ;# 
	debug_source C
	FNROOT	_main
	global	_PORTA
_PORTA	set	0x5
	global	_RA4
_RA4	set	0x2C
	global	_TRISB
_TRISB	set	0x86
	global	_TRISA
_TRISA	set	0x85
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	
STR_1:	
	retlw	99	;'c'
	retlw	0
psect	strings
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	file	"Debug\main.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
?_main:	; 1 bytes @ 0x0
??_main:	; 1 bytes @ 0x0
	ds	1
;!
;!Data Sizes:
;!    Strings     2
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON            0      0       0
;!    BANK0            66      1       1

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 1     1      0       0
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 0
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            0      0       0       0        0.0%
;!EEDATA              40      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!COMMON               0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BANK0               42      1       1       3        1.5%
;!ABS                  0      0       0       4        0.0%
;!BITBANK0            42      0       0       5        0.0%
;!DATA                 0      0       0       6        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       1
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	6
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	6
	
_main:	
;incstack = 0
	callstack 8
; Regs used in _main: [wreg+status,2]
	line	7
	
l556:	
	movlw	low(0E0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	8
	
l558:	
	clrf	(134)^080h	;volatile
	line	12
	
l560:	
	asmopt push
asmopt off
	movlw	166
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0)
	u17:
decfsz	(??_main+0)+0,f
	goto	u17
	nop
asmopt pop

	line	13
	
l562:	
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	14
	
l564:	
	bsf	(44/8),(44)&7	;volatile
	line	16
	
l15:	
	global	start
	ljmp	start
	callstack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
