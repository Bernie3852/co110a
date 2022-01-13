# Week 4
## ALU
```Verilog
CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute out = x + y (if 1) or x & y (if 0)
        no; // negate the out output?

    OUT 
        out[16], // 16-bit output
        zr, // 1 if (out == 0), 0 otherwise
        ng; // 1 if (out < 0),  0 otherwise

    PARTS:
   // Put you code here:

   //part out
   Mux16(a = x, sel = zx, out = x1);
   Mux16(a = y, sel = zy, out = y1);
   Not16(in = x1, out = nx1);
   Not16(in = y1, out = ny1);
   Mux16(a = x1, b = nx1, sel = nx, out = x2);
   Mux16(a = y1, b = ny1, sel = ny, out = y2);
   Add16(a = x2, b = y2, out = outxPy);
   And16(a = x2, b = y2, out = outxAy);
   Mux16(a = outxAy, b = outxPy, sel = f, out = preout);
   Not16(in = preout, out = npreout);
   Mux16(a = preout, b = npreout, sel = no, out[0..7] = outF8, out[8..15] = outR8, out[15] = sign, out = out);

   //part zr
   Or8Way(in = outF8, out = outO8W0);
   Or8Way(in = outR8, out = outO8W1);
   Or(a = outO8W0, b = outO8W1, out = nzr);
   Not(in = nzr, out = zr);

   //part ng
   Or(a = sign, out = ng);
   
}
```  
