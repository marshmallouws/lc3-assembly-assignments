.ORIG x3000
    LEA R1,MEMORYSPACE ; saves the address of the storage memory block
loop:
    GETC               ; input character -> r0
    PUTC               ; r0 -> console
    STR R0,R1,#0       ; r0 -> ( memory address stored in r1 + 0 )
    ADD R1,R1,#1       ; increments the memory pointer so that it
                       ; always points at the next available block
    BR loop

MEMORYSPACE .blkw 100  ; declares empty space to store the string

.END