sobel:
	CMP R2,#2
	BLE end
	PUSH {LR}
	MOV R11, R1
	
	
	SUB R10, R2, #2 //size = size - 2
	
	
	MOV R4, #0 //j = 0
OutLoop:

	MOV R5, #0 //i = 0
InLoop:

	//get R8 as the coordinate
	MUL R8, R4, R2		//j*size
	ADD R8, R8, R5		// j*size + i
	LSL R8, R8, #2		// ( j*size + i ) x 4
	//------------------------------------
	B  FUN


FUNEnd:
	ADD R5, R5, #1 // i++
	CMP R5, R10	 // while i < size - 2
	BLT InLoop
	

	ADD R4, R4, #1 // j++
	CMP R4, R10	//while j < size - 2
	BLT OutLoop
	
	
	POP {LR}
    BX LR
	
	
	
	
	
	
FUN:
	PUSH {R4-R7}
	MOV R3, #0		//total = 0
	ADD R4, R0, R8 // im[i,j] = base + ( j*size + i ) x 4 
	LDR R5, [R4]  // the value at im[i,j]
	ADD R3, R3, R5	//total += im[i,j]
	
	ADD R4, R4, #8 // im[i+2,j]
	LDR R5, [R4]  // the value at im[i+2,j]
	SUB R3, R3, R5	//total -= im[i+2,j]
	
	ADD R4, R4, R10, LSL#2 //im[i,j+1]
	LDR R5, [R4]  // the value at im[i,j+1]
	ADD R3, R3, R5 //total -= im[,j+1]
	ADD R3, R3, R5 //add twice
	
	ADD R4, R4, #8 //im[i+2,j+1]
	LDR R5, [R4]  
	SUB R3, R3, R5 //minus twice
	SUB R3, R3, R5
	
	
	ADD R4, R4, R10, LSL#2 //im[i,j+2]
	LDR R5, [R4]
	ADD R3, R3, R5 

	
	ADD R4, R4, #8 //im[i+2,j+2]
	LDR R5, [R4]  
	SUB R3, R3, R5 
	
	STR R3, [R11]
	ADD R11, R11, #4
	
	POP  {R4-R7}
	B  FUNEnd
	


	
	
	
	
	