SRC = main.asm
OBJ = main.obj

LIB = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64"

main: ${SRC}
	nasm -f win64 ${SRC} -o ${OBJ}
	link /entry:start /subsystem:console ${OBJ} /LIBPATH:${LIB} kernel32.lib

clean:
	del *.obj
	del *.exe