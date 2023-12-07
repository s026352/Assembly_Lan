lucas:
	PUSH {LR}
	MOV R3, #0
	BL START
	MOV R0, R3
	POP {LR}
	BX LR
START:
	PUSH {LR}
	
	MOV R1, #0
	//MOV R2, #0
	
	CMP R0, #1 //if == 1
	BEQ IfN1
	CMP R0, #0 //if == 0
	BEQ IfN0
	
	SUB R0, R0, #1 //n-1
	BL START
	ADD R0, R0, #1
	SUB R0, R0, #2 //n-2
	BL START
	ADD R0, R0, #2
	

Ifend:
	POP {LR}
	BX LR //else



IfN0:
	MOV R1, #2
	ADD R3,R3,#2
	B Ifend
	
IfN1:
	MOV R1, #1
	ADD R3,R3,#1
	B Ifend