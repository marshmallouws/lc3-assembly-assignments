.ORIG x3000
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

.END