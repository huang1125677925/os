bximage -hd=10M -mode=create -q disk.img

nasm -I boot/include/ -o mbr.bin boot/mbr.S 
nasm -I boot/include/ -o loader.bin boot/loader.S 
dd if=./mbr.bin of=disk.img bs=512 count=1 conv=notrunc
dd if=./loader.bin of=disk.img bs=512 count=4 seek=2 conv=notrunc

bochs -f bochsrc

