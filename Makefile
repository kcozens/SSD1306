#DEBUG  = -g
CC     = gcc
CFLAGS = -I $(IDIR) $(DEBUG) -Wall
IDIR   = inc
SOURCE = src
ODIR   = obj
LDIR   = lib
LIBS   = -lm $(DEBUG)
BUILDDIR = build
_DEPS  = ssd1306.h
DEPS   = $(patsubst %,$(IDIR)/%,$(_DEPS))
_OBJ   = example.o ssd1306.o genericMono_5x7.o \
		ubuntuMono_8pt.o ubuntuMono_16pt.o \
		ubuntuMono_24pt.o ubuntuMono_48pt.o
OBJ    = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SOURCE)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILDDIR)/OrangePi_ssd1306: $(OBJ)
	gcc -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(BUILDDIR)/*~ core $(INCDIR)/*~ 
