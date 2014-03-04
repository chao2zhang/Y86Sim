#include <iostream>
#ifndef SIG_H
#define SIG_H

/* icode */
#define INOP 0
#define IHALT 1
#define IRRMOVL 2
#define IIRMOVL 3
#define IRMMOVL 4
#define IMRMOVL 5
#define IOPL 6
#define IJXX 7
#define ICALL 8
#define IRET 9
#define IPUSHL 10
#define IPOPL 11

/* opl func */
#define ADDL 0
#define SUBL 1
#define ANDL 2
#define XORL 3

/* jxx func */
#define JMP 0
#define JLE 1
#define JL 2
#define JE 3
#define JNE 4
#define JGE 5
#define JG 6

/* register */
#define REAX 0
#define RECX 1
#define REDX 2
#define REBX 3
#define RESP 4
#define REBP 5
#define RESI 6
#define REDI 7
#define RNONE 8
#define TOTAL_R 9

/* cc */
#define ZF 0
#define SF 1
#define OF 2
#define TOTAL_CC 3

#endif
