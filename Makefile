SYMLINKS ?= gitconfig screenrc vim vimrc zshenv zshrc inputrc gitignore

symlink:
	cd ~ && for filename in $(SYMLINKS); do \
		ln -s dotfiles/$$filename .$$filename; \
	done

freshen:
	# temp dir
	mkdir -p tmp
	# Tomorrow theme: https://github.com/chriskempson/tomorrow-theme/
	rm -rf tmp/tomorrow
	git clone git://github.com/chriskempson/tomorrow-theme.git tmp/tomorrow
	cp tmp/tomorrow/vim/colors/*.vim vim/colors

clean:
	rm -rf tmp
