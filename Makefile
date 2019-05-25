prefix ?= $(HOME)/.local
pwd=$(shell pwd)
version=$(shell git describe --tags)

export prefix version

.PHONY: all clean dist install uninstall
all: obrun
	cd po && $(MAKE)

obrun: obrun.in
	sed -e 's:@prefix@:$(prefix):g' \
		-e 's/@version@/$(version)/g' \
		$< > $@
	chmod +x $@

clean:
	cd po && $(MAKE) clean
	rm -f obrun

# Create a distribution
dist:
	$(MAKE) all install prefix=$(TMP)/obrun-$(version)
	sed -i -e 's:$(TMP)/obrun-$(version):/usr:g' $(TMP)/obrun-$(version)/bin/obrun
	cd $(TMP) && pax -w obrun-$(version) | gzip -f9 > "$(pwd)/obrun-$(version).tar.gz"
	$(MAKE) uninstall prefix=$(TMP)/obrun-$(version)

install: all
	cd po && $(MAKE) install
	install -d $(prefix)/bin
	install -m 755 obrun $(prefix)/bin

uninstall:
	cd po && $(MAKE) uninstall
	rm -f $(prefix)/bin/obrun
	rm -f $(wildcard $(prefix)/share/locale/*/LC_MESSAGES/obrun.mo)
	-rmdir $(prefix)/bin
	-rmdir $(prefix)
