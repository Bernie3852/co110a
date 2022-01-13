# Week 8
## CPU
```Verilog
CHIP CPU {

    IN  inM[16],         // M value input  (M = contents of RAM[A])
        instruction[16], // Instruction for execution               //111accccccdddjjj
        reset;           // Signals whether to re-start the current
                         // program (reset==1) or continue executing
                         // the current program (reset==0).

    OUT outM[16],        // M value output
        writeM,          // Write to M? 
        addressM[15],    // Address in data memory (of M)
        pc[15];          // address of next instruction

    PARTS:
    // Put your code here:

    Not(in=instruction[15], out=ni);
    Mux16(a=ALUout, b=instruction, sel=ni, out=MuxToARegister);

    Or(a=ni, b=instruction[5], out=ToA);
    ARegister(in=MuxToARegister, load=ToA, out=Aout, out[0..14]=addressM);
    And(a=instruction[15], b=instruction[4], out=ToD);
    DRegister(in=ALUout, load=ToD,out=Dout);
    And(a=instruction[15], b=instruction[12], out=AMS);
    Mux16(a=Aout, b=inM, sel=AMS,out=MuxToALU);
    ALU(x=Dout, y=MuxToALU, zx=instruction[11], nx=instruction[10], zy=instruction[9], ny=instruction[8], f=instruction[7], no=instruction[6], out=outM, out=ALUout, zr=zr, ng=ng);
    And(a=instruction[15], b=instruction[3], out=writeM);   //Write to M

    Not(in=ng, out=ps);                         //positive
    Not(in=zr, out=nzr);
    And(a=ps, b=nzr, out=psnzr);                //positive not zero
    And(a=instruction[0], b=psnzr, out = S0);   //positive match
    And(a=instruction[1], b=zr, out = S1);      //zero match
    And(a=instruction[2], b=ng, out = S2);      //negative match
    Or(a=S0, b=S1, out=S01);
    Or(a=S01, b=S2, out=ToPC);

    And(a=instruction[15], b=ToPC, out=PCload);
    PC(in=Aout, load=PCload, inc=true, reset=reset, out[0..14]=pc);
}
```  
