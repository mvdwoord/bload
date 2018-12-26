bload.bin:bload.bin
	@nasm -fbin bload.asm -o bload.bin

view:
	@hexdump -v -C bload.bin

clean:
	@rm bload.bin

run:
	@qemu-system-x86_64 -drive format=raw,file=bload.bin
