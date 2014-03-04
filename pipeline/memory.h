#ifndef MEMORY_H
#define MEMORY_H

#define MAX_ADDR 0xffffff;
#define STACK_ADDR 0x4000;
#define CODE_ADDR 0x0000;

class Memory {
private:
	unsigned char m[MAX_ADDR] = {0};
public:
	void set4(int addr, int val);
	void set2(int addr, int val);
	void set1(int addr, int val);
	int get4(int addr) const;
	int get2(int addr) const;
	int get1(int addr) const;
};

#endif