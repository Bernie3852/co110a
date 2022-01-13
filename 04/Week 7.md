# Week 7
## Mult.asm
```Verilog
@0
D=M
@12
D, JLE
@1
D=M
@2
M=M+D
@0
M=M-1
D=M
@4
D, JGT
```  
## Fill.asm
```Verilog
//The screen ptr save at 0
//The sereen end save at 1
//The selected color save at 2

@14         //jump to program start point
0; JMP

@24576      //color selecter
D=M-1
@10
D; JGE
@2
M=0
@24
0; JMP
@2
M=-1
@24
0; JMP


@24575      //program start point
D=A
@0
M=D
@16384
D=A
@1
M=D

@2          //jump to color selecter
0; JMP

@2          //filling screen
D=M
@1
A=M
M=D
@1
M=M+1
D=M
@0
D=M-D
@24
D; JGE

@14          //loop back to program start point
0; JMP
```  
