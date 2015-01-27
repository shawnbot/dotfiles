SYMLINKS ?= \
	agignore \
	gitconfig \
	gitignore \
	inputrc \
	jshintrc \
	screenrc \
	vim \
	vimrc \
	zshenv \
	zshrc

all: symlink

symlink:
	@rm -f ~/.vim # this will fail if ~/.vim is a directory
	@cd ~ && for filename in $(SYMLINKS); do \
		ln -vis dotfiles/$$filename .$$filename; \
	done
