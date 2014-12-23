DOTFILES_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
RCM_TMP := $(DOTFILES_DIR)tmp/rcm
RCM_BIN := $(RCM_TMP)/rcm/bin
RCUP := $(shell which rcup)
ifndef RCUP
RCUP := $(RCM_BIN)/rcup
endif
RCDN := $(shell which rcdn)
ifndef RCDN
RCDN := $(RCM_BIN)/rcdn
endif
RCM_VERSION := 1.2.3

default: update

$(HOME)/.rcrc:
	@ln -s $(DOTFILES_DIR)/rcrc $(HOME)/.rcrc

$(RCM_TMP):
	@mkdir -p $(RCM_TMP)

$(RCM_TMP)/rcm-$(RCM_VERSION).tar.gz: | $(RCM_TMP)
	@cd $(RCM_TMP) && wget https://thoughtbot.github.io/rcm/dist/rcm-$(RCM_VERSION).tar.gz

$(RCM_TMP)/rcm-$(RCM_VERSION): | $(RCM_TMP)/rcm-$(RCM_VERSION).tar.gz
	@cd $(RCM_TMP) && tar -xvf rcm-$(RCM_VERSION).tar.gz

$(RCM_BIN)/rcup $(RCM_BIN)/rcdn: | $(RCM_TMP)/rcm-$(RCM_VERSION)
	@cd $(RCM_TMP)/rcm-$(RCM_VERSION) && ./configure --prefix=$(RCM_TMP)/rcm && $(MAKE) && $(MAKE) install

rcup: | $(RCUP) $(HOME)/.rcrc
	PATH=$(RCM_BIN):$(PATH) $(RCUP) -f

rcdn: | $(RCDN)
	PATH=$(RCM_BIN):$(PATH) $(RCDN)

latest:
	@cd $(DOTFILES_DIR) && git pull

update: latest rcup

clean:
	@rm -rf $(RCM_TMP)

