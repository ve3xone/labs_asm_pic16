include	<p16f84.inc>

;настройка
bsf	STATUS,RP0
movlw	b'00000000'
movwf	TRISA
movlw	b'11100000'
movwf	TRISB
bcf	STATUS,RP0

;индикация нуля
movlw	.0
call base

;сканирование первой строки(RB2)
cycl
call	pause
movlw	b'11111011'
movwf	PORTB
	;проверка первого столбца(RB5)
	btfsc	PORTB,5
	goto	next1
	movlw	.7
	call base
	;проверка второго столбца(RB6)
	next1
	btfsc	PORTB,6
	goto	next2
	movlw	.8
	call base
	;проверка третьего столбца(RB7)
	next2
	btfsc	PORTB,7
	goto	next3
	movlw	.9
	call base

;сканирование второй строки(RB3)
next3
call	pause
movlw	b'11110111'
movwf	PORTB
	;проверка первого столбца(RB5)
	btfsc	PORTB,5
	goto	next4
	movlw	.4
	call base
	;проверка второго столбца(RB6)
	next4
	btfsc	PORTB,6
	goto	next5
	movlw	.5
	call base
	;проверка третьего столбца(RB7)
	next5
	btfsc	PORTB,7
	goto	next6
	movlw	.6
	call base

;сканирование третьей строки(RB4)
next6
call	pause
movlw	b'11101111'
movwf	PORTB
	;проверка первого столбца(RB5)
	btfsc	PORTB,5
	goto	next7
	movlw	.1
	call base
	;проверка второго столбца(RB6)
	next7
	btfsc	PORTB,6
	goto	next8
	movlw	.2
	call base
	;проверка третьего столбца(RB7)
	next8
	btfsc	PORTB,7
	goto	next0
	movlw	.3
	call base
	
;сканирование четвертой строки(RB1)
next0
call	pause
movlw	b'11111101'
movwf	PORTB
	;проверка второго столбца(RB6)
	btfsc	PORTB,6
	goto	cycl
	movlw	.0
	call base
goto	cycl

base
call	ledtable
movwf PORTA
return

ledtable
addwf	PCL
retlw	b'00000000'
retlw	b'00000001'
retlw	b'00000010'
retlw	b'00000011'
retlw	b'00000100'
retlw	b'00000101'
retlw	b'00000110'
retlw	b'00000111'
retlw	b'00001000'
retlw	b'00001001'
return

;пауза
pause
movlw	.5
movwf	0x20
a2
movlw	.217
movwf	TMR0
movlw	b'00000110'
bsf	STATUS,RP0
movwf	OPTION_REG
a
btfss	INTCON,T0IF
goto	a
bcf	INTCON,T0IF
bcf	STATUS,RP0
decfsz	0x20
goto	a2
return

end
	
	

