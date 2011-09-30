#

CC = mpicc
CFLAGS = -g
FC = mpif90
FFLAGS = -g
LIB = -lifcore -limf -ldl

SOURCES = calc.c copy.c diag.c init.c main.c time.c tstep.f90 worker.c dump.c
OBJECTS = calc.o copy.o diag.o init.o main.o time.o tstep.o worker.o dump.o
HEADERS = decs.h

all: shallow

shallow: $(OBJECTS) $(HEADERS)
	$(CC) $(CFLAGS) -o shallow $(OBJECTS) -lm $(LIB)

tags: $(SOURCES) $(HEADERS)
	ctags -w $(SOURCES) $(HEADERS)

clean:
	-rm -f shallow $(OBJECTS) core

calc.o: calc.c decs.h 
copy.o: copy.c decs.h 
diag.o: diag.c decs.h 
init.o: init.c decs.h 
main.o: main.c decs.h 
time.o: time.c decs.h 

tstep.o: tstep.f90
	$(FC) $(FFLAGS)  -c -o $@ $<

worker.o: worker.c decs.h
dump.o: dump.c decs.h
