TEX_COMPILER = uplatex
DVI_COMPILER = dvipdfmx
MAIN_TEX_FILE = main.tex

.PHONY: all compile clean

all: compile

compile:
	if [ -e .latexmkrc ]; then \
		latexmk $(MAIN_TEX_FILE); \
	else \
		$(TEX_COMPILER) $(MAIN_TEX_FILE); \
		$(DVI_COMPILER) $(basename $(MAIN_TEX_FILE)).dvi; \
	fi

clean:
	rm -f *.{dvi,pdf,aux,log,pdf,fdb_latexmk,fls,synctex.gz}

