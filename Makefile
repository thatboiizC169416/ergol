all:
	@for file in data/layouts/*.toml; do \
		kalamine make $$file --out "data/layouts/$$(basename $${file%.*}).json"; \
	done
	@for file in data/layouts/*.yaml; do \
		kalamine make $$file --out "data/layouts/$$(basename $${file%.*}).json"; \
	done

watch:
	@inotifywait -m data/layouts -e close_write | while read -r _path _action file; do \
		case $$file in \
			*yaml) kalamine make "data/layouts/$$file" --out "data/layouts/$$(basename "$${file%.*}").json";; \
			*toml) kalamine make "data/layouts/$$file" --out "data/layouts/$$(basename "$${file%.*}").json";; \
		esac \
	done

dev:
	pip3 install kalamine

clean:
	rm -rf dist/*

# the install/uninstall targets below require Kalamine v0.4.2+

install:
	@echo "Installer script for XKB (GNU/Linux). Requires super-user privileges."
	@echo
	xkalamine install data/layouts/ergol.yaml

uninstall:
	@echo "Unistaller script for XKB (GNU/Linux). Requires super-user privileges."
	@echo
	xkalamine remove fr/ergol
	@echo
