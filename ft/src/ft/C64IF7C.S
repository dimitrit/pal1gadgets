	; C64 Interface Driver Program
	;
	; Version 7C
	; File C64IF7.C
	;
	; (C) Artur Fischer Forschung, 1984
	; Control of the fischertechnik Interface
	; using the C64 SYS- and USR-commands
	; for output and input, respectively.
	;
	; Initializing:
	; SYS INIT
	; Initializes the interface and
	; shuts down all motor outputs.
	; Output control:
	; SYS <motornumber>, <mode> .
	; <motornumber> is Ml, M2, M3 or M4.
	; <mode> ist CW, CCW, or OFF.
	; Input control:
	; Digital input commands:
	; USR(<digital_input>)
	; <digital input> is El, E2, E3, E4,
	; E5, E6, E7, or EB,
	; Analog input commands:
	; USR(<analog_input>)
	; <analog input> is EX or EY.
	;
	; Connection of the interface to the userport:
	; Interface Userport   Pin
	;  0V           GND    A
	;  LOAD-OUT     PB0    C
	;  LOAD-IN      PB1    D
	;  DATA-OUT     PB2    E
	;  CLOCK        PB3    F
	;  TRIGGER-X    PB4    H
	;  TRIGGER-Y    PB5    J
	;  DATA-IN      PB7    L
	;  COUNT-IN     CNT2   6
	;**************************************
	.OOS			;Generate object code
	.BA $CFOO		;Program in free RAM area
	;**************************************
	; CBM-BASIC Routines
	;**************************************
YFAC	.DE $B3A2 		;Convert (Y) to floating
AYFAC	.DE $B391 		;Convert (A/Y) to floating
CKCOM	.DE $AEFD 		;Check for comma
FACINT	.DE $B7A1		;Convert floating to integer
GETBYTE .DE $B79E		;Get byte expression
	;**************************************
	; Input and output registers
	;**************************************
UP	.DE $DD01 		;Userport data register
DRR	.DE $DD03 		;Userport data direction
TIL	.DE $DD04 		;Timer low register
TIH	.DE $DD05 		;Timer high register
TIC	.DE SDD0E 		;Timer control register
	;**************************************
	; Variables in the zero page
	;**************************************
AVAR	.DE $FE 		;output variable
MASK	.DE $FF 		;mask variable
	;**************************************
	;Routines for output control
	;Call in using the SYS command
	;**************************************
INIT 	SEI 			;Disable interrupt
	LDA #$00 		;All motors off
	BEQ STVAR		;BRANCH ALWAYS
M1	LDA #%00000011		;Motor 1
	BNE BOUT		;BRANCH ALWAYS
M2	LDA #%00001100		;Motor 2
	BNE BOUT		;BRANCH ALWAYS
M3	LDA #%00110000		;Motor 3
	BNE BOUT		;BRANCH ALWAYS
M4 	LDA #%11000000		;Motor 4
	;**************************************
BOUT	SEI			;Disable interrupt
	STA MASK		;Save bit mask
	JSR CKCOM		;Check for comma
	LDA AVAR		;Get previous output
	ORA MASK		;Set both bits
	STA AVAR		;Intermediate storage
	JSR GETBYTE		;Get 2nd argument
	TXA
	AND MASK		;Mask motor
	STA MASK		;Intermediate storage
	LDA AVAR		;Get output variable
	EOR MASK		;Set bit (10, 01, 00)
STVAR	STA AVAR		;Save for output
	TAY			;Copy in Y-reg.
	;**************************************
	; Routine for interface control
	; Output control
	; Output bit pattern in AVAR
	; Uses A- and X-registers
	;**************************************
	LDA #$3F		;Set data direction
	STA DRR
	LDX #$08		;Loop for 8 bits
LOOP	LDA #$30		;static pattern userport
	ASL AVAR 		;Test output bit
	BCC DOUT		;DATA-OUT low
	ORA #$04		;DATA-OUT high
DOUT	STA UP			;Output to userport
	ORA #$08		;set CLOCK
	STA UP			;Output to userport
	DEX			;Loop counter
	BNE LOOP		;end of LOOP
	LDA #$39		;Set LOAD-OUT
	STA UP			;Output to userport
	STY AVAR		;Restore AVAR
	CLI			;Enable interrupt
	RTS			;Return to BASIC
	;**************************************
	; Routine for interface control
	; Input control
	; Call in using the USR-function
	; Starting address must be stored in
	; $0311 and $0312.
	;**************************************
BINP	SEI			;Disable interrupt
	JSR FACINT		;Convert arg. to integer
	CPX #$A2		;Analog input?
	BEQ POTS		;Go to POTS
	CPX #$92		;Analog input?
	BEQ POTS		;Go to POTS
	STX MASK		;Save input mask
	;**************************************
	; Interface Control
	; for digital input
	; Uses X- and Y-registers
	;**************************************
	LDA #$32		;Set LOAD-IN
	STA UP			;Output to userport
	ORA #$08		;Set CLOCK
	STA UP			;Output to userport
	LDX #$08		;Loop counter for 8 bit
LOOP2	ASL A			;Shift left A-reg.
	BIT UP			;Test DATA-IN
	BPL MAKEIN		;DATA-IN is low
	ORA #$01		;DATA-IN is high
MAKEIN	LDY #$30		;Reset CLOCK
	STY UP			;Output to userport
	LDY #$38		;Set CLOCK
	STY UP			;Output to userport
	DEX			;Decrement loop counter
	BNE LOOP2		;End of LOOP2
	AND MASK		;Mask bit
	TAY			;Save in Y-register
	BEQ CVAR		;Return 0
	LDY #$01		;Return 1
CVAR 	JSR YFAC		;Convert to floating
END	CLI			;Enable interrupt
	RTS			;Return to BASIC
	;**************************************
	; Analog input
	; If the argument is either $92 or $A2
	; an analog input is invoked. Control
	; jumps here.
	; Uses A-, X- and Y-registers
	;**************************************
POTS	LDA #$FF		;Set Count register to $FFFF
	STA TIL
	STA TIH
	LDA #$B9		;Set timer control reg.
	STA TIC
	STX UP			;Trigger One-shot
	LDX #$3A		;Reset trigger
	STX UP			;Output to userport
TST	LDA TIL			;Test timer low register
	LDX #$03		;Delay loop
DELAY	DEX
	BNE DELAY
	SEC			;Subtract timer low reg.
	SBC TIL			;from previous value.
	BNE TST			;Pulses still arriving?
	LDX #$38		;Set CLOCK, reset LOAD-IN
	STX UP			;Output to userport
	SEC 			;Calculate contents
	LDA #$FF
	SBC TIL 		;Low byte
	TAY			;in Y register
	LDA #$FF
	SBC TIH			;High byte
	JSR AYFAC		;Convert A/Y to floating
	JMP END			;Return to BASIC
	.EN