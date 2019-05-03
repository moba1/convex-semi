TEX_COMPILER = uplatex
MAIN_TEX_FILE = main.tex

.PHONY: all compile clean

all: compile

compile:
	$(TEX_COMPILER) $(MAIN_TEX_FILE)

clean:
	rm -f *.{dvi,pdf,aux,log}

