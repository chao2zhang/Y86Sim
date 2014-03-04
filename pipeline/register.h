#include "sig.h"
#ifndef REGISTER_H
#define REGISTER_H

class Register {
private:
	int r[TOTAL_R];
	bool cc[TOTAL_CC];
	int pc;
public:
	Register():pc(0){
		memset(r, 0, sizeof r);
		memset(cc, 0, sizeof cc);
		r[REBP] = r[RESP] = STACK_ADDR;
	}

	void setR(int reg, int value);
	void setCC(int reg, bool value);
	void setPC(int value);
	int getR(int reg) const;
	bool getCC(int reg) const;
	int getPC() const;
};

#endif