.ORIG x3000
START
readS
    LD R5, sub
    LEA R0 prompt
    
    TRAP x22 ; Output prompt
    
    TRAP x20    
    ADD R1, R0, R5; Convert to decimal
    OUT
    ADD R2, R2, #0 ; Counter 
    ADD R3, R3, #0 ; Result
    
    MUL_LOOP ; Multiply num with 10
        ADD R2, R2 #1 ; Increment counter - this is done before operation
        ADD R3, R3, #10 ; Add 10 to result
    
        ; Check if we are done iterating
        NOT R4, R1
        ADD R4, R4, #1
        ADD R4, R4, R2
    BRnp MUL_LOOP
    
    TRAP x20
    OUT
    ADD R1, R0, R5
    
    ADD R0, R3, R1
    RET ; Return number
    
HALT

prompt .STRINGZ "Input a 2 digit decimal number: "
sub .FILL #-48

.END