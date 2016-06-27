CC=gcc
CXX=g++
RM=rm -f
CPPFLAGS=-g -c -D_REENTRANT -pthread -I/usr/local/include/zookeeper
LDFLAGS=-g
LDLIBS=-L/usr/local/lib -lzookeeper_mt

all: zktest

zktest: main.o
	$(CXX) $(LDFLAGS) -o zktest main.o $(LDLIBS)

main.o: main.cpp
	$(CXX) $(CPPFLAGS) main.cpp

clean:
	$(RM) *.o zktest
	