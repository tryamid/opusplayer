CXX = g++
CC = gcc
CFLAGS = -std=c11 -Ofast
CXXFLAGS = -std=c++17 -Ofast
LDLIBS+= $(shell pkg-config --cflags --libs opus opusfile libpulse libpulse-simple)

BIN = opusplayer
BINDIR = bin

build: src/player.cc
	- mkdir $(BINDIR)
	$(CXX) -g -o "$(BINDIR)/$(BIN).out" $(CXXFLAGS) $^ $(LDLIBS)

.PHONY: install clean
install:
	cp $(BINDIR)/* /usr/bin
	whereis $(BIN)

clean:
	rm -r $(BINDIR)