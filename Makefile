VERS	:= 0.2

CC	?= gcc
CFLAGS	?= -Wall

PREFIX	?= /usr/local
INSTALL	?= install

LIBS	+= -lxosd -lasound

TARGET	= aosd

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $^ $(LIBS) -o $@

install:
	$(INSTALL) -d -m 0755 $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -m 0755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	$(INSTALL) -d -m 0755 $(DESTDIR)$(PREFIX)/share/doc/$(TARGET)
	$(INSTALL) -m 0644 README.md $(DESTDIR)$(PREFIX)/share/doc/$(TARGET)/README.md

clean:
	rm -f $(TARGET)

.PHONY: all install clean
