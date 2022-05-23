include	<p16f84.inc>

;4Mhz - ����������

;���������
bsf	STATUS,RP0
movlw	b'00000000' ;TRISA = 00000000
movwf	TRISA
movlw	b'11100000' ;TRISB = 11100000
movwf	TRISB
bcf	STATUS,RP0

close			;������ C �� ����� ������� � ��������� ���� + ����������� ������� � ���� whiletruecyclxd
movlw	.1		;������ C �� ����� �������
call	setledtable
bcf	PORTA,4		;������� ���� � RA4 (���������� ����)

whiletruecycl	;������������ ������� ������(RB4) � �������� ���� �����
movlw	b'11101111'
movwf	PORTB
					;�������� ������� �������(RB5)
	btfsc	PORTB,7		;���� ������ ������� �� ���� � Check2, � ���� ��� �� ������������ ������� � whiletruecyclxd ���� ������� ��� ���
	goto whiletruecycl	;����������� ������� � ����
	check2 			;�������� ������� �������(RB6)
	btfsc	PORTB,6		;���� ������ ������� �� ���� � Check3, � ���� ��� �� ������������ ������� � check2 ���� ������� ��� ���
	goto	check2		;����������� �������
	check3 			;�������� �������� �������(RB7)
	btfsc	PORTB,5		;���� ������ ������� �� ���� � open, � ���� ��� �� ������������ ������� � check3 ���� ������� ��� ���
	goto	check3		;����������� �������
	open			;������ ���� �� ����� ������� � ��������� ���� + 10 ��� �����
	movlw	.0		;������ ���� �� ����� �������
	call	setledtable 
	bsf	PORTA,4		;��������� ���� 1 � RA4 (��������� ����)
	call	pause10SEC	;����� 10 �������� �����
goto	close ;������ C �� ����� ������� � ��������� ���� + ����������� ������� � ���� whiletruecyclxd

setledtable
call	ledtable
movwf PORTA
return

ledtable
addwf	PCL
retlw	b'00000000' ;0 - ���� open
retlw	b'00001010' ;� close
return

;10 SEC
pause10SEC
movlw	.155 		;�������
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