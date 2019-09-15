default_target: test

.PHONY: clean test

CXX = g++
CXXFLAGS = -pipe -Wpedantic -Wall -Wextra -std=gnu++17 -O3
LDFLAGS = -static -static-libgcc -static-libstdc++ -pthread
SOURCE = main.cxx
OBJECT = $(SOURCE:.cxx=.o)
TARGET = main

$(OBJECT): $(SOURCE)
	$(CXX) $(CXXFLAGS) -c -o $@ $^

$(TARGET): $(OBJECT)
	$(CXX) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OBJECT) $(TARGET)

test: $(TARGET)
	./$^
