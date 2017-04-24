
#include <avr/io.h>

__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1

	.text
.Ltext0:
.global	read_cycle_ASM

read_cycle_ASM:
//** #include <avr/io.h>
//** #include "pwm.h"
//** 
//** uint32_t read_cycle_ASM()
//** {
.LM0:
.LFBB1:
		push r16	 ; 	 ;  155	pushqi1/1	[length = 1]
		push r17	 ; 	 ;  156	pushqi1/1	[length = 1]
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
//** 
//**   // Lowest frequency = 488Hz >> 476Hz (rounded to 2.1 ms)
//**   // At 476Hz, max clock period is 2.1ms/(1/9.6MHZ) == 20160
//**   // This corresponds to the longest we would have to wait for a change
//**   const uint16_t max_period_cycles = 20160;
//**   const uint16_t  max_loops = max_period_cycles / 12;
//**   // Restricts the initial waiting period
//**   uint16_t counter = max_loops;
//**   // Count the width in terms of number of loops
//**   uint16_t firstWidth = 0;
//**   uint16_t fullWidth = 0;
//** 
//**   const uint8_t startState = (PINB & (1 << PIN_PWM_IN));
.LM1:
		in r26,0x16	 ;  D.1675, MEM[(volatile uint8_t *)54B]	 ;  15	movqi_insn/4	[length = 1]
		andi r26,lo8(2)	 ;  startState,	 ;  16	andqi3/2	[length = 1]
		mov r30,r26	 ;  D.1676, startState	 ;  153	movqi_insn/1	[length = 1]
		ldi r31,0	 ;  D.1676	 ;  154	movqi_insn/1	[length = 1]
//**   
//**   // Wait for the first change
//**   while ((PINB & (1 << PIN_PWM_IN)) == startState)
.LM2:
		ldi r18,lo8(-112)	 ;  D.1674,	 ;  3	*movhi/5	[length = 2]
		ldi r19,lo8(6)	 ;  D.1674,
		rjmp .L2	 ; 	 ;  217	jump	[length = 1]
.L4:
		subi r18,1	 ;  D.1674,	 ;  21	addhi3_clobber/2	[length = 2]
		sbc r19,__zero_reg__	 ;  D.1674
//**     if (--counter == 0)
.LM3:
		breq .L18	 ; ,	 ;  23	branch	[length = 1]
.L2:
//**     if (--counter == 0)
.LM4:
		in r24,0x16	 ;  D.1675, MEM[(volatile uint8_t *)54B]	 ;  33	movqi_insn/4	[length = 1]
		andi r24,lo8(2)	 ;  D.1675,	 ;  35	andqi3/2	[length = 1]
		ldi r25,0	 ;  D.1676	 ;  152	movqi_insn/1	[length = 1]
		cp r24,r30	 ;  D.1676, D.1676	 ;  37	*cmphi/3	[length = 2]
		cpc r25,r31	 ;  D.1676, D.1676
		breq .L4	 ; ,	 ;  38	branch	[length = 1]
		ldi r18,0	 ;  firstWidth	 ;  4	*movhi/2	[length = 2]
		ldi r19,0	 ;  firstWidth
		rjmp .L6	 ; 	 ;  219	jump	[length = 1]
.L7:
//**       // If this loop failed, then zero or full duty cycle
//**       return startState == 0 ? 0 : 255;
//** 
//**   // Time while waiting for the second change
//**   while ((PINB & (1 << PIN_PWM_IN)) != startState)
//**     if (++firstWidth == max_loops)

// Here to the brne at the end of LM6 is the first measure loop
.LM5:
		subi r18,-1	 ;  firstWidth,	 ;  43	addhi3_clobber/2	[length = 2]
		sbci r19,-1	 ;  firstWidth,
		cpi r18,-112	 ;  firstWidth,	 ;  44	*cmphi/7	[length = 3]
		ldi r16,6	 ; ,
		cpc r19,r16	 ;  firstWidth,
		breq .L20	 ; ,	 ;  45	branch	[length = 1]
.L6:
//**     if (++firstWidth == max_loops)
.LM6:
		in r24,0x16	 ;  D.1675, MEM[(volatile uint8_t *)54B]	 ;  57	movqi_insn/4	[length = 1]
		andi r24,lo8(2)	 ;  D.1675,	 ;  59	andqi3/2	[length = 1]
		ldi r25,0	 ;  D.1676	 ;  150	movqi_insn/1	[length = 1]
		cp r24,r30	 ;  D.1676, D.1676	 ;  61	*cmphi/3	[length = 2]
		cpc r25,r31	 ;  D.1676, D.1676
		brne .L7	 ; ,	 ;  62	branch	[length = 1]


		movw r22,r18	 ;  firstWidth, firstWidth	 ;  5	*movhi/1	[length = 1]
		rjmp .L9	 ; 	 ;  222	jump	[length = 1]
.L10:
//**       // This loop failed, must have moved to this state on this edge
//**       return startState == 0 ? 255 : 0;
//** 
//**   // Now back in original state, time this
//**   fullWidth = firstWidth;
//**   while ((PINB & (1 << PIN_PWM_IN)) == startState)
//**     if (++fullWidth == max_loops)
.LM7:
		subi r22,-1	 ;  firstWidth,	 ;  67	addhi3_clobber/2	[length = 2]
		sbci r23,-1	 ;  firstWidth,
		cpi r22,-112	 ;  firstWidth,	 ;  68	*cmphi/7	[length = 3]
		ldi r17,6	 ; ,
		cpc r23,r17	 ;  firstWidth,
		breq .L18	 ; ,	 ;  69	branch	[length = 1]
.L9:
//**     if (++fullWidth == max_loops)
.LM8:
		in r20,0x16	 ;  D.1675, MEM[(volatile uint8_t *)54B]	 ;  81	movqi_insn/4	[length = 1]
		andi r20,lo8(2)	 ;  D.1675,	 ;  83	andqi3/2	[length = 1]
		ldi r21,0	 ;  D.1676	 ;  148	movqi_insn/1	[length = 1]
		cp r20,r30	 ;  D.1676, D.1676	 ;  85	*cmphi/3	[length = 2]
		cpc r21,r31	 ;  D.1676, D.1676
		breq .L10	 ; ,	 ;  86	branch	[length = 1]
//**       // This loop failed. Must have just moved to this state!
//**       return startState == 0 ? 0 : 255; 
//** 
//**   if (startState == 1)
//**     firstWidth = fullWidth - firstWidth;
//**   return (((uint32_t)firstWidth) << 16) | ((uint32_t)fullWidth);
.LM9:
		movw r24,r18	 ;  D.1677, firstWidth	 ;  143	*movhi/1	[length = 1]
		ldi r26,0	 ;  D.1677	 ;  144	*movhi/2	[length = 2]
		ldi r27,0	 ;  D.1677
		movw r26,r24	 ;  D.1677, D.1677	 ;  198	*ashlsi3_const/3	[length = 3]
		clr r25	 ;  D.1677
		clr r24	 ;  D.1677
		movw r20,r22	 ;  D.1677, firstWidth	 ;  145	*movhi/1	[length = 1]
		ldi r22,0	 ;  D.1677	 ;  146	*movhi/2	[length = 2]
		ldi r23,0	 ;  D.1677
		movw r16,r24	 ; , D.1677	 ;  141	*movsi/1	[length = 2]
		movw r18,r26	 ; , D.1677
		or r16,r20	 ; , D.1677	 ;  91	iorsi3/1	[length = 4]
		or r17,r21	 ; , D.1677
		or r18,r22	 ; , D.1677
		or r19,r23	 ; , D.1677
		movw r24,r18	 ;  D.1673,	 ;  142	*movsi/1	[length = 2]
		movw r22,r16	 ;  D.1673,
/* epilogue start */
//** 
//**    
//** }
.LM10:
		pop r17	 ; 	 ;  159	popqi	[length = 1]
		pop r16	 ; 	 ;  160	popqi	[length = 1]
		ret	 ;  161	return_from_epilogue	[length = 1]
.L18:
//** 
.LM11:
		tst r26	 ;  startState	 ;  71	*cmpqi/1	[length = 1]
		breq .L12	 ; ,	 ;  72	branch	[length = 1]
.L13:
//** 
.LM12:
		ldi r22,lo8(-1)	 ;  D.1673,	 ;  6	*movsi/5	[length = 4]
		ldi r23,0	 ;  D.1673
		ldi r24,0	 ;  D.1673
		ldi r25,0	 ;  D.1673
/* epilogue start */
.LM13:
		pop r17	 ; 	 ;  202	popqi	[length = 1]
		pop r16	 ; 	 ;  203	popqi	[length = 1]
		ret	 ;  204	return_from_epilogue	[length = 1]
.L20:
//** 
.LM14:
		tst r26	 ;  startState	 ;  47	*cmpqi/1	[length = 1]
		breq .L13	 ; ,	 ;  48	branch	[length = 1]
.L12:
		ldi r22,0	 ;  D.1673	 ;  10	*movsi/2	[length = 3]
		ldi r23,0	 ;  D.1673
		movw r24,r22	 ;  D.1673
/* epilogue start */
.LM15:
		pop r17	 ; 	 ;  211	popqi	[length = 1]
		pop r16	 ; 	 ;  212	popqi	[length = 1]
		ret	 ;  213	return_from_epilogue	[length = 1]
.Lscope1:
.Letext0:
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.0_1734) 5.4.0"
