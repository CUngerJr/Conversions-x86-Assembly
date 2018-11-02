COMMENT! Purpose: Convert integer to hexadecimal, hexadecimal to integer, integer to binary, and hexadecimal to binary.
  Creator: Christopher Unger
  Co-Creator: Corey Gray
  Creation Date:  12/16/2016
  !

TITLE: LAB 5. Conversions

TITLE MASM Template						(Lab5.asm)

INCLUDE Irvine32.inc
.data

; MENU PROMPT
prgmOpenMsg BYTE "-------SYSTEM CONVERSION MENU--------",0

prgmOptMsg1 BYTE "1. Integer To Hexadecimal",0dh,0ah,0
prgmOptMsg2	BYTE "2. Hexadecimal to Integer",0dh,0ah,0
prgmOptMsg3 BYTE "3. Integer to Binary",0dh,0ah,0
prgmOptMsg4 BYTE "4. Hexidecimal to Binary",0dh,0ah,0
exitPrgm BYTE "5. Exit Progam",0

; PROMPT USER TO ENTER MENU OPTION
prgmEnterMsg BYTE "Enter Menu Item for Conversion Type (from 1-->5): ", 0


; PROMPT USER TO ENTER A VALUE TO CONVERT
msgValueInt BYTE "Enter an Integer Value you would like to Convert:", 0
msgValueHex BYTE "Enter a Hexadecimal Value you would like to Convert: ", 0

; MESSAGE EXIT
msgExit BYTE "You are now Exiting the Conversion Program! Thank you! Good-bye!", 0dh, 0ah, 0


.code
main PROC

	; CLEAR SCREEN
	CALL Clrscr
	
	; DISPLAYING MENU CHOICES

Next:
	MOV edx, OFFSET prgmOpenMsg			
	CALL WriteString
	CALL Crlf
	CALL Crlf
	MOV edx, OFFSET prgmOptMsg1		; OPTION 1
	CALL WriteString
	MOV edx, OFFSET prgmOptMsg2		; OPTION 2
	CALL WriteString	
	MOV edx, OFFSET prgmOptMsg3		; OPTION 3
	CALL Writestring
	MOV edx, OFFSET prgmOptMsg4		; OPTION 4
	CALL WriteString
	MOV edx, OFFSET exitPrgm		; OPTION 5 Exit
	CALL WriteString
	CALL Crlf
	CALL Crlf

	; PROMPT USER TO PICK MENU OPTION
	MOV edx, OFFSET prgmEnterMsg
	CALL WriteString
	CALL ReadInt
	CALL Crlf

 ; "IF-ELSE" TO DETERMINED PROCEDURE CALL
	
	CMP eax, 1			; CHECK FOR OPTION 1
	JNE Else2			; FALSE, CHECK IF OPTION 2
	CALL Opt1			; TRUE, CALL OPT1 PROCEDURE
	JMP Next			; RETURN & JUMP TO PROMPT

Else2:
	CMP eax, 2			; CHECK FOR OPTION 2
	JNE Else3
	CALL Opt2
	JMP Next

Else3:
	CMP eax, 3			; CHECK FOR OPTION 3
	JNE Else4
	CALL Opt3
	JMP Next

Else4:
	CMP eax, 4			; CHECK FOR OPTION 4
	JNE Quit			; FALSE, THEN USER WANTS TO QUIT PROGRAM
	CALL Opt4
	JMP Next

	

; PROCEDURE CALLS

;************************************************************************************************
 Opt1 PROC
;
; Converts user's integer value to hexadecimal value
; Receivers: EAX receives user's integer value by the CALL ReadInt and
;			 passes the parameter back to EAX. 
; Returns: Then, the CALL WriteHex will return the Hexadecimal value back in EAX.
;************************************************************************************************

 MOV edx, OFFSET msgValueInt
 CALL WriteString
 CALL ReadInt
 CALL WriteHex
 CALL Crlf
 CALL Crlf
 MOV eax, 0

 RET
 Opt1 ENDP


 ;************************************************************************************************
 Opt2 PROC
;
; Converts user's hexadecimal value to integer value
; Receivers: EAX receives user's hexadecimal value by the CALL ReadHex and
;			 pass the parameter back to EAX. 
; Returns: Then, the CALL WriteDec will return the unsigned Integer value back in EAX.
;************************************************************************************************

 MOV edx, OFFSET msgValueHex
 CALL WriteString
 CALL ReadHex
 CALL WriteDec
 CALL Crlf
 CALL Crlf
 MOV eax, 0

 RET
 Opt2 ENDP

 ;************************************************************************************************
 Opt3 PROC
;
; Converts user's integer value to binary
; Receivers: EAX receives user's integer value by the CALL ReadInt and
;			 passes the parameter back to EAX. 
; Returns: Then, the CALL WriteBin will return the Binary value back in EAX.
;************************************************************************************************

 MOV edx, OFFSET msgValueInt
 CALL WriteString
 CALL ReadInt
 CALL WriteBin
 CALL Crlf
 CALL Crlf
 MOV eax, 0

 RET
 Opt3 ENDP

 ;************************************************************************************************
 Opt4 PROC
;
; Converts user's hexadecimal value to binary
; Receivers: EAX receives user's hexadecimal value by the CALL ReadHex and
;			 passes the parameter back to EAX. 
; Returns: Then, the CALL WriteBin will return the Binary value back in EAX.
;************************************************************************************************

 MOV edx, OFFSET msgValueHex
 CALL WriteString
 CALL ReadHex
 CALL WriteBin
 CALL Crlf
 CALL Crlf
 MOV eax, 0

 RET
 Opt4 ENDP

 ;QUIT LABEL
 Quit:
	MOV edx, OFFSET msgExit
	CALL WriteString
	CALL Crlf
	exit
	main ENDP

END main