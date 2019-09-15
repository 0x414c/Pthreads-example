default_target: test

.PHONY: clean test

main: main.cxx
	g++ -pipe -Wpedantic -Wall -Wextra -std=gnu++17 -O3 -static -static-libgcc -static-libstdc++ -pthread -o main main.cxx

clean:
	rm -f main

test: main
	./main
