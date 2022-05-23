include	<p16f84.inc>

;4Mhz - контроллер

;настройка
bsf	STATUS,RP0
movlw	b'00000000' ;TRISA = 00000000
movwf	TRISA
movlw	b'11100000' ;TRISB = 11100000
movwf	TRISB
bcf	STATUS,RP0

close			;подача C на экран дисплея и включение реле + возвращение обратно в цикл whiletruecyclxd
movlw	.1		;подача C на экран дисплея
call	setledtable
bcf	PORTA,4		;очистка бита в RA4 (Выключение реле)

whiletruecycl	;сканирование третьей строки(RB4) и основной цикл всего
movlw	b'11101111'
movwf	PORTB
					;проверка первого столбца(RB5)
	btfsc	PORTB,7		;Если нажата клавиша он идет в Check2, а если нет он возвращается обратно в whiletruecyclxd чтоб чекнуть ещё раз
	goto whiletruecycl	;Возвращение обратно в цикл
	check2 			;проверка второго столбца(RB6)
	btfsc	PORTB,6		;Если нажата клавиша он идет в Check3, а если нет он возвращается обратно в check2 чтоб чекнуть ещё раз
	goto	check2		;Возвращение обратно
	check3 			;проверка третьего столбца(RB7)
	btfsc	PORTB,5		;Если нажата клавиша он идет в open, а если нет он возвращается обратно в check3 чтоб чекнуть ещё раз
	goto	check3		;Возвращение обратно
	open			;подача ноль на экран дисплея и включение реле + 10 сек пауза
	movlw	.0		;подача ноль на экран дисплея
	call	setledtable 
	bsf	PORTA,4		;установка бита 1 в RA4 (включение реле)
	call	pause10SEC	;вызов 10 секудной паузы
goto	close ;подача C на экран дисплея и включение реле + возвращение обратно в цикл whiletruecyclxd

setledtable
call	ledtable
movwf PORTA
return

ledtable
addwf	PCL
retlw	b'00000000' ;0 - типо open
retlw	b'00001010' ;С close
return

;10 SEC
pause10SEC
movlw	.155 		;тайминг
movwf	0x22
a23
movlw	.0
movwf	TMR0
movlw	b'00000111'
bsf	STATUS,RP0
movwf OPTION_REG
a234
btfss	INTCON,T0IF
goto	a234
bcf	INTCON,T0IF
bcf	STATUS,RP0
decfsz	0x22
goto	a23
return

end