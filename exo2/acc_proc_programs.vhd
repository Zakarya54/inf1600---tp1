use work.acc_proc_def.all;

package acc_proc_programs is

   -- Le contenu de la memoire est uint16, 
   -- ce qui explique l'utilisation de fonctions
   -- de conversion

   -- Programme utilise pour les questions 1, 2 et 3 (bonus)
   constant program_0 : memtype := (
      
      to_uint16((ld,   7)),   --  0  1
      to_uint16((mul, 10)),   --  1  -1
      to_uint16((add,  8)),   --  2  -3
      to_uint16((mul, 10)),   --  3  3
      to_uint16((add,  9)),   --  4  5
      to_uint16((st,  11)),   --  5  
      to_uint16((stop, 0)),   --  6 
      +1,                     --  7 : a
      int16_to_uint16(-2),    --  8 : b
      +2,                     --  9 : c      
      int16_to_uint16(-1),    -- 10 : x
      int16_to_uint16(0),     -- 11 : y
      others => 0
   );
   --M[11] =  (1 * -1)+ -2)* -1) + 2) = 5
   --M[11] =  (1 * (-1)^2 + (-2)*(-1) + 2)
   --        a = 1; b = -2; c = 2
   --        x1 = 1 + i; x2 = 1 - i
   --        ax^2 + bx + c
   --      =  (0x0001 * 0xFFFF)+ 0xFFFC)* 0xFFFF)+ 0x0010)
   --      =   -2 + 2 = 0 ==> 0x0000
-- 0x0000 = 0x0000 = 0x0307
-- 0x0001 = 0x0001 = 0x010A
-- 0x0010 = 0x0002 = 0x0008
-- 0x0011 = 0x0003 = 0x010A
-- 0x0100 = 0x0004 = 0x0009
-- 0x0101 = 0x0005 = 0x020B
-- 0x0110 = 0x0006 = 0x0400
-- 0x0111 = 0x0007 = 0x0001
-- 0x1000 = 0x0008 = 0x40A9
-- 0x1001 = 0x0009 = 0x0002
-- 0x1010 = 0x000A = 0xFFFF
-- 0x1011 = 0x000B = 0X0000
-- 0x1100 = 0x000C = 0x0000
-- 0x1101 = 0x000D = 0x0000
-- 0x1110 = 0x000E = 0x0000
-- 0x1111 = 0x000F = 0x0000
-- 0x000F = 0000 0000 0000 1111
    
   -- Programme utilise pour Q4 & Q5
   constant program_1 : memtype := (
      -- ECRIRE VOTRE PROGRAMME ICI
      -- UNE LIGNE PAR INSTRUCTION   s(n+2) = 1 + s(n+1) + s(n)
      to_uint16((ld,17)),     --0    s(2) = 1 + s(1) + s(0)
      to_uint16((add,19)),    --1
      to_uint16((add,18)),    --2
      to_uint16((st,20)),     --3

      to_uint16((ld,17)),     --4    s(3) = 1 + s(2) + s(1)
      to_uint16((add,20)),    --5
      to_uint16((add,19)),    --6
      to_uint16((st,21)),     --7

      to_uint16((ld,17)),     --8    s(4) = 1 + s(3) + s(2)
      to_uint16((add,21)),    --9
      to_uint16((add,20)),    --10
      to_uint16((st,22)),     --11

      to_uint16((ld,17)),     --12   s(5) = 1 + s(4) + s(3)
      to_uint16((add,22)),    --13
      to_uint16((add,21)),    --14
      to_uint16((st,23)),     --15


      to_uint16((stop, 0)),    -- FIN     --16

      +1,                                 --17
      +1,                      -- S(0)    --18
      +2,                      -- S(1)    --19
      +4,                      -- S(2)    --20
      +7,                      -- S(3)    --21
      +12,                     -- S(4)    --22
      +20,                     -- S(5)    --23
      others => 0
   );
   
end acc_proc_programs;

package body acc_proc_programs is  
end acc_proc_programs;
