SRC_DIR = src
DOC_DIR = doc
N = 1
TEMPLATE_DIR = template

.PHONY: all clean

all: $(DOC_DIR)
	bash $(SRC_DIR)/make.bash build

clean:
	rm -rf $(DOC_DIR)
	bash $(SRC_DIR)/make.bash clean

$(DOC_DIR):
	mkdir -p $@

