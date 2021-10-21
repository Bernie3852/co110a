// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//流程控制指令

//螢幕範圍為16384 ~ 24575
//讀取24576就能知道鍵盤有沒有輸入

// Put your code here.

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