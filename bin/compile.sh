
#!/bin/bash
rm ks
if yasm -f elf -m amd64 -o ks.obj ks.asm; then echo "Assembled successfully!"; else read; fi;
if ld -strip-all -o ks ks.obj; then echo "Linked successfully!"; else read; fi;
rm ks.obj

