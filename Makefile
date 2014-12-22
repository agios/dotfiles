DOTFILES_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
RCUP := $(shell which rcup)
RCDN := $(shell which rcdn)
RCM_VERSION := "1.2.3"

default: update clean

$(HOME)/.rcrc:
	@ln -s $(DOTFILES_DIR)/rcrc $(HOME)/.rcrc

rcm:
ifndef RCUP
	@cd /tmp && wget https://thoughtbot.github.io/rcm/dist/rcm-$(RCM_VERSION).tar.gz
	@cd /tmp && tar -xvf rcm-$(RCM_VERSION).tar.gz
	@cd /tmp/rcm-$(RCM_VERSION) && ./configure --prefix=/tmp/rcm  && $(MAKE) && $(MAKE) install
endif

rcup: rcm $(HOME)/.rcrc
ifndef RCUP
	PATH=/tmp/rcm/bin:$(PATH) rcup -f
else
	$(RCUP) -f
endif

rcdn: rcm
ifndef RCDN
	PATH=/tmp/rcm/bin:$(PATH) rcdn
else
	$(RCDN)
endif

latest:
	@cd $(DOTFILES_DIR) && git pull

update: latest rcup

clean:
	@rm -rf /tmp/rcm-$(RCM_VERSION)
	@rm -rf /tmp/rcm

