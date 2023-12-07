# Tutorial 4

## Tutorial questions

Here are questions that will be solved during the tutorial.

### Question 1. Sum two in-memory values

Consider the following incomplete code snippet.
Modify it to sum the values in locations `x` and `y`.
Ensure the result is stored to the location `result`.

```arm
.global _start
x: .word 10
y: .word 20
result: .word 0
_start:
  // TODO here
```

Potentially useful instructions: `LDR`, `STR`.

Notes:

*  `.global label` is a directive to "export" a label. In our case, we apply it on `_start` so that the program begins at the correct address.
*  `.word N` is a directive to fill the value `N` as a 32-bit word at the current address. In our case, the sample snippet uses this to initialize the values at memory locations `x`, `y`, `result` to `10`, `20`, and `0` respectively.

### Question 2. Translate C-like code into ARM assembly

Consider the following program that calculates the maximum of two values.
Rewrite it into ARM assembly code that uses both conditional and unconditional branches.
Assume all variables are in memory (location is known).

```c
int max_value() {
  int gn = 0;
  int x = 4;
  int y = 8;

  if (x < y) {
    gn = y;
  } else {
    gn = x;
  }

  return gn;
}
```

Potentially useful instructions: `B`, `BLT`, `BGE`, `CMP`.

### Question 3. Sum the values 0 to n

Consider the following incomplete code snippet.
Modify it to sum the values in range [0, n) using a loop
(n is a __signed__ value).
Ensure the result is stored to the location `result`.

```arm
.global _start
n: .word 10      // treat n as signed
result: .word 0
_start:
  // TODO here
```

Potentially useful instructions: `B`, `BGE`, `BLT`, `BLE`, `BGT`, `CMP`.

### Question 4. Bitwise instructions

Consider the following code snippet.
Track the values of R0 and R1 after each instruction.
Describe what happens to the values in R0 and R1 after the three `EOR` instructions.

```arm
.global _start
_start:
  MOV R0, #11
  MOV R1, #13
  EOR R0, R0, R1
  EOR R1, R0, R1
  EOR R0, R0, R1
```

### Question 5. Identifying purpose of assembly code

Consider the following code snippet.
Report the final value of R0 and explain what does the program achieve.

```arm
.global _start
_start:
  MOV R0, #10
  MOV R1, #12
_lbl1:
  CMP R0, R1
  BEQ _end
  BLT _lbl2
  SUB R0, R0, R1
  B _lbl1
_lbl2:
  SUB R1, R1, R0
  B _lbl1
_end:
```

### Question 6. Memory addressing with offsets

For each of the following (independent) instructions,
determine the effective memory address
(in terms of R2 and R3, if applicable)
whose content will be stored in R1.
Also indicate if any registers (other than R1) are modified by the instruction.

```arm
LDR R1, [R2, #4]

LDR R1, [R2, R3]

LDR R1, [R2, R3, LSL #2]

LDR R1, [R2, R3, LSL #2]!
```

### Question 7. Array access

Consider the following code snippet.
Identify the content of `out`
(by interpreting it as a 4-element word array)
after the program has reached `_end`.

```arm
.global _start

arr: .word 3, 6, 4, 7
out: .space 16          // reserve 16 bytes for out

_start:
  LDR R0, =arr
  LDR R1, =out
  ADD R0, R0, #12
  MOV R2, #4
_loop:
  LDR R3, [R0]
  STR R3, [R1], #4
  SUB R0, R0, #4
  SUB R2, R2, #1
  CMP R2, #0
  BNE _loop
_end:
```

Notes:

*  `.space N` is a directive to reserve `N` bytes starting from the current address. In our case, we use this because we don't care about the initial values of `out`, but we could have done `.word 0, 0, 0, 0` if we wanted to initialize all four elements to zero.
