prefix ?= ~/.local

.PHONY: all clean install unistall
pos = $(wildcard po/*.po)
mos = $(subst .po,.mo,$(pos))

all: $(mos)

clean:
	rm -f $(wildcard po/*.mo)

install: all
	install -d $(prefix)/bin
	install -m 755 obrun $(prefix)/bin
	$(foreach mo,$(mos),install -d $(prefix)/share/locale/$(notdir $(basename $(mo)))/LC_MESSAGES; \
		install -m 644 $(mo) $(prefix)/share/locale/$(notdir $(basename $(mo)))/LC_MESSAGES/obrun.mo; \
	)

uninstall:
	rm -f $(prefix)/bin/obrun
	rm -f $(wildcard $(prefix)/share/locale/*/LC_MESSAGES/obrun.mo)
	-rmdir $(prefix)/bin
	-rmdir $(wildcard $(prefix)/share/locale/*/LC_MESSAGES)
	-rmdir $(wildcard $(prefix)/share/locale/*)
	-rmdir $(prefix)/share/locale
	-rmdir $(prefix)/share
	-rmdir $(prefix)

%.mo: %.po
	msgfmt --check --statistics -o $@ $<

