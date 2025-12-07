.PHONY: all clean

all: weiterleitung/index.html weiterleitung/_redirects

weiterleitung/index.html: page.md
	./compose.sh

weiterleitung/_redirects: body.txt
	sed 's/$$/ 301/' $< > $@

page.md: header.md
	cp -v $< $@

clean: 
	rm -rf weiterleitung
	rm -rf page.md
