use work.acc_proc_def.all;

package acc_proc_programs is

   -- Le contenu de la memoire est uint16, 
   -- ce qui explique l'utilisation de fonctions
   -- de converssion
   constant program_0 : memtype := (
      to_uint16((ld,   7)),   --  0  ACC = [7] = 2
      to_uint16((br,   3)),   --  1  PC  =  address(3)
      to_uint16((ld,   8)),   --  2  
      to_uint16((brz,  5)),   --  3  IF (ACC = 0) PC = address (5) 
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
      -- ajouter votre programme ici, une ligne par instruction         --  s(n+2) = 1 + s(n+1) + s(n)
      to_uint16((ld,  22)),                 --1    ACC = 1                                
      to_unit16((brz, 21)),                 --2   (ACC = 0) PC = address ( ....)          

      to_uint16((ld,  22)),                 --1                                        
      to_unit16((add, 23)),                 --3                                          
      to_unit16((add, 24)),                 --4                                          
      to_unit16((sti, 26)),                 --5                                          

      to_uint16((ld,  25)),                 --1                                          
      to_unit16((sub, 22)),                                                               
      --decrementer compteur                --                                          
      to_unit16((brz, 21)),                 --11   F (ACC = 0) PC = address (...)       
      to_unit16((sti, 25)),                 --10

      to_uint16((ld,  24)),                 --11
      to_unit16((add, 22)),                 --12
      to_unit16((add, 24))                  --13
      to_unit16((sti, 24)),                 --14

      to_uint16((ld,  25)),                 --15
      to_unit16((sub, 22)),                 --16
      --decrementer compteur                                                     
      to_unit16((brz, 21)),                 --17   (ACC = 0) PC = address ( ....)        
      to_unit16((sti, 25)),                 --18
      to_unit16((br,  2)),                  --19

      

      
      to_uint16((stop, 0)),                  --20
      to_uint16((stop, 0)),    -- FIN        --21
      +1,                      -- 1          --22
      +1,                      -- S(0)       --23
      +2,                      -- S(1)       --24
      +5,                      -- comp       --25
                               -- S(2)       --26
                               -- S(3)       --27
                               -- S(4)       --28
                               -- S(5)       --29
   );
   
end acc_proc_programs;

package body acc_proc_programs is  
end acc_proc_programs;