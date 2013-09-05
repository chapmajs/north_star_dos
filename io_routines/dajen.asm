;North Star DOS I/O routines for the Dajen SCI
;
;Dajen SCI at standard 0xD000 address, already
;initialized by monitor. No device selection 
;is done, just console.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;COUT -- Output a character to the console
;
;pre:   B register contains char to be printed
;post:  character is printed to the console
;       A register contains char that was printed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COUT:	IN	0DCH
	ANI	02H
	JZ	COUT
	MOV	A,B
	OUT	0DDH
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CIN -- Get a char from the console and echo
;
;pre:   console device is initialized
;post:  received char is in A register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CIN:	IN 	0DCH
	ANI	01H
	JZ	CIN
	IN 	0DDH
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TINIT -- Do nothing as we expect the SCI to
;         be initialized already
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TINIT:	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTC -- Detect a Control + C press
;
;pre:   console device is initialize
;post:  zero flag is set if a Control + C was
;       pressed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CONTC:	IN 	0DDH
	CPI	03H
	RET

