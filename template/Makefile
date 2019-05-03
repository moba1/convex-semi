TEX_COMPILER = uplatex
DVI_COMPILER = dvipdfmx
MAIN_TEX_FILE = main.tex

.PHONY: all compile clean

all: compile

compile:
	$(TEX_COMPILER) $(MAIN_TEX_FILE)
	$(DVI_COMPILER) $(basename $(MAIN_TEX_FILE)).dvi

clean:
	rm -f *.{dvi,pdf,aux,log}

