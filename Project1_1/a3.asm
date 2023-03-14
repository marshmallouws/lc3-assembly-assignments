.ORIG x3000


isPrime
    LD R0, num
    LD R1, sub
    
    
    TRAP x23 
    ADD R3, R0, R1 ; Convert to decimal
    ADD R4, R3, #-1 ; Decrementing number to divide with
    
    LOOP ; Try divide with each number lower than input to see if it is a prime
        
    
    BRz LOOP
    
    
HALT


num .FILL #45
sub .FILL #-48

.END