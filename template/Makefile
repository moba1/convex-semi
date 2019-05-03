TEX_COMPILER = uplatex
DVI_COMPILER = dvipdfmx
MAIN_TEX_FILE = main.tex
MAX_REPEAT = 3

.PHONY: all compile clean

all: compile

compile:
	if [ -e .latexmkrc ]; then \
		latexmk $(MAIN_TEX_FILE); \
	else \
		for i in $$(seq 1 $(MAX_REPEAT)); do \
			$(TEX_COMPILER) $(MAIN_TEX_FILE); \
			$(DVI_COMPILER) $(basename $(MAIN_TEX_FILE)).dvi; \
		done; \
	fi

clean:
	rm -f *.{dvi,pdf,aux,log,pdf,fdb_latexmk,fls,synctex.gz}

