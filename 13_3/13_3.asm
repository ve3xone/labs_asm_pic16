include	<p16f84.inc>

bsf	STATUS,RP0 	;��������� ������
movlw	b'00000000'
movwf	TRISA
movlw	b'11111111'
movwf	TRISB
bcf	STATUS,RP0

movlw	b'00000101' 	;������� 5
movwf	PORTA

check	;�������� ������ (����)
	btfss	PORTB,1	;�������� ������� ������ 1
		goto	plus		;������� � ����������
	btfss	PORTB,2	;�������� ������� ������ 1
		goto	minus	;������� � ���������
goto check

plus				;����������
movf 	PORTA,0 ;��������
movwf 	0x0c
movlw 	.9
subwf 	0x0c
btfsc 	STATUS,Z
	goto		check		;���
	incf		PORTA		;��������
call		pause
goto		check 	;���

minus			;����������
movf 	PORTA,0	;��������
movwf 	0x0c
movlw 	.0
subwf 	0x0c
btfsc 	STATUS,Z
	goto		check 		;���
	decf		PORTA		;���������
call		pause	;�����
goto		check 	;���

pause	;�����
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