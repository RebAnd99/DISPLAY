PROCESSOR 16F887
#include <xc.inc>

    ;CONFIG word1
CONFIG FOSC=INTRC_NOCLKOUT
CONFIG WDTE=OFF
CONFIG PWRTE=ON
CONFIG MCLRE=OFF
CONFIG CP=OFF
CONFIG CPD=OFF
CONFIG BOREN=OFF
CONFIG IESO=OFF
CONFIG FCMEN=ON
CONFIG DEBUG=ON

    ;CONFIG word2
CONFIG BOR4V=BOR40V
CONFIG WRT=OFF

PSECT udata
vreg3:
    DS 1
vreg2:
    DS 1
vreg1:
    DS 1

PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL numero
goto numero

PSECT code
retraso:    
MOVLW    54       
MOVWF    vreg3          
ext:   
MOVLW     54        
MOVWF    vreg2          
mitad:    
MOVLW    65       
MOVWF    vreg1          
int:    
DECFSZ   vreg1,1       
GOTO     int      
DECFSZ   vreg2,1       
GOTO        mitad         
DECFSZ   vreg3,1       
GOTO        ext  
RETURN                     
		
clean:
    BANKSEL ANSEL
    clrf ANSEL
    BANKSEL PORTA
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    return
num0:
    BANKSEL PORTA
    movlw 0b11111100
    movwf PORTA
   return
num1:
    BANKSEL PORTA
    movlw 0b01100000
    movwf PORTA
   return   
num2:
    BANKSEL PORTA
    movlw 0b11011010
    movwf PORTA
   return  
num3:
    BANKSEL PORTA
    movlw 0b11110010
    movwf PORTA
   return
num4:
    BANKSEL PORTA
    movlw 0b01100110
    movwf PORTA
   return
num5:
    BANKSEL PORTA
    movlw 0b10110110
    movwf PORTA
   return
num6:
    BANKSEL PORTA
    movlw 0b10111110
    movwf PORTA
   return
num7:
    BANKSEL PORTA
    movlw 0b11100000
    movwf PORTA
   return
num8:
    BANKSEL PORTA
    movlw 0b11111110
    movwf PORTA
   return
num9:
    BANKSEL PORTA
    movlw 0b11100110
    movwf PORTA
   return
numero:
   call clean
   call num0
   call retraso
   call clean
   call num1
   call retraso
   call clean
   call num2
   call retraso
   call clean
   call num3
   call retraso
   call clean
   call num4
   call retraso
   call clean
   call num5
   call retraso
   call clean
   call num6
   call retraso
   call clean
   call num7
   call retraso
   call clean
   call num8
   call retraso
   call clean
   call num9
   call retraso
   call clean
    END


