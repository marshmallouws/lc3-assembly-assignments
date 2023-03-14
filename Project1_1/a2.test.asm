.ORIG x3000
START

readS
    ADD R1, R1, 0 ; Counter for loop
    ADD R2, R2, 1 ; Limit
    LEA R0, prompt ; Loading adress since string is too large for register
    LD R3, sub
    TRAP x22
    ST R5, dec
    
    LOOP
        TRAP x23
    
        ADD R0, R0, R3 ; Convert input to decimal by subtracting 48
        ADD R5, R5, R0 ; If R5 == 0, multiply by 10
    
        ADD R1, R1, #1 ; Increment counter
        
        ; Check if limit is reached
        NOT R2, R2   
        ADD R2, R2, #1
        ADD R4, R2, R1
    BRz LOOP
    
HALT

prompt .STRINGZ "Input a 2 digit decimal number"
sub .FILL #-48
dec .BLKW 1

.END