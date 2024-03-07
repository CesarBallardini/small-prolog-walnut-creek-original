# makefile for Small Prolog with GNU gcc

SRC = pralloc.c prassert.c prbuilti.c prconsul.c prdebug.c prerror.c \
 prhash.c prlush.c prmain.c prparse.c prprint.c prscan.c prunify.c \
 prlinux.c conio.c

OBJ = pralloc.o prassert.o prbltin.o prcnsult.o prdebug.o\
	prerror.o  prhash.o prlush.o prparse.o \
	prprint.o prscan.o prunify.o prmain.o \
	prlinux.o conio.o

.c.o:
	gcc -c -DGCC=1 -w -g $*.c   


sprolog : $(OBJ) prlinux.a
	gcc $(CCOPT) prmain.o prlinux.a -o sprolog

prlinux.a : $(OBJ)
	ar rc $@ $+
	ranlib $@

pp : pp.c
	gcc pp.c $(CCOPT) -o pp
	
prmain.o: prmain.c 
prlush.o: prlush.c prtypes.h prolog.h prlush.h
prscan.o: prscan.c prtypes.h prolog.h prlex.h
prbltin.o: prbltin.c prbltin.h prtypes.h prolog.h
pralloc.o: pralloc.c prtypes.h prolog.h 
prassert.o: prassert.c prtypes.h prolog.h 
prcnsult.o: prcnsult.c prtypes.h prolog.h 
prdebug.o: prdebug.c prtypes.h prolog.h 
prerror.o: prerror.c prtypes.h prolog.h 
prhash.o:  prhash.c prtypes.h prolog.h 
prparse.o: prparse.c prtypes.h prolog.h 
prprint.o: prprint.c prtypes.h prolog.h prlex.h
prgccpc.o: prgccpc.c prtypes.h prolog.h 
prunify.o: prunify.c prtypes.h prolog.h 
prlinux.o: prlinux.c prtypes.h prolog.h conio.h
conio.o: conio.c conio.h

clean:
	rm -f a.out $(OBJ) prlinux.a

veryclean: clean
	rm -f pp sprolog

