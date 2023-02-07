all:
	@for file in layouts/*.yaml; do \
		kalamine $$file --out "layouts/$$(basename $${file%.*}).json"; \
	done

dev:
	pip3 install kalamine

clean:
	rm -rf dist/*

# the install/uninstall targets below require Kalamine v0.4.2+

install:
	@echo "Installer script for XKB (GNU/Linux). Requires super-user privileges."
	@echo
	xkalamine install layouts/ergol.yaml

uninstall:
	@echo "Unistaller script for XKB (GNU/Linux). Requires super-user privileges."
	@echo
	xkalamine remove fr/ergol
	@echo
