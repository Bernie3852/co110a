# Week 5
## Bit
```Verilog
CHIP Bit {
    IN in, load;
    OUT out;

    PARTS:
    // Put your code here:
    Mux(a = DFFout, b = in, sel = load, out = MUXout);
    DFF(in = MUXout, out = DFFout, out = out);
}
```  
## Register
```Verilog
CHIP Register {
    IN in[16], load;
    OUT out[16];

    PARTS:
    // Put your code here:
    Bit(in = in[0], load = load, out = out[0]);
    Bit(in = in[1], load = load, out = out[1]);
    Bit(in = in[2], load = load, out = out[2]);
    Bit(in = in[3], load = load, out = out[3]);
    Bit(in = in[4], load = load, out = out[4]);
    Bit(in = in[5], load = load, out = out[5]);
    Bit(in = in[6], load = load, out = out[6]);
    Bit(in = in[7], load = load, out = out[7]);
    Bit(in = in[8], load = load, out = out[8]);
    Bit(in = in[9], load = load, out = out[9]);
    Bit(in = in[10], load = load, out = out[10]);
    Bit(in = in[11], load = load, out = out[11]);
    Bit(in = in[12], load = load, out = out[12]);
    Bit(in = in[13], load = load, out = out[13]);
    Bit(in = in[14], load = load, out = out[14]);
    Bit(in = in[15], load = load, out = out[15]);
}
```  
## RAM8
```Verilog
CHIP RAM8 {
    IN in[16], load, address[3];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in = load, sel = address, a = L0, b = L1, c = L2, d = L3, e = L4, f = L5, g = L6, h = L7);

    Register(in = in, load = L0, out = R0);
    Register(in = in, load = L1, out = R1);
    Register(in = in, load = L2, out = R2);
    Register(in = in, load = L3, out = R3);
    Register(in = in, load = L4, out = R4);
    Register(in = in, load = L5, out = R5);
    Register(in = in, load = L6, out = R6);
    Register(in = in, load = L7, out = R7);

    Mux8Way16(a = R0, b = R1, c = R2, d = R3, e = R4, f = R5, g = R6, h = R7, sel = address, out = out);
}
```  
