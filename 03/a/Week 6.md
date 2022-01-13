# Week 6
## RAM64
```Verilog
CHIP RAM64 {
    IN in[16], load, address[6];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in = load, sel = address[0..2], a = L0, b = L1, c = L2, d = L3, e = L4, f = L5, g = L6, h = L7);

    RAM8(in = in, load = L0, address = address[3..5], out = R0);
    RAM8(in = in, load = L1, address = address[3..5], out = R1);
    RAM8(in = in, load = L2, address = address[3..5], out = R2);
    RAM8(in = in, load = L3, address = address[3..5], out = R3);
    RAM8(in = in, load = L4, address = address[3..5], out = R4);
    RAM8(in = in, load = L5, address = address[3..5], out = R5);
    RAM8(in = in, load = L6, address = address[3..5], out = R6);
    RAM8(in = in, load = L7, address = address[3..5], out = R7);

    Mux8Way16(a = R0, b = R1, c = R2, d = R3, e = R4, f = R5, g = R6, h = R7, sel = address[0..2], out = out);
}
```  
## RAM512
```Verilog
CHIP RAM512 {
    IN in[16], load, address[9];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in = load, sel = address[0..2], a = L0, b = L1, c = L2, d = L3, e = L4, f = L5, g = L6, h = L7);

    RAM64(in = in, load = L0, address = address[3..8], out = R0);
    RAM64(in = in, load = L1, address = address[3..8], out = R1);
    RAM64(in = in, load = L2, address = address[3..8], out = R2);
    RAM64(in = in, load = L3, address = address[3..8], out = R3);
    RAM64(in = in, load = L4, address = address[3..8], out = R4);
    RAM64(in = in, load = L5, address = address[3..8], out = R5);
    RAM64(in = in, load = L6, address = address[3..8], out = R6);
    RAM64(in = in, load = L7, address = address[3..8], out = R7);

    Mux8Way16(a = R0, b = R1, c = R2, d = R3, e = R4, f = R5, g = R6, h = R7, sel = address[0..2], out = out);
}
```  
## RAM4K
```Verilog
CHIP RAM4K {
    IN in[16], load, address[12];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in = load, sel = address[0..2], a = L0, b = L1, c = L2, d = L3, e = L4, f = L5, g = L6, h = L7);

    RAM512(in = in, load = L0, address = address[3..11], out = R0);
    RAM512(in = in, load = L1, address = address[3..11], out = R1);
    RAM512(in = in, load = L2, address = address[3..11], out = R2);
    RAM512(in = in, load = L3, address = address[3..11], out = R3);
    RAM512(in = in, load = L4, address = address[3..11], out = R4);
    RAM512(in = in, load = L5, address = address[3..11], out = R5);
    RAM512(in = in, load = L6, address = address[3..11], out = R6);
    RAM512(in = in, load = L7, address = address[3..11], out = R7);

    Mux8Way16(a = R0, b = R1, c = R2, d = R3, e = R4, f = R5, g = R6, h = R7, sel = address[0..2], out = out);
}
```  
## RAM16K
```Verilog
CHIP RAM16K {
    IN in[16], load, address[14];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux4Way(in = load, sel = address[0..1], a = L0, b = L1, c = L2, d = L3);

    RAM4K(in = in, load = L0, address = address[2..13], out = R0);
    RAM4K(in = in, load = L1, address = address[2..13], out = R1);
    RAM4K(in = in, load = L2, address = address[2..13], out = R2);
    RAM4K(in = in, load = L3, address = address[2..13], out = R3);

    Mux4Way16(a = R0, b = R1, c = R2, d = R3, sel = address[0..1], out = out);
}
```  
## PC
```Verilog
CHIP PC {
    IN in[16],load,inc,reset;
    OUT out[16];

    PARTS:
    // Put your code here:
    
    Inc16(in = Regout, out = RegoutPlusOne);

    Mux16(a = in, b = RegoutPlusOne, sel = inc, out = L1);
    Mux16(a = L1, b = in, sel = load, out = L2);
    Mux16(a = L2, b = false, sel = reset, out = Regin);
    
    Register(in = Regin, load = true, out = Regout, out = out);
}
```  
