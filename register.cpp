#include "register.h"

void Register::setR(int reg, int value) {
    r[reg] = value;
}

void Register::setCC(int reg, bool value) {
    cc[reg] = value;
}

void Register::setPC(int value) {
    pc = value;
}

int Register::getR(int reg) const {
    return r[reg];
}

bool Register::getCC(int reg) const {
    return cc[reg];
}

int Register::getPC() const{
    return pc;
}
