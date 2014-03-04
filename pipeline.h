#include "sig.h"
#include "memory.h"
#include "register.h"
#ifndef PIPELINE_H
#define PIPELINE_H

class Pipeline {
private:
    Memory* pm;
    Register* pr;
public:
    Pipeline(Memory* m, Register* r):F_predPC(0),
                f_icode(0), f_ifun(0), f_rA(0), f_rB(0), f_valC(0), f_valP(0),
                D_icode(0), D_ifun(0), D_rA(0), D_rB(0), D_valC(0), D_valP(0),
                d_srcA(0), d_srcB(0), d_rvalA(0), d_rvalB(0),
                E_icode(0), E_ifun(0), E_valC(0), E_srcA(0), E_valB(0), E_dstE(RNONE), E_dstM(0),
                e_valE(0), e_Bch(false),
                M_icode(0), M_ifun(0), M_valA(0), M_dstE(RNONE), M_valE(0), M_dstM(0), M_Bch(false),
                m_valM(0),
                W_icode(0), W_dstE(RNONE), W_valE(0), W_dstM(RNONE), W_valM(0),
                pm(m), pr(r){}
    /* Registers are capitalized while wire values are not */
    int F_predPC;
    int f_icode, f_ifun, f_rA, f_rB, f_valC, f_valP;
    int D_icode, D_ifun, D_rA, D_rB, D_valC, D_valP;
    int d_srcA, d_srcB, d_rvalA, d_rvalB;
    int E_icode, E_ifun, E_valC, E_srcA, E_valA, E_srcB, E_valB, E_dstE, E_dstM;
    int e_valE; bool e_Bch;
    int M_icode, M_ifun, M_valA, M_dstE, M_valE, M_dstM; bool M_Bch;
    int m_valM;
    int W_icode, W_dstE, W_valE, W_dstM, W_valM;

    /* Control logic	*/
    /*		Fetch stage			*/
    int f_pc() {
        if (M_icode == IJXX && !M_Bch)
            return M_valA;
        else if (W_icode == IRET)
            return W_valM;
        else
            return F_predPC;
    }

    bool need_regids() {
        return f_icode == IRRMOVL || f_icode == IOPL || f_icode == IPUSHL || f_icode == IPOPL ||
            f_icode == IIRMOVL || f_icode == IRMMOVL || f_icode == IMRMOVL;
    }

    bool need_valC() {
        return f_icode == IIRMOVL || f_icode == IRMMOVL || f_icode == IMRMOVL ||  f_icode == IJXX || f_icode == ICALL;
    }

    bool instr_valid() {
        return f_icode == INOP || f_icode == IHALT || f_icode == IRRMOVL || f_icode == IIRMOVL ||
                f_icode == IMRMOVL || f_icode == IRMMOVL || f_icode == IOPL || f_icode == IJXX || f_icode == ICALL ||
                f_icode == IRET || f_icode == IPUSHL || f_icode == IPOPL;
    }

    int new_F_predPC() {
        switch(f_icode) {
        case IJXX: case ICALL:
            return f_valC;
            break;
        default:
            return f_valP;
            break;
        }
    }

    /*		Decode Stage		*/
    int new_E_srcA() {
        if (D_icode == IRRMOVL || D_icode == IRMMOVL || D_icode == IOPL || D_icode == IPUSHL)
            return D_rA;
        if (D_icode == IPOPL || D_icode == IRET)
            return RESP;
        return RNONE;
    }

    int new_E_srcB() {
        if (D_icode == IRRMOVL || D_icode == IRMMOVL || D_icode == IOPL)
            return D_rB;
        if (D_icode == IPOPL || D_icode == IRET)
            return RESP;
        return RNONE;
    }

    int new_E_dstE() {
        if (D_icode == IRRMOVL || D_icode == IIRMOVL || D_icode == IOPL)
            return  D_rB;
        if (D_icode == IPUSHL || D_icode == IPOPL || D_icode == ICALL || D_icode == IRET)
            return RESP;
        return RNONE;
    }

    int new_E_dstM() {
        if (D_icode == IMRMOVL || D_icode == IPOPL)
            return D_rA;
        return RNONE;
    }

    int new_E_valA() {
        if (D_icode == ICALL || D_icode == IJXX)
            return D_valP;
        if (d_srcA == E_dstE)
            return e_valE;
        if (d_srcA == M_dstM)
            return m_valM;
        if (d_srcA == M_dstE)
            return M_valE;
        if (d_srcA == W_dstM)
            return W_valM;
        if (d_srcA == W_dstE)
            return W_valE;
        return d_rvalA;
    }

    int new_E_valB() {
        if (d_srcB == E_dstE)
            return e_valE;
        if (d_srcB == M_dstM)
            return m_valM;
        if (d_srcB == M_dstE)
            return M_valE;
        if (d_srcB == W_dstM)
            return W_valM;
        if (d_srcB == W_dstE)
            return W_valE;
        return d_rvalB;
    }

    /*		Execution Stage			*/
    int aluA() {
        if (E_icode == IRRMOVL || E_icode == IOPL)
            return E_valA;
        if (E_icode == IIRMOVL || E_icode == IRMMOVL || E_icode == IMRMOVL)
            return E_valC;
        if (E_icode == ICALL || E_icode == IPUSHL)
            return -4;
        if (E_icode == IRET || E_icode == IPOPL)
            return 4;
        return 0;
    }

    int aluB() {
        if (E_icode == IRMMOVL || E_icode == IMRMOVL || E_icode == IOPL ||
            E_icode == ICALL || E_icode == IPUSHL || E_icode == IRET || E_icode == IPOPL)
            return E_valB;
        if (E_icode == IRRMOVL || E_icode == IIRMOVL)
            return 0;
        return 0;
    }

    int alufun() {
        if (E_icode == IOPL)
            return E_ifun;
        return ADDL;
    }

    bool set_cc() {
        return E_icode == IOPL;
    }

    /*		Memory Stage			*/

    int mem_addr() {
        if (M_icode == IRMMOVL || M_icode == IMRMOVL || M_icode == ICALL || M_icode == IPUSHL )
            return 	M_valE;
        if (M_icode == IRET || M_icode == IPOPL)
            return 	M_valA;
    }

    bool mem_read() {
        return M_icode == IPOPL || M_icode == IMRMOVL || M_icode == IRET;
    }

    bool mem_write() {
        return M_icode == IRMMOVL || M_icode == IPUSHL || M_icode == ICALL;
    }

    /*		Register control		*/

    bool F_bubble() {
        return 0;
    }

    bool F_stall() {
        return (E_icode == IMRMOVL || E_icode == IPOPL) && (E_dstM == d_srcA || E_dstM == d_srcB) || (IRET == D_icode || IRET == E_icode || IRET == M_icode);
    }

    bool D_stall() {
        return (E_icode == IMRMOVL || E_icode == IPOPL) && (E_dstM == d_srcA || E_dstM == d_srcB);
    }

    bool D_bubble() {
        return (E_icode == IJXX && !e_Bch) || (IRET == D_icode || IRET == E_icode || IRET == M_icode);
    }

    bool E_stall() {
        return 0;
    }

    bool E_bubble() {
        return (E_icode == IJXX && !e_Bch) || (E_icode == IMRMOVL || E_icode == IPOPL) && (E_dstM == d_srcA ||E_dstM == d_srcB);
    }

    bool M_stall() {
        return 0;
    }

    bool M_bubble() {
        return 0;
    }

    void step();

    void updateRegisters();

    void writeBack();

    void memory();

    void execute();

    void decode();

    void fetch();

    void runAlu();

    void setCC();

    void setBch();
};

#endif
