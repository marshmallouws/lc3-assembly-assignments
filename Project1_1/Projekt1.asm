        .ORIG x3000
LOOP    JSR readS
        JSR isPrime
        JSR resultS
        BR LOOP
        
        readS
        LEA R1, MESSAGE     ; Get address of string
LOOP2   LDR R0, R1, #0      ; Loads the character at pointer
        BRz MESSAGE_DONE    ; If null, end of string
        OUT                 ; Prints character
        ADD R1, R1, #1      ; Move pointer to next character
        BR LOOP2
MESSAGE_DONE
        GETC                ; Get first digit from user
        AND R1, R0, xF      ; Convert ASCII to int
        OUT                 ; Prints to console
        GETC                ; Gets second character
        AND R2, R0, xF
        OUT
        LEA R3, NewLine     ; New line
        LDR R0, R3, #0
        OUT
        AND R3, R3, #0      ; Init loop for the tens
        ADD R3, R3, #10
        AND R4, R4, #0
LOOP3   ADD R4, R4, R1      ; This takes the digit at the tens place and times it with 10
        ADD R3, R3, #-1
        BRz DONE
        BR LOOP3
DONE    ADD R0, R4, R2      ; Puts the result in R0
        RET                 ; Returns R0
MESSAGE .STRINGZ "Input a 2 digit decimal number: "    ; String with the message
NewLine .StRINGZ "\n"        
        
        
        isPrime
        AND R2, R2, #0      ; Makes a copy of the test number and inverse it
        ADD R2, R2, R0  
        NOT R2, R2          
        ADD R2, R2, #1      
LOOP4   AND R1, R1, #0      ; Makes copy of the number to test
        ADD R1, R1, R0
        ADD R2, R2, #1      ; Changes the divider to one lower
        AND R3, R3, #0      ; Checks if divider is 1, in case it is the number is prime.
        ADD R3, R2, #1
        BRz ISPRIME1
LOOP5   ADD R1, R1, R2      ; Takes the test number and subtract the devider
        BRp LOOP5           ; If it is still positive, subtract again
        BRz NOTPRIME        ; If it is zero, that means that the number is not prime
        BR LOOP4
NOTPRIME
        AND R0, R0, #0      ; If the number is not prime return 0
        BR DONE2
ISPRIME1 AND R0, R0, #0     ; If the number is prime return 1
        ADD R0, R0, #1
DONE2   RET



        resultS
        ADD R0, R0, #-1     ; Checks if R0 is 0 or 1
        BRz ISPRIME2        ; If R0 was 1 the number is prime
        LEA R1 NOTPRIMEMESSAGE  ; Loads address of "is not prime" message
        BR LOOP6
ISPRIME2
        LEA R1 ISPRIMEMESSAGE   ; Loads address of "is prime" message
LOOP6   LDR R0, R1, #0      ; Writes the loaded message to console
        BRz DONE3
        OUT
        ADD R1, R1, #1
        BR LOOP6
DONE3   RET
NOTPRIMEMESSAGE
        .STRINGZ "The number is not prime\n"
ISPRIMEMESSAGE        
        .STRINGZ "The number is prime\n"
        
        .END