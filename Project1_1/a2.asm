.ORIG x3000
START

readS
    LEA R0, prompt ; Loading adress since string is too large for register
    ADD R1, R1, 1 ; Counter for loop
    ADD R2, R2, 2 ; Limit
    
    TRAP x22
    
    LOOP
        TRAP x23
        ADD R0, R0, xF ; Convert input to decimal by subtracting 48
        
        ; if we are on first iteration of input loop
        NOT R3, R1
        ADD R3, R3, #1
        ADD R3, R3, 0 ; If counter for outer loop is 0, we will run inner loop
        BRnz SKIP
            
            ADD R4, R4, 0 ; Mulloop counter
            LD R5, mul10 ; Loop 10 times
            MULLOOP ; loop to multiply
                
                ADD R0, R0, #1
                
                NOT R6, R4
                ADD R6, R6, #1
                ADD R6, R6, R5
        
        BRz MULLOOP
        ; if statement end
        
        SKIP
        
        ; Save result
        ADD R5, R5, R0 ; If R5 == 0, multiply by 10
        ST R5, result
        
        ADD R1, R1, #1 ; Increment counter
        
        ; Check if limit is reached
        NOT R2, R2   
        ADD R2, R2, #1
        ADD R4, R2, R1
    BRz LOOP
HALT



prompt .STRINGZ "Input a 2 digit decimal number"
result .BLKW 1
mul10 .FILL #9
l1counter .BLKW 1
l1limit .BLKW 1

.END