.global _start
_start:
	MOV  R0, #0 //result
	MOV  R3, #0 //sign
	LDR  R1, =multiplier
	LDR  R1, [R1]
	CMP  R1, #0
	BLT  LT1
LT1END:
	LDR  R2, =multiplicand
	LDR  R2, [R2]
	CMP  R2, #0
	BLT  LT2 //branch if the multiplicand >= 0
LOOP:
	CMP  R2, #0
	BEQ  Sign
	AND  R4,R2,#0x1
	CMP  R4, #0x1
	BEQ  LOOPif
LOOPifEND:
	LSL  R1, R1, #1
	LSR  R2, R2, #1
	B    LOOP //while loop ends
Sign:
	CMP  R3, #0
    BEQ  end
	MVN  R0, R0
	ADD  R0, R0, #1

end:
    B    end
	
LT1: //if the multipler < 0
	MVN  R1, R1
	ADD  R1, R1, #1
	EOR  R3, R3, #1
	B    LT1END
LT2: //if the multiplicand < 0
	MVN  R2, R2
	ADD  R2, R2, #1
	EOR  R3, R3, #1
	B    LOOP
LOOPif:
	ADD  R0, R0, R1 //result += multiplier
	
	B    LOOPifEND



	