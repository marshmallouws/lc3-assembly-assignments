.ORIG x3000

readS
    ; Array example https://www.youtube.com/watch?v=DFHF2RsqF1Q
    ADD R5, R5, #5 ; Loop counter
    
    LEA R1, x00D ; Array pointer
    INPUT_LOOP
        TRAP x20
        AND R2, R0, xF ; Convert to decimal
        LDR R3, R1, #0 ; Add value to array
        
        ADD R1, R1, #1 ; Increment array pointer
        ADD R5, R5, #-1 ; Decrement loop counter
        OUT
        
        ADD R0, R0, #-10
    BRnp INPUT_LOOP
    
HALT

inArray .FILL x4000
outArray .FILL x5000
.END