# Week 1  
## Not
```Verilog
CHIP Not {  
    IN in;
    OUT out;
    
    PARTS:
    // Put your code here:
    Nand(a=in, b=in, out=out);
}  
```  
## And  
```Verilog
CHIP And {
    IN a, b;
    OUT out;
    
    PARTS:
    // Put your code here:
    Nand(a=a, b=b, out=ab);
    Not(in=ab, out=out);
}
```  
## Or
```Verilog
CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in = a, out = L1);
    Not(in = b, out = L2);
    And(a = L1, b = L2, out = L3);
    Not(in = L3, out = out);    
}
```  
## Mux
```Verilog
CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in = sel, out = L1);
    And(a = a, b = L1, out = L2);
    And(a = b, b = sel, out = L3);
    Or(a = L2, b = L3, out = out);
}
```  
## DMux
```Verilog
CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    // Put your code here:
    Not(in = sel, out = L1);
    And(a = in, b = L1, out = a);
    And(a = in, b = sel, out = b);
}
```  
## Or (Nand ver)
```Verilog
CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a = a, b = a, out = L1);
    Nand(a = b, b = b, out = L2);
    Nand(a = L1, b = L2, out = out);
}
```  
## Xor (Nand ver)
```Verilog
CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a = a, b = a, out = na);
    Nand(a = b, b = b, out = nb);
    Nand(a = na, b = nb, out = L1);

    Nand(a = a, b = b, out = L2);

    Nand(a = L1, b = L2, out = L3);
    Nand(a = L3, b = L3, out = out);
    
}
```  
