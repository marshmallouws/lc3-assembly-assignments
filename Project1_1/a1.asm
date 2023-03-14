.ORIG x3000
LD R0,A                 ; Load A
LD R1,B                 ; Load B
X AND R2, R1, #0        ; (a) Add 0 to r2 which will contain result
                        ;------------------ (b)
ADD R2,R2,R1            ;
ADD R0,R0,#1            ; (c) Increment A with 1
ADD R1,R1,#-1           ; Decrement B with 1
NOT R2, R0
ADD R2,R2,#1
ADD R2,R2,R1
BRz DONE                ; (d) If A == B goto DONE
BRnzp X                 ; If we reach this point goto X unconditional branch
DONE ST R1,C
TRAP x21                ; Output result (for own sake)
TRAP x25
A .BLKW 1
B .BLKW 1
C .BLKW 1
.END