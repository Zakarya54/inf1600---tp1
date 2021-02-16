use work.acc_proc_def.all;

package acc_proc_programs is

   -- Le contenu de la memoire est uint16, 
   -- ce qui explique l'utilisation de fonctions
   -- de converssion
   constant program_0 : memtype := (
      to_uint16((ld,   7)),   --  0  ACC = [7] = 2
      to_uint16((br,   3)),   --  1  PC  =  address(3)
      to_uint16((ld,   8)),   --  2  
      to_uint16((brz,  5)),   --  3  IF (ACC == 0) PC = address (5) 
      to_uint16((add,  9)),   --  4  2 + (-1) = 1  / 1 + (-1) = 0
      to_uint16((brnz, 1)),   --  5  IF (ACC != 0) PC = address(1) 
      to_uint16((stop, 0)),   --  6  Stop ACC = 0
      +2,                     --  7
      +1,                     --  8
      int16_to_uint16(-1),    --  9
      others => 0
   );

--- dans le program_0, on la valeur 0 dans l'accumulateur

   -- Programme utilise pour Q2
   constant program_1 : memtype := (
      -- ajouter votre programme ici, une ligne par instruction
      to_uint16((lda,29)),                                     --0    MA = Adresse de X             MA = 29
      to_uint16((ldi,0)),                                      --1    ACC = contenu MA = [[29]]     ACC = s(0) = 1
      to_uint16((adda,31)),                                    --2    MA = MA + 1                   MA = 30
      to_uint16((addx,0)),                                     --3    ACC = ACC + s(1)              ACC = s(0) + s(1) = 1 + 2 = 3
      to_uint16((add,31)),
      to_uint16((adda,31)),                                    --4    MA = MA + 1                   MA = 30 +1 = 31       
      to_uint16((sti,0)),                                      --5    [[MA]] = ACC         
      
      to_uint16((suba,31)),                                   --6   MA = MA - 1

         ---Boucle { 

      to_uint16((ld,28)),                                      --7
      to_uint16((sub,31)),                                     --8
      to_uint16((st,28)),                                      --9
      to_uint16((brnz,1)),                                     --10

      0, --11
      0, --12
      0, --13
      0, --14
      0, --15
      0, --16
      0, --17
      0, --18
      0, --19
      0, --20
      0, --21
      0, --22
      0, --23
      0, --24
      0, --25
     

      to_uint16((stop, 0 )),                 --27                                   
      +6,                                    --28   compteur                      
      32,                                    --29   Adresse de X                    
      33,                                    --30   Adresse de Y
      +1,                                    --31   valeur 1
      +1,                                    --32   s(0)  1
      +2,                                    --33   s(1)  2
      0,                                     --34   s(2)  4 
      0,                                     --35   s(3)  7
      0,                                     --36   s(4)  12
      0,                                     --37   s(5)
   others => 0
   );
   
end acc_proc_programs;

package body acc_proc_programs is  
end acc_proc_programs;