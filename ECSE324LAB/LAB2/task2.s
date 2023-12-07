.global _start
_start:
	LDR R1, =array
	LDR R0, =size
	LDR R0, [R0]
	SUB R0, R0, #1 //size = size - 1
	
	
	MOV R4, #0 //step = 0
OutLoop:

	MOV R5, #0 //i = 0
InLoop:
	LDR R2, [R1,R5,LSL#2]  //array[base + i*4]
	ADD R7, R5, #1
	LDR R3, [R1,R7,LSL#2]		//array[base + i*4 + 4]
	CMP R2, R3
	BGT LoopIf

IfEnd:
	ADD R5, R5, #1 //i++
	SUB R6, R0, R4 //(size -1) - step
	CMP R5, R6
	BLT InLoop
	
	ADD R4, R4, #1 //step++
	CMP R4, R0	
	BLT OutLoop
end:
    B end
	
	
LoopIf:
	MOV R8, R2
	MOV R2, R3
	MOV R3, R8
	STR R2, [R1,R5,LSL#2]
	STR R3, [R1,R7,LSL#2]
	B  IfEnd