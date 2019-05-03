SRC_DIR = src
DOC_DIR = doc
N = 1
TEMPLATE_DIR = template

.PHONY: all clean new

all: $(DOC_DIR)
	$(MAKE) -C $(SRC_DIR)

clean:
	rm -rf doc/

$(DOC_DIR):
	mkdir -p $@

new: $(DOC_DIR)
	cp -r $(TEMPLATE_DIR) $(SRC_DIR)/$N

