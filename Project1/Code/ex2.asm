.ORIG x3000
START LDI   R1, A ;
BRZP START      ; INPUT
LDI R0, B   
A .FILL xFE00 ; Address of KBSR
B .FILL xFE02 ; Address of KBDR
.END