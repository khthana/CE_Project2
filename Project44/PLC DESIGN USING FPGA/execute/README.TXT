First Byte (Operation)
здддддддддддддбддддддддддддддддд©
Ё Instruction Ё      Opcode     Ё
цдддддддддддддеддддддддддддддддд╢
Ё LD          Ё 00000000 (0x00) Ё 
Ё LDI         Ё 00000001 (0x01) Ё 
Ё AND         Ё 00000010 (0x02) Ё 
Ё ANI         Ё 00000011 (0x03) Ё 
Ё OR          Ё 00000100 (0x04) Ё 
Ё ORI         Ё 00000101 (0x05) Ё
Ё OUT         Ё 00000110 (0x06) Ё
Ё OUI         Ё 00000111 (0x07) Ё
Ё TIM         Ё 10000000 (0x40) Ё
Ё CNT         Ё 10000001 (0x41) Ё
Ё ANB         Ё 10000000 (0x80) Ё
Ё ORB         Ё 10000001 (0x81) Ё
Ё NOP         Ё 11111110 (0xFE) Ё
Ё END         Ё 11111111 (0xFF) Ё
юдддддддддддддаддддддддддддддддды

Second Byte (Operand) (LD/LDI/AND/ANI/OR/ORI/OUT/OUI)
здддддддддддддбддддддддддддддддд©
Ё Relay Type  Ё      Opcode     Ё
цдддддддддддддеддддддддддддддддд╢
Ё X (Input)   Ё 00XXXXXX (0x0X) Ё
Ё Y (Output)  Ё 01XXXXXX (0x4X) Ё
Ё M (Auxilary)Ё 10XXXXXX (0x8X) Ё
Ё T (Tim/Cnt) Ё 11XXXXXX (0xCX) Ё
юдддддддддддддаддддддддддддддддды
*While X is Relay Number

Second Byte (Operand) (TIMER/COUNTER)
здддддддддддддбддддддддддддддддд©
Ё Relay Type  Ё      Opcode     Ё
цдддддддддддддеддддддддддддддддд╢
Ё (Number 0)  Ё 00XXXXXX (0x--) Ё
Ё (Number 1)  Ё 01XXXXXX (0x--) Ё
Ё (Number 2)  Ё 10XXXXXX (0x--) Ё
Ё (Number 3)  Ё 11XXXXXX (0x--) Ё
юдддддддддддддаддддддддддддддддды

Third Byte (Values) (TIMER/COUNTER)
здддддддддддддбддддддддддддддддд©
Ё Relay Type  Ё      Opcode     Ё
цдддддддддддддеддддддддддддддддд╢
Ё (Values)    Ё XXXXXXXX (0x--) Ё
юдддддддддддддаддддддддддддддддды

