.ORIG x3000
LD R0,A                 ; Load A
LD R1,B                 ; Load B

; Following three lines make up a way to subtract a number from another. 
X NOT R2, R0            ; (a) 
ADD R2,R2,#1            ; (b) 
ADD R2,R2,R1            ;

BRz DONE                ; (d) If A == B goto DONE

ADD R0,R0,#1            ; (c) Increment A with 1
ADD R1,R1,#-1           ; Decrement B with 1

BRnzp X                 ; If we reach this point goto X (Branch unconditionally)
DONE ST R1, C
TRAP x21                ; Output result (for own sake)
TRAP x25
A .BLKW 1
B .BLKW 1
C .BLKW 1
.END