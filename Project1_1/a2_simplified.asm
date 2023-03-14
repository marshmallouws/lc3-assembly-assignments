.ORIG x3000
START

readS
    LD R5, sub
    LEA R0 prompt
    
    TRAP x22 ; Output prompt
    
    TRAP x23
    ADD R1, R0, R5; Convert to decimal
    ADD R2, R2, #0 ; Counter
    ADD R3, R3, #0 ; Result
    
    LOOP ; Multiply num with 10
        ADD R2, R2 #1 ; Increment counter
        ADD R3, R3, #10 ; Add 10 to result
    
        ; Check if we have reach number
        NOT R4, R1
        ADD R4, R4, #1
        ADD R4, R4, R2
    BRnp LOOP
    
    TRAP x23
    ADD R1, R0, R5
    ADD R3, R3, R1

HALT

prompt .STRINGZ "Input a 2 digit decimal number"
sub .FILL #-48

.END