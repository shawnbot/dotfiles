SYMLINKS ?= gitconfig screenrc vim vimrc zshenv zshrc

symlink:
	for filename in $(SYMLINKS); do \
		echo "ln -s ~/.$$filename $$filename"; \
	done

freshen:
	# temp dir
	mkdir tmp;
	# Tomorrow theme: https://github.com/chriskempson/tomorrow-theme/
	rm -f tmp/tomorrow
	git clone git://github.com/chriskempson/tomorrow-theme.git tmp/tomorrow
	cp tmp/tomorrow/vim/colors/*.vim vim/colors
	# clean up after yourself
	# rm -f tmp

