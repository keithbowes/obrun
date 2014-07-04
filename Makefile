prefix ?= ~/.local

.PHONY: install

all:
	msgfmt --check --statistics -o po/de.mo po/de.po
	msgfmt --check --statistics -o po/eo.mo po/eo.po
	msgfmt --check --statistics -o po/es.mo po/es.po

clean:
	rm -f po/*.mo

install:
	install -d $(prefix)/bin
	install -m 755 obrun $(prefix)/bin
	install -d $(prefix)/share/locale/de/LC_MESSAGES
	install -m 644 po/de.mo $(prefix)/share/locale/de/LC_MESSAGES/obrun.mo
	install -d $(prefix)/share/locale/eo/LC_MESSAGES
	install -m 644 po/eo.mo $(prefix)/share/locale/eo/LC_MESSAGES/obrun.mo
	install -d $(prefix)/share/locale/es/LC_MESSAGES
	install -m 644 po/es.mo $(prefix)/share/locale/es/LC_MESSAGES/obrun.mo

uninstall:
	rm -f $(prefix)/bin/obrun
	rm -f $(prefix)/share/locale/*/LC_MESSAGES/obrun.mo
	-rmdir $(prefix)/bin
	-rmdir $(prefix)/share/locale/*/LC_MESSAGES
	-rmdir $(prefix)/share/locale/*
	-rmdir $(prefix)/share/locale
	-rmdir $(prefix)/share
	-rmdir $(prefix)
