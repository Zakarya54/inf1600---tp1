#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "exo1.h"

short parity(const short c){  
   short p = 0;  
   
   // Completer la fonction ici
   for (int i = 0 ; i < 16 ; i++){ 
      if (c & (1 << i) && p == 0){ 
         p = 1;
      }
      else if (c & (1 << i)){
         p = 0;
      }
   }
   return p;
}

short hamming_encoding(const char c){
   short code = 0;

   code |= (c & 1) << 2; 
   code |= (c & 14) << 3;
   code |= (c & 240) << 4;
   
   short p0_param = 0x5554 & code; // 0b 0101 0101 0101 0100
   short p1_param = 0x6664 & code; // 0b 0110 0110 0110 0100
   short p2_param = 0x7870 & code; // 0b 0111 1000 0111 0000
   short p3_param = 0x7F00 & code; // 0b 0111 1111 0000 0000 

   short p0 = parity(p0_param);
   short p1 = parity(p1_param);
   short p2 = parity(p2_param);
   short p3 = parity(p3_param);

   code |= p0 | (p1 << 1) | (p2 << 3) | (p3 << 7);
   
   return code;
}

char hamming_decoding(const short c){   
   
   short c0 = parity(0x5555 & c); // 0b0101 0101 0101 0101
   short c1 = parity(0x6666 & c); // 0b0110 0110 0110 0110
   short c2 = parity(0x7878 & c); // 0b0111 1000 0111 1000
   short c3 = parity(0x7F80 & c); // 0b0111 1111 1000 0000

   short c0c1c2c3 = c0 | (c1 << 1) | (c2 << 2) | (c3 << 3);
   short cc = c;

   if (c0c1c2c3 != 0){
      short inverseur = (1 << (c0c1c2c3 - 1));
      cc ^= inverseur;
   }
   
   char code = 0;
   code |= (cc & 0x0004) >> 2;
   code |= (cc & 0x0070) >> 3;
   code |= (cc & 0x0F00) >> 4;
   
   return code;
}

