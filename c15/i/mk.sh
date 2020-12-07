FILE=makefile

gsed -i '/CC = gcc/s/gcc/i386-elf-gcc/g' $FILE
gsed -i '/LD = ld/s/ld/i386-elf-ld/g' $FILE

line=`gsed -n '/i386-elf-ld/=' $FILE`
line1=`expr $line + 1`
gsed -i -e "${line1}a\ASIB = -I boot/include/" $FILE


line=`gsed -n '/汇编代码编译/=' $FILE`
gsed -i -e "${line}a\$(BUILD_DIR)/mbr.bin: boot/mbr.S" $FILE
line1=`expr $line + 1`
gsed -i -e "${line1}a\	\$(AS) \$(ASIB) \$< -o \$@" $FILE
line1=`expr $line + 2`
gsed -i -e "${line1}a\$(BUILD_DIR)/loader.bin: boot/loader.S" $FILE
line1=`expr $line + 3`
gsed -i -e "${line1}a\	\$(AS) \$(ASIB) \$< -o \$@" $FILE



line=`gsed -n '/mk_dir:/=' $FILE`
line1=`expr $line + 1`
gsed -i -e "${line1}a\	bximage -hd=10M -mode=create -q disk.img" $FILE


line=`gsed -n '/hd:/=' $FILE`
gsed -i -e `expr $line + 1`"s@.*@	dd if=\$(BUILD_DIR)/mbr.bin of=disk.img bs=512 count=1 conv=notrunc@" $FILE
gsed -i -e `expr $line + 2`"s@.*@	dd if=\$(BUILD_DIR)/loader.bin of=disk.img bs=512 count=4 seek=2 conv=notrunc@" $FILE
gsed -i -e `expr $line + 3`"s@.*@	dd if=\$(BUILD_DIR)/kernel.bin of=disk.img bs=512 count=200 seek=9 conv=notrunc@" $FILE


line=`gsed -n '/build:/=' $FILE`

gsed -i -e ${line}"s@.*@build: \$(BUILD_DIR)/mbr.bin \$(BUILD_DIR)/loader.bin \$(BUILD_DIR)/kernel.bin@" $FILE
