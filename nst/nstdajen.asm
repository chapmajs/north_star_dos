;-------------------------------------------------------------
; Host I/O functions for Dajen SCI console
;-------------------------------------------------------------
;
; NorthStar DOS I/O function do not provide a guaranteed method
; of reading 8-bit raw binary data with the ability to time-out,
; so NST uses it's own I/O functions.
;
; These functions are set up for direct hardware access to the
; Dajen SCI serial console port.


; Write character in ACC to host - no registers may be modified
PUTC    PUSH    AF              ;Save ACC
putc1   IN      A,($DC)         ;Read status
	AND     %00000010       ;TDRE set?
	JP      Z,putc1         ;No, wait for it
	POP     AF              ;Restore ACC
	OUT     ($DD),A         ;Write to data port
	RET

; Test for character available from HOST
; If character is ready, return with C-flag clear and character in ACC
; If no character is ready, return with C-flag SET and ACC undefined
; No other registers may be modified.
TESTC   IN      A,($DC)         ;Read status
	AND     %00000001       ;RDA set?
	JP      Z,testc1        ;No data
	IN      A,($DD)         ;Read data
	RET
testc1  SCF                     ;Indicate no data
	RET

; Host initialization function
; No initialization provided, make sure the Dajen SCI has alreay
; initialized the console serial port to the desired baud rate.
HINIT   RET
