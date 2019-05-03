MAKE_SCRIPT=bin/make.bash
DOC_DIR = doc
N = 1
TEMPLATE_DIR = template

.PHONY: all clean

all: $(DOC_DIR)
	bash $(MAKE_SCRIPT) build

clean:
	rm -rf $(DOC_DIR)
	bash $(MAKE_SCRIPT) clean

$(DOC_DIR):
	mkdir -p $@

