VERSION = 1.35
PN = hosts-update

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/$(PN)-$(VERSION)
MANDIR = $(PREFIX)/share/man/man1
RM = rm
Q = @

all:
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed 's/@VERSION@/'$(VERSION)'/' common/$(PN).in > common/$(PN)

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main scripts...\033[0m'
	install -Dm755 common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	# symlink for compatibility due to name change
	ln -s $(PN) "$(DESTDIR)$(BINDIR)/hosts_update"
	install -Dm644 common/hosts.local "$(DESTDIR)/etc/hosts.local"

install-man:
	$(Q)echo -e '\033[1;32mInstalling manpage...\033[0m'
	install -Dm644 doc/$(PN).1 "$(DESTDIR)$(MANDIR)/$(PN).1"
	gzip -9 "$(DESTDIR)$(MANDIR)/$(PN).1"

install: install-bin install-man

uninstall:
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/hosts_update"
	$(Q)$(RM) "$(DESTDIR)$(MANDIR)/$(PN).1.gz"
	$(Q)$(RM) "$(DESTDIR)/etc/hosts.local"

clean:
	$(Q)$(RM) "common/$(PN)"
