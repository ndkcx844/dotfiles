TARGETS = bashrc.pc bashrc.d bash_completion bash_completion.d 

deploy:
	@for SRC in $(TARGETS); do \
		DST=~/.$(notdir $${SRC%.pc}); \
		diff -qr $(CURDIR)/$$SRC $$DST > /dev/null 2>&1 && continue; \
		if [ -e $$DST ]; then \
			mv --force --no-clobber --suffix=.org --backup=numbered $$DST $${DST}.org; \
		fi; \
		ln -s $$(readlink -f $(CURDIR)/$$SRC) $$DST; \
	done
