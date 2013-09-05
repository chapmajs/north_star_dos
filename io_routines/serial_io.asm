;North Star DOS I/O routines for Zilog 8530 SCC
;
;Adjust CTLPRT and DATPRT for your specific hardware,
;the defaults work for the N8VEM/s100computers.com
;Serial IO, channel A setup as used in the
;assembly/testing guide.
;
;No device selection is done, just console

CTLPRT: equ 00A1H
DATPRT: equ 00A3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;COUT -- Output a character to the console
;
;pre:	B register contains char to be printed
;post:	character is printed to the console
;	A register contains char that was printed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COUT:	IN	CTLPRT
	ANI	04H
	JZ	COUT
	MOV 	A, B
	OUT	DATPRT
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CIN -- Get a char from the console and echo
;
;pre:	console device is initialized
;post:	received char is in A register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CIN:	IN	CTLPRT
	ANI	01H
	JZ	CIN
	IN	DATPRT
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TINIT -- Prepare SCC port 0 for console use
;
;pre:	INISCC points to a SCC config string
;post:	SCC port 0 is initialized
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TINIT:	LXI	H, INISCC$
        MVI	B, 10H	;Length of config string
TI1: 	MOV	A, M
	OUT	CTLPRT
	INX	H
	DCR	B
	JNZ	TI1
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTC -- Detect a Control + C press
;
;pre:	console device is initialize
;post:	zero flag is set if a Control + C was
;	pressed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CONTC:	IN	DATPRT
	CPI	03H
	RET

;Init string for the SCC, 9600 8/N/1
INISCC$: db 04H, 44H, 03H, 0C1H, 05H, 0EAH, 0BH, 56H, 0CH, 0EH, 0DH, 00H, 0EH, 01H, 0FH, 00H
