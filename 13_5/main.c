#include <xc.h>
#include <pic.h>
#include <proc\pic16f84.h>
#define _XTAL_FREQ 4000.0

void main(){
    TRISA = 0b11100000;
    TRISB = 0b00000000;

    //PORTA = 00001004;
    //PORTA = 0b00000111;
    __delay_ms(500);
    PORTA = "c";
    RA4 = 1;
    
}