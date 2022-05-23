include	<p16f84a.inc>

bsf	STATUS,RP0 ;настройка портов
movlw	b'00000000'
movwf	TRISA
movlw	b'00000000'
movwf	TRISB
bcf	STATUS,RP0

start
movlw	b'11111110'
movwf	PORTA
movlw	.0
call	ledtable
movwf	PORTB

call pause

movlw	b'11111101'
movwf	PORTA
movlw	.1
call	ledtable
movwf	PORTB

call pause

movlw	b'11111011'
movwf	PORTA
movlw	.2
call	ledtable
movwf	PORTB

call pause

movlw	b'11110111'
movwf	PORTA
movlw	.3
call	ledtable
movwf	PORTB

call pause

goto start

;запись	номеров строк
ledtable
addwf	PCL
retlw	b'10001100'
retlw	b'10110000'
retlw	b'10011001'
retlw	b'11111000'

pause
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
return

end