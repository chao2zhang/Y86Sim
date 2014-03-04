#ifndef MEMORY_H
#define MEMORY_H

const int MAX_ADDR = 0xffffff;
const int STACK_ADDR = 0x4000;
const int CODE_ADDR = 0x0000;

class Memory {

private:
    unsigned char m[MAX_ADDR]= {0};
public:
    void set4(int addr, int val);
    void set2(int addr, int val);
    void set1(int addr, int val);
    int get4(int addr) const;
    int get2(int addr) const;
    int get1(int addr) const;
};

#endif
