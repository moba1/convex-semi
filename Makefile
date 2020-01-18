MAKE_SCRIPT=bin/make.bash
DOC_DIR = doc
SRC_DIR = src
N = 1
TEMPLATE_DIR = template

.PHONY: all clean

all: $(DOC_DIR) $(SRC_DIR)
	bash $(MAKE_SCRIPT) build

clean:
	rm -rf $(DOC_DIR)
	bash $(MAKE_SCRIPT) clean

$(DOC_DIR):
	mkdir -p $@

$(SRC_DIR):
	mkdir -p $@
