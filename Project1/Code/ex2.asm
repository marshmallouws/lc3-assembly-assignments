.ORIG x3000

readS
    LD R2, limit ; Limit for loop
    LD R6, ascii
    ADD R1, R1, #0 ; Counter to check how many inputs
    ADD R3, R3, #0 ; Result
    
    
    LEA R0, prompt
    
    TRAP x22 ; Output prompt
    
    LOOP_FOR_INPUT
        TRAP X23 ; input (echo)
                 ; convert to integer
                 ; add to register R1
        
        ; https://www.extreme01.com/school/nyustel99/ics/11_LC3_TRAP.pdf
        ADD R0, R3, # ; store number
        
        ;NOT R4, R0
        ;ADD R4, R4, #1
        ;LD R5, sub
        ;ADD R4, R4, R5
                 
        ;TRAP x22
        
        ;ADD R3, R3, #1
                 
        ; Increment counter
        NOT R2, R2
        ADD R2, R2, #1
        ADD R1, R1, R2 
    BRn LOOP_FOR_INPUT      ; branch to Loop if we haven't had two inputs
    
    TRAP X25
    
prompt .STRINGZ "Input a 2 digit decimal number:"
limit .BLKW #2
sub .BLKW #49
ascii .FILL xFFD0

.END

; Kan evt lave en counter der incrementer for hvert input, så skal der tjekkes om den counter er to (eller 1) hvis den er, skal der ikke laves goto