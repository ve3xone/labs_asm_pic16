include	<p16f84a.inc>

;настройка портов
bsf	STATUS,RP0
movlw	b'00000000'
movwf	TRISA
movlw	b'11111111'
movwf	TRISB
bcf	STATUS,RP0

;выключение индикатора
movlw	b'00001111'
movwf	PORTA

;цикл проверки кнопок
but
btfss	PORTB,1
goto	but1
btfss	PORTB,2
goto	but2
goto	but

but1
movlw	.0
call ckl

movlw	.1
call ckl

movlw	.2
call ckl

movlw	.3
call ckl

movlw	.4
call ckl

movlw	.5
call ckl

movlw	.6
call ckl

movlw	.7
call ckl

movlw	.8
call ckl

movlw	.9
call ckl

;выключение индикатора
movlw	b'00001111'
movwf	PORTA
goto	but

;цикл второй кнопки
but2
movlw	.9
call ckl

movlw	.8
call ckl

movlw	.7
call ckl

movlw	.6
call ckl

movlw	.5
call ckl

movlw	.4
call ckl

movlw	.3
call ckl

movlw	.2
call ckl

movlw	.1
call ckl

movlw	.0
call ckl

;выключение индикатора
movlw	b'00001111'
movwf	PORTA
goto	but

;числа				
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

;пауза 1 секунда  и проверка кнопок для перехода на другой баттон цикл
pause
movlw	.200
movwf	0x0d
a2
movlw	.217
movwf	TMR0
movlw	b'00000110'
call check
bsf	STATUS,RP0
movwf	OPTION_REG
a1
call check
btfss	INTCON,T0IF
goto	a1
bcf	INTCON,T0IF
bcf	STATUS,RP0
decfsz	0x0d
goto	a2
return

check
btfss	PORTB,1
goto	but1
btfss	PORTB,2
goto	but2
return

ckl
call	ledtable
movwf	PORTA
call	pause
return

end