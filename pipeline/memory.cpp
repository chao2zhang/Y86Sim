#include "memory.h"

void Memory::set4(int addr, int val) {
	m[addr] = val & 0xff;
	m[addr + 1] = (val >> 8) & 0xff;
	m[addr + 2] = (val >> 16) & 0xff;
	m[addr + 3] = (val >> 24) & 0xff;
}

void Memory::set2(int addr, int val) {
	m[addr] = val & 0xff;
	m[addr + 1] = (val >> 8) & 0xff;
}

void Memory::set1(int addr, int val) {
	m[addr] = val & 0xff;
}

int Memory::get1(int addr) const{
	return m[addr];
}

int Memory::get2(int addr) const{
	return (m[addr + 1] << 8) + m[addr];
}

int Memory::get4(int addr) const{
	return (m[addr + 3] << 24) 
		+ (m[addr + 2] << 16)
		+ (m[addr + 1] << 8)
		+ m[addr];
}