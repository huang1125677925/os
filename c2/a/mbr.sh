nasm -o mbr.bin boot/mbr.S 
dd if=./mbr.bin of=disk.img bs=512 count=1 conv=notrunc



