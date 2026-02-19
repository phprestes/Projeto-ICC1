all:
	gcc -Wall -Werror -lm -o main main.c

run: all
	./main

clean:
	rm -f main

.PHONY: all run clean