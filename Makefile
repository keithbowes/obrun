prefix ?= $(HOME)/.local
pwd=$(shell pwd)
version=$(shell git describe --tags)

.PHONY: all clean dist install uninstall
pos = $(wildcard po/*.po)
mos = $(subst .po,.mo,$(pos))

all: $(mos) obrun

obrun: obrun.in
	sed -e 's:@prefix@:$(prefix):g' \
		-e 's/@version@/$(version)/g' \
		$< > $@
	chmod +x $@

clean:
	rm -f obrun
	rm -f $(wildcard po/*.mo)

# Create a distribution
dist:
	$(MAKE) all install prefix=$(TMP)/obrun-$(version)
	sed -i -e 's:$(TMP)/obrun-$(version):/usr:g' $(TMP)/obrun-$(version)/bin/obrun
	cd $(TMP) && pax -w obrun-$(version) | gzip -f9 > "$(pwd)/obrun-$(version).tar.gz"
	$(MAKE) uninstall prefix=$(TMP)/obrun-$(version)

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

