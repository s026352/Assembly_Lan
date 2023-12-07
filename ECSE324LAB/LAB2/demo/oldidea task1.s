.global _start
multiplier: .word 4
multiplicand: .word 6
_start:
	MOV  R0, #0 //result
	MOV  R3, #0 //sign
	
	LDR  R1, =multiplier
	LDR  R1, [R1]
	CMP  R1, #0
	BGE  LT2 //branch if >=0
	MVN  R1, R1 //run if the multiplier < 0
	ADD  R1, R1, #1
	NEG  R3, R3
LT2:
	LDR  R2, =multiplicand
	LDR  R2, [R2]
	CMP  R2, #0
	BGE  LOOP //branch if the multiplicand >= 0
	MVN  R2, R2
	ADD  R2, R2, #1
	NEG  R3, R3

LOOP:
	CMP R2, #0
	BEQ LOOPOUT
	//AND R3, R1, #0x1
    AND R4, R2, #1	
	CMP R4, #1
	BNE LOOPIF
BACKIF:
	LSL R1, R1, #1
	LSR R2, R2, #1
	CMP R0, #0
	BEQ LOOP
LOOPOUT:
	NEG R0, R0
end:
    B  end
	
LOOPIF:
    ADD R0, R0, R1
    B BACKIF


	