P1 EQU 090H
P3_2 EQU 0B2H
P3_1 EQU 0B1H

	MOV P1,#09H
	

SCAN_SW:					;PRESS START
	JB P3_2,START
	SJMP SCAN_SW

START:

	
	MOV P1,#00001001B
	CALL DELAY
	MOV P1,#00001000B
	CALL DELAY
	MOV P1,#00000111B
	CALL DELAY
	MOV P1,#00000110B
	CALL DELAY
	MOV P1,#00000101B
	CALL DELAY
	MOV P1,#00000100B
	CALL DELAY
	MOV P1,#00000011B
	CALL DELAY
	MOV P1,#00000010B
	CALL DELAY
	MOV P1,#00000001B
	CALL DELAY
	MOV P1,#00000000B
	CALL DELAY
	SJMP SCAN_SW
	

BUZZER:
	SETB P3_1
	

  
 DELAY:
	 MOV R5,#10
 DLY3:
 	MOV R4,#100
 DLY2:
	 MOV R3,#255
 DLY1:
	 DJNZ R3,DLY1
	DJNZ R4,DLY2
	DJNZ R5,DLY3

RET
END
  