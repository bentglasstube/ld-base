SOURCES=$(wildcard src/*.cc)
CONTENT=$(wildcard content/*)
BUILDDIR=build
OBJECTS=$(patsubst %.cc,$(BUILDDIR)/%.o,$(SOURCES))
NAME=base

CC=clang++
CFLAGS=-g --std=c++14 -Wall -Wextra -Werror -pedantic
LDFLAGS=-static-libstdc++ -static-libgcc

LDLIBS=`sdl2-config --cflags --libs` -lSDL2_mixer

EXECUTABLE=$(BUILDDIR)/$(NAME)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJECTS) $(LDLIBS)

$(BUILDDIR)/%.o: %.cc
	@mkdir -p $(BUILDDIR)/src
	$(CC) -c $(CFLAGS) -o $@ $<

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -rf $(BUILDDIR)

video: $(NAME).mkv

$(NAME).mkv: $(NAME).glc $(NAME).wav
	glc-play $< -o - -y 1 |ffmpeg -i - -i $(NAME).wav -acodec flac -vcodec libx264 -y $@

$(NAME).wav: $(NAME).glc
	glc-play $< -a 1 -o $@

$(NAME).glc: $(EXECUTABLE)
	glc-capture -so $@ $(EXECUTABLE)

$(NAME)-linux.tgz:
	mkdir $(NAME)
	cp $(EXECUTABLE) README.md $(NAME)/.
	cp -R content $(NAME)/content
	tar zcf $@ $(NAME)
	rm -rf  $(NAME)

.PHONY: all clean run video
