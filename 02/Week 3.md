## HalfAdder
```Verilog
CHIP HalfAdder {
    IN a, b;    // 1-bit inputs
    OUT sum,    // Right bit of a + b 
        carry;  // Left bit of a + b

    PARTS:
    // Put you code here:
    And(a = a, b = b, out = carry);
    Xor(a = a, b = b, out = sum);

}
```  
## FullAdder
```Verilog
CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    // Put you code here:
    HalfAdder(a = a, b = b, sum = L1, carry = L2);
    HalfAdder(a = c, b = L1, sum = sum, carry = L3);
    Or(a = L2, b = L3, out = carry);
    
}
```  
## Add16
```Verilog
CHIP Add16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
   // Put you code here:
   FullAdder(a = a[0], b = b[0], sum = out[0], carry = L1);
   FullAdder(a = a[1], b = b[1], c = L1, sum = out[1], carry = L2);
   FullAdder(a = a[2], b = b[2], c = L2, sum = out[2], carry = L3);
   FullAdder(a = a[3], b = b[3], c = L3, sum = out[3], carry = L4);
   FullAdder(a = a[4], b = b[4], c = L4, sum = out[4], carry = L5);
   FullAdder(a = a[5], b = b[5], c = L5, sum = out[5], carry = L6);
   FullAdder(a = a[6], b = b[6], c = L6, sum = out[6], carry = L7);
   FullAdder(a = a[7], b = b[7], c = L7, sum = out[7], carry = L8);
   FullAdder(a = a[8], b = b[8], c = L8, sum = out[8], carry = L9);
   FullAdder(a = a[9], b = b[9], c = L9, sum = out[9], carry = L10);
   FullAdder(a = a[10], b = b[10], c = L10, sum = out[10], carry = L11);
   FullAdder(a = a[11], b = b[11], c = L11, sum = out[11], carry = L12);
   FullAdder(a = a[12], b = b[12], c = L12, sum = out[12], carry = L13);
   FullAdder(a = a[13], b = b[13], c = L13, sum = out[13], carry = L14);
   FullAdder(a = a[14], b = b[14], c = L14, sum = out[14], carry = L15);
   FullAdder(a = a[15], b = b[15], c = L15, sum = out[15], carry = L16);
}
```  
## Inc16
```Verilog
CHIP Inc16 {
    IN in[16];
    OUT out[16];

    PARTS:
   // Put you code here:
   Add16(a = in, b[0] = true, b[1..15] = false, out = out);
}
```
## HalfAdder (Nand ver)
```Verilog
CHIP HalfAdder {
    IN a, b;    // 1-bit inputs
    OUT sum,    // Right bit of a + b 
        carry;  // Left bit of a + b

    PARTS:
    // Put you code here:
    Nand(a = a, b = b, out = L1);
    Nand(a = L1, b = L1, out = carry);

    Nand(a = a, b = a, out = na);
    Nand(a = b, b = b, out = nb);
    Nand(a = na, b = nb, out = L2);
    Nand(a = L1, b = L2, out = L3);
    Nand(a = L3, b = L3, out = sum);
}
```  
# FullAdder (Nand ver)
```Verilog
CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    // Put you code here:
    Nand(a = a, b = b, out = nH1C);

    Nand(a = a, b = a, out = na);
    Nand(a = b, b = b, out = nb);
    Nand(a = na, b = nb, out = L1);
    Nand(a = nH1C, b = L1, out = nH1S);
    Nand(a = nH1S, b = nH1S, out = H1S);

    Nand(a = H1S, b = c, out = nH2C);

    Nand(a = c, b = c, out = nc);
    Nand(a = nH1S, b = nc, out = L2);
    Nand(a = L2, b = nH2C, out = nH2S);
    Nand(a = nH2S, b = nH2S, out = sum);

    Nand(a = nH1C, b = nH2C, out = carry);
}
```  
