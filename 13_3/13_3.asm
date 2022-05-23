include	<p16f84.inc>

bsf	STATUS,RP0 	;настройка портов
movlw	b'00000000'
movwf	TRISA
movlw	b'11111111'
movwf	TRISB
bcf	STATUS,RP0

movlw	b'00000101' 	;выводим 5
movwf	PORTA

check	;проверка кнопок (цикл)
	btfss	PORTB,1	;проверка нажатие кнопки 1
		goto	plus		;переход в увеличение
	btfss	PORTB,2	;проверка нажатие кнопки 1
		goto	minus	;переход в вычитание
goto check

plus				;увеличение
movf 	PORTA,0 ;проверка
movwf 	0x0c
movlw 	.9
subwf 	0x0c
btfsc 	STATUS,Z
	goto		check		;чек
	incf		PORTA		;сложение
call		pause
goto		check 	;чек

minus			;уменьшение
movf 	PORTA,0	;проверка
movwf 	0x0c
movlw 	.0
subwf 	0x0c
btfsc 	STATUS,Z
	goto		check 		;чек
	decf		PORTA		;вычитание
call		pause	;пауза
goto		check 	;чек

pause	;пауза
movlw	.50
movwf	0x3a
a2
movlw	.217
movwf	TMR0
movlw	b'00000110'
bsf		STATUS,RP0
movwf	OPTION_REG
a
btfss	INTCON,T0IF
goto	a
bcf		INTCON,T0IF
bcf		STATUS,RP0
decfsz	0x3a
goto	a2
return

end