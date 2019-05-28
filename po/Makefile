pos = $(wildcard *.po)
mos = $(subst .po,.mo,$(pos))

.PHONY: all clean install uninstall

all: $(mos)

clean:
	rm -f $(wildcard *.mo *.po~)

install:
	$(foreach mo,$(mos),install -d $(prefix)/share/locale/$(notdir $(basename $(mo)))/LC_MESSAGES; \
		install -m 644 $(mo) $(prefix)/share/locale/$(notdir $(basename $(mo)))/LC_MESSAGES/obrun.mo; \
	)

uninstall:
	-rmdir $(wildcard $(prefix)/share/locale/*/LC_MESSAGES)
	-rmdir $(wildcard $(prefix)/share/locale/*)
	-rmdir $(prefix)/share/locale
	-rmdir $(prefix)/share

obrun.pot: ../obrun
	xgettext -L shell -k -k_ -o $@ --from-code=utf-8 --no-location \
		--package-name=obrun --package-version=$(version) $<

%.po: obrun.pot
	msgmerge -Uq $@ $<
	touch $@

%.mo: %.po obrun.pot
	msgfmt --check --statistics -o $@ $<
