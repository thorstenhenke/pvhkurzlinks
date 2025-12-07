.PHONY: clean

weiterleitung/_redirects: body.txt | weiterleitung
	sed 's/$$/ 301/' $< > $@

weiterleitung: page.md
	mkdir weiterleitung

page.md: header.md
	cp -v $< $@
	./compose.sh
	# cp -v header.md page.md

clean: 
	rm -rf weiterleitung
