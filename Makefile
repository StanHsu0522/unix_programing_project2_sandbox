CXX = g++
LINKFLAGS = -ldl
CFLAGS = -Wall -g -std=c++11
LIBCFLAGS = -fPIC $(CFLAGS)
INC = -I ./include
LIBRARY = sandbox.so
LAUNCHER = sandbox

.PHONY: all clean

all: $(LIBRARY) $(LAUNCHER)

$(LAUNCHER): main.o
	$(CXX) -o $@ $< 

$(LIBRARY): sandbox.o
	$(CXX) -shared -o $@ $< $(LINKFLAGS)

sandbox.o: sandbox.cpp
	$(CXX) -c $(LIBCFLAGS) $(INC) -o $@ $<

main.o: main.cpp
	$(CXX) -c $(CFLAGS) $(INC) -o $@ $<

clean:
	rm -rf sandbox *.so *.o
