include	<p16f84.inc>

;��������� ������
bsf	STATUS,RP0
movlw	b'00000000'
movwf	TRISA
movlw	b'11100000'
movwf	TRISB
bcf	STATUS,RP0

;��������� � ��������� �
movlw	.1
call	ledtable
movwf	PORTA

;�������� ���������� 123
cycl
movlw	b'11101111'
movwf	PORTB
	;�������� 1
	btfsc	PORTB,5
	goto	cycl
	goto	next
	;�������� 2
	next
	btfsc	PORTB,6
	goto	next
	goto	next2
	;�������� 3
	next2
	btfsc	PORTB,7
	goto	next2
	goto	goZ

;��������� ����
goZ
bcf	STATUS,RP0
movlw	.0
call	ledtable
movwf	PORTA
bsf	PORTA,4
call	pause
goto	goR

;���������� ����
goR
bcf	STATUS,RP0
movlw	.1
call	ledtable
movwf	PORTA
bcf	PORTA,4
goto	cycl

;����� ��� ����������
ledtable
addwf	PCL
retlw	b'00000000';��������
retlw	b'00001010';����������
return

;����� 10c
pause
movlw	.100
movwf	0x20
a2
movlw	.0
movwf	TMR0
movlw	b'00000111'
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