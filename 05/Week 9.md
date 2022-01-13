# Week 9
## Memory
```Verilog
CHIP Memory {
    IN in[16], load, address[15];
    OUT out[16];

    PARTS:
    // Put your code here:

    // 110 0000 0000 0000

    // 00 01 10 11
    DMux4Way(in=load, sel=address[13..14], a=S1, b=S2, c=S3, d=S4);
    Or(a=S1, b=S2, out = S0);

    RAM16K(in=in, load=S0, address=address[0..13]], out=O0, out=O1);

    DMux(in=S3, sel=address[12], a=S30, b=S31);
    RAM4K(in=in, load=S30, address=address[0..11], out=O20);
    RAM4K(in=in, load=S31, address=address[0..11], out=O21);
    Mux16(a=O20, b=O21, sel=address[12], out=O2);

    Register(in=in, load=S4, out=O3);

    Mux4Way16(a=O0, b=O1, c=O2, d=O3, sel=address[13..14], out=out);
}
## Computer
```Verilog
CHIP Computer {

    IN reset;

    PARTS:
    // Put your code here:
    CPU(instruction=instructionR, reset=reset, inM=MemOut, writeM=CPUw, outM=CPUOut, addressM=CPUAddress, pc=AL);
    Memory(in=CPUOut, load=CPUw, address=CPUAddress, out=MemOut);
    ROM32K(address=AL, out=instructionR);

}
```  
## ComputerAdd.out
```
| time |reset|ARegister|DRegister|PC[]|RAM16K[0]|RAM16K[1]|RAM16K[2]|
| 0    |  0  |       0 |       0 |   0|       0 |       0 |       0 |
| 1    |  0  |       2 |       0 |   1|       0 |       0 |       0 |
| 2    |  0  |       2 |       2 |   2|       0 |       0 |       0 |
| 3    |  0  |       3 |       2 |   3|       0 |       0 |       0 |
| 4    |  0  |       3 |       5 |   4|       0 |       0 |       0 |
| 5    |  0  |       0 |       5 |   5|       0 |       0 |       0 |
| 6    |  0  |       0 |       5 |   6|       5 |       0 |       0 |
| 7    |  1  |       0 |       5 |   0|       0 |       0 |       0 |
| 8    |  0  |       2 |       5 |   1|       0 |       0 |       0 |
| 9    |  0  |       2 |       2 |   2|       0 |       0 |       0 |
| 10   |  0  |       3 |       2 |   3|       0 |       0 |       0 |
| 11   |  0  |       3 |       5 |   4|       0 |       0 |       0 |
| 12   |  0  |       0 |       5 |   5|       0 |       0 |       0 |
| 13   |  0  |       0 |       5 |   6|       5 |       0 |       0 |
```  
## ComputerMax.out
```
| time |reset|ARegister|DRegister|PC[]|RAM16K[0]|RAM16K[1]|RAM16K[2]|
| 0    |  0  |       0 |       0 |   0|       3 |       5 |       0 |
| 1    |  0  |       0 |       0 |   1|       3 |       5 |       0 |
| 2    |  0  |       0 |       3 |   2|       3 |       5 |       0 |
| 3    |  0  |       1 |       3 |   3|       3 |       5 |       0 |
| 4    |  0  |       1 |      -2 |   4|       3 |       5 |       0 |
| 5    |  0  |      10 |      -2 |   5|       3 |       5 |       0 |
| 6    |  0  |      10 |      -2 |   6|       3 |       5 |       0 |
| 7    |  0  |       1 |      -2 |   7|       3 |       5 |       0 |
| 8    |  0  |       1 |       5 |   8|       3 |       5 |       0 |
| 9    |  0  |      12 |       5 |   9|       3 |       5 |       0 |
| 10   |  0  |      12 |       5 |  12|       3 |       5 |       0 |
| 11   |  0  |       2 |       5 |  13|       3 |       5 |       0 |
| 12   |  0  |       2 |       5 |  14|       3 |       5 |       5 |
| 13   |  0  |      14 |       5 |  15|       3 |       5 |       5 |
| 14   |  0  |      14 |       5 |  14|       3 |       5 |       5 |
| 15   |  1  |      14 |       5 |   0|       3 |       5 |       5 |
| 15   |  0  |      14 |       5 |   0|   23456 |   12345 |       5 |
| 16   |  0  |       0 |       5 |   1|   23456 |   12345 |       5 |
| 17   |  0  |       0 |   23456 |   2|   23456 |   12345 |       5 |
| 18   |  0  |       1 |   23456 |   3|   23456 |   12345 |       5 |
| 19   |  0  |       1 |   11111 |   4|   23456 |   12345 |       5 |
| 20   |  0  |      10 |   11111 |   5|   23456 |   12345 |       5 |
| 21   |  0  |      10 |   11111 |  10|   23456 |   12345 |       5 |
| 22   |  0  |       0 |   11111 |  11|   23456 |   12345 |       5 |
| 23   |  0  |       0 |   23456 |  12|   23456 |   12345 |       5 |
| 24   |  0  |       2 |   23456 |  13|   23456 |   12345 |       5 |
| 25   |  0  |       2 |   23456 |  14|   23456 |   12345 |   23456 |

```  
## ComputerRect.out
```
| time |
| 0    |
| 1    |
| 2    |
| 3    |
| 4    |
| 5    |
| 6    |
| 7    |
| 8    |
| 9    |
| 10   |
| 11   |
| 12   |
| 13   |
| 14   |
| 15   |
| 16   |
| 17   |
| 18   |
| 19   |
| 20   |
| 21   |
| 22   |
| 23   |
| 24   |
| 25   |
| 26   |
| 27   |
| 28   |
| 29   |
| 30   |
| 31   |
| 32   |
| 33   |
| 34   |
| 35   |
| 36   |
| 37   |
| 38   |
| 39   |
| 40   |
| 41   |
| 42   |
| 43   |
| 44   |
| 45   |
| 46   |
| 47   |
| 48   |
| 49   |
| 50   |
| 51   |
| 52   |
| 53   |
| 54   |
| 55   |
| 56   |
| 57   |
| 58   |
| 59   |
| 60   |
| 61   |
| 62   |
| 63   |
```  
