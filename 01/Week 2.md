# Week 2  
## Not16
```Verilog
CHIP Not16 {
    IN in[16];
    OUT out[16];

    PARTS:
    // Put your code here:
    Not(in = in[0], out = out[0]);
    Not(in = in[1], out = out[1]);
    Not(in = in[2], out = out[2]);
    Not(in = in[3], out = out[3]);
    Not(in = in[4], out = out[4]);
    Not(in = in[5], out = out[5]);
    Not(in = in[6], out = out[6]);
    Not(in = in[7], out = out[7]);
    Not(in = in[8], out = out[8]);
    Not(in = in[9], out = out[9]);
    Not(in = in[10], out = out[10]);
    Not(in = in[11], out = out[11]);
    Not(in = in[12], out = out[12]);
    Not(in = in[13], out = out[13]);
    Not(in = in[14], out = out[14]);
    Not(in = in[15], out = out[15]);
}
```  
## Or16
```Verilog
CHIP Or16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
    // Put your code here:
    Or(a = a[0], b = b[0], out = out[0]);
    Or(a = a[1], b = b[1], out = out[1]);
    Or(a = a[2], b = b[2], out = out[2]);
    Or(a = a[3], b = b[3], out = out[3]);
    Or(a = a[4], b = b[4], out = out[4]);
    Or(a = a[5], b = b[5], out = out[5]);
    Or(a = a[6], b = b[6], out = out[6]);
    Or(a = a[7], b = b[7], out = out[7]);
    Or(a = a[8], b = b[8], out = out[8]);
    Or(a = a[9], b = b[9], out = out[9]);
    Or(a = a[10], b = b[10], out = out[10]);
    Or(a = a[11], b = b[11], out = out[11]);
    Or(a = a[12], b = b[12], out = out[12]);
    Or(a = a[13], b = b[13], out = out[13]);
    Or(a = a[14], b = b[14], out = out[14]);
    Or(a = a[15], b = b[15], out = out[15]);
}
```  
## Or8way
```Verilog
CHIP Or8Way {
    IN in[8];
    OUT out;

    PARTS:
    // Put your code here:
    Or(a = in[0], b = in[1], out = L1);
    Or(a = in[2], b = in[3], out = L2);
    Or(a = in[4], b = in[5], out = L3);
    Or(a = in[6], b = in[7], out = L4);
    Or(a = L1, b = L2, out = L5);
    Or(a = L3, b = L4, out = L6);
    Or(a = L5, b = L6, out = out);
}
```  
## Mux16
```Verilog
CHIP Mux16 {
    IN a[16], b[16], sel;
    OUT out[16];

    PARTS:
    // Put your code here:
    Mux(a = a[0], b = b[0], sel = sel, out = out[0]);
    Mux(a = a[1], b = b[1], sel = sel, out = out[1]);
    Mux(a = a[2], b = b[2], sel = sel, out = out[2]);
    Mux(a = a[3], b = b[3], sel = sel, out = out[3]);
    Mux(a = a[4], b = b[4], sel = sel, out = out[4]);
    Mux(a = a[5], b = b[5], sel = sel, out = out[5]);
    Mux(a = a[6], b = b[6], sel = sel, out = out[6]);
    Mux(a = a[7], b = b[7], sel = sel, out = out[7]);
    Mux(a = a[8], b = b[8], sel = sel, out = out[8]);
    Mux(a = a[9], b = b[9], sel = sel, out = out[9]);
    Mux(a = a[10], b = b[10], sel = sel, out = out[10]);
    Mux(a = a[11], b = b[11], sel = sel, out = out[11]);
    Mux(a = a[12], b = b[12], sel = sel, out = out[12]);
    Mux(a = a[13], b = b[13], sel = sel, out = out[13]);
    Mux(a = a[14], b = b[14], sel = sel, out = out[14]);
    Mux(a = a[15], b = b[15], sel = sel, out = out[15]);
}
```  
## Mux4Way16
```Verilog
CHIP Mux4Way16 {
    IN a[16], b[16], c[16], d[16], sel[2];
    OUT out[16];

    PARTS:
    // Put your code here:
    Mux16(a = a, b = b, sel = sel[0], out = outab);
    Mux16(a = c, b = d, sel = sel[0], out = outcd);
    Mux16(a = outab, b = outcd, sel = sel[1], out = out);
}
```  
## Mux8Way16
```Verilog
CHIP Mux8Way16 {
    IN a[16], b[16], c[16], d[16],
       e[16], f[16], g[16], h[16],
       sel[3];
    OUT out[16];

    PARTS:
    // Put your code here:
    Mux4Way16(a = a, b = b, c = c, d = d, sel =  sel[0..1], out = outabcd);
    Mux4Way16(a = e, b = f, c = g, d = h, sel = sel[0..1], out = outefgh);
    Mux16(a = outabcd, b = outefgh, sel = sel[2], out = out);
}
```  
