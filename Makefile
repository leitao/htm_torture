LDFLAGS = -lpthread
CC = gcc
DEBUG = -O0 -g

%.o: %.c $(DEPS)
	$(CC) $(DEBUG) -c -o $@ $< $(CFLAGS)

torture: worker.o torture.o workload.o threads.o
	$(CC) $(DEBUG) -o torture worker.o torture.o workload.o threads.o $(LDFLAGS)

asm:
	gcc -S -fverbose-asm worker.c torture.c workload.c threads.c

z: z.c
	$(CC) $(DEBUG) z.c -o z

all: torture

clean:
	rm -f *.o
	rm -f a.out
	rm -f z
	rm -fr torture
