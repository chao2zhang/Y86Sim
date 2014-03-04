#include "pipeline.h"

void Pipeline::step() {
	updateRegisters();
	writeBack();
	memory();
	execute();
	decode();
	fetch();
}

void Pipeline::updateRegisters() {
	/* writeback stage */
	W_icode = M_icode;
	W_valE = M_valE;
	W_valM = m_valM;
	W_dstE = M_dstE;
	W_dstM = M_dstM;

	/* memory stage */
	if (M_bubble) {
		M_icode = M_Bch = M_valE = M_valA = M_dstM = 0;
		M_dstE = RNONE;
	} else if (!M_stall) {
		M_icode = E_icode;
		M_Bch = e_Bch;
		M_valE = e_valE;
		M_valA = E_valA;
		M_dstE = E_dstE;
		M_dstM = E_dstM;
	}
	/* execute stage */
	if (E_bubble) {
		E_icode = E_ifun = E_valC = E_valA = E_valB =  E_dstM = E_srcA = E_srcB = 0;
		E_dstE = RNONE;
	} else if (!E_stall) {
		E_icode = D_icode;
		E_ifun = D_ifun;
		E_valC = D_valC;
		E_valA = new_E_valA();
		E_valB = new_E_valB();
		E_dstE = new_E_dstE();
		E_dstM = new_E_dstM();
		E_srcA = new_E_srcA();
		E_srcB = new_E_srcB();
	}
	/* decode stage */
	if (D_bubble) {
		D_icode = D_ifun = D_valC = D_valP = 0;
		D_rA = D_rB = RNONE;
	} else if (!D_stall) {
		D_icode = f_icode;
		D_ifun = f_ifun;
		D_rA = f_rA;
		D_rB = f_rB;
		D_valC = f_valC;
		D_valP = f_valP;
	}

	/* fetch stage */
	F_predPC = new_F_predPC();
}

void Pipeline::writeBack() {
}

void Pipeline::memory() {
	if (mem_read()) {
		m_valM = pm->get4(mem_addr());
	} 
	if (mem_write()) {
		pm->set4(mem_addr(), M_valA);
	}
}

void Pipeline::execute() {
	runAlu();
	setCC();
	setBch();
}

void Pipeline::runAlu() {
	switch (alufun()) {
	case ADDL:
		e_valE = aluA() + aluB();
		break;
	case SUBL:
		e_valE = aluA() - aluB();
		break;
	case ANDL:
		e_valE = aluA() & aluB();
		break;
	case XORL:
		e_valE = aluA() ^ aluB();
		break;
	}
}

void Pipeline::setCC() {
	switch (alufun()) {
	case ADDL:
		pr->setCC(OF, (aluA() < 0 == aluB() < 0) && (e_valE < 0 != aluA() < 0));
		break;
	case SUBL:
		pr->setCC(OF, (aluA() < 0 != aluB() < 0) && (e_valE < 0 != aluA() < 0));
		break;
	}
	pr->setCC(ZF, e_valE == 0);
	pr->setCC(SF, e_valE < 0);
}

void Pipeline::setBch() {
	if (E_icode == IJXX) {
		switch (E_ifun) {
		case JMP:
			e_Bch = 1; break;
		case JLE:
			e_Bch = pr->getCC(SF) || !pr->getCC(SF) && pr->getCC(OF) || pr->getCC(ZF); break;
		case JL:
			e_Bch = pr->getCC(SF) || !pr->getCC(SF) && pr->getCC(OF); break;
		case JE:
			e_Bch = pr->getCC(ZF); break;
		case JNE:
			e_Bch = !pr->getCC(ZF); break;
		case JGE:
			e_Bch = !pr->getCC(SF) || pr->getCC(SF) && pr->getCC(OF) || pr->getCC(ZF); break;
		case JG:
			e_Bch = !pr->getCC(SF) || pr->getCC(SF) && pr->getCC(OF); break;
		}
	}
}

void Pipeline::decode() {
	d_rvalA = pr->getR(new_E_srcA());
	d_rvalB = pr->getR(new_E_srcB());
	if (W_dstM != RNONE) 
		pr->setR(W_dstM, W_valM);
	if (W_dstE != RNONE)
		pr->setR(W_dstE, W_valE);
}

void Pipeline::fetch() {
	int new_pc = f_pc();
	f_icode = (pm->get1(new_pc) >> 4) & 0xf;
	f_ifun = pm->get1(new_pc) & 0xf;
	if (need_regids()) {
		f_rA = (pm->get1(new_pc) >> 4) & 0xf;
		f_rB = pm->get1(new_pc) & 0xf;
		new_pc += 1;
	}
	if (need_valC()) {
		f_valC = pm->get4(new_pc);
		new_pc += 4;
	}
	f_valP = new_pc;
	pr->setPC(new_pc);
}