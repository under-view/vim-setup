#!/bin/bash

SUCCESS=0
FAILURE=1

CDIR="$(pwd)"

GITURI="https://github.com"

# Create bundle + plugin directories
create_directories() {
	mkdir -p "${HOME}/.vim/bundle/Vundle.vim"
	mkdir -p "${HOME}/.vim/bundle/preservim/nerdtree"
	mkdir -p "${HOME}/.vim/bundle/airblade/vim-gitgutter"
	mkdir -p "${HOME}/.vim/bundle/jiangmiao/auto-pairs"
	mkdir -p "${HOME}/.vim/bundle/igankevich/mesonic"
	mkdir -p "${HOME}/.vim/bundle/tikhomirov/vim-glsl"
	mkdir -p "${HOME}/.vim/bundle/kergoth/vim-bitbake"
	mkdir -p "${HOME}/.vim/bundle/bfrg/vim-cpp-modern"

	mkdir -p "${HOME}/.vim/pack/colors/start"
	mkdir -p "${HOME}/.vim/pack/themes/start"

	mkdir -p "${HOME}/.vim/syntax"

	mkdir -p "${HOME}/.vim/autoload"

	mkdir -p "${HOME}/.vim/colors"

	return $SUCCESS
}


clone_plugins_syntax_colors() {
	# Plugins
	git clone "${GITURI}/VundleVim/Vundle.vim.git"   "${HOME}/.vim/bundle/Vundle.vim"             || return $FAILURE
	git clone "${GITURI}/preservim/nerdtree.git"     "${HOME}/.vim/bundle/preservim/nerdtree"     || return $FAILURE
	git clone "${GITURI}/airblade/vim-gitgutter.git" "${HOME}/.vim/bundle/airblade/vim-gitgutter" || return $FAILURE
	git clone "${GITURI}/jiangmiao/auto-pairs.git"   "${HOME}/.vim/bundle/jiangmiao/auto-pairs"   || return $FAILURE
	git clone "${GITURI}/igankevich/mesonic.git"     "${HOME}/.vim/bundle/igankevich/mesonic"     || return $FAILURE
	git clone "${GITURI}/tikhomirov/vim-glsl.git"    "${HOME}/.vim/bundle/tikhomirov/vim-glsl"    || return $FAILURE
	git clone "${GITURI}/kergoth/vim-bitbake.git"    "${HOME}/.vim/bundle/kergoth/vim-bitbake"    || return $FAILURE
	git clone "${GITURI}/bfrg/vim-cpp-modern.git"    "${HOME}/.vim/bundle/bfrg/vim-cpp-modern"    || return $FAILURE

	# Syntax
	git clone "${GITURI}/under-view/vim-vulkan.git" "${HOME}/.vim/syntax"           || return $FAILURE
	rm                                              "${HOME}/.vim/syntax/README.md" || return $FAILURE

	# Colors
	git clone "${GITURI}/joshdick/onedark.vim.git"  "${HOME}/.vim/onedark.vim" || return $FAILURE
	cp -ra    "${HOME}/.vim/onedark.vim/autoload"/* "${HOME}/.vim/autoload"    || return $FAILURE
	cp -ra    "${HOME}/.vim/onedark.vim/colors"/*   "${HOME}/.vim/colors"      || return $FAILURE
	rm -rf                                          "${HOME}/.vim/onedark.vim" || return $FAILURE

	return $SUCCESS
}

create_directories || {
	echo "[x] create_directories: failed to created directories"
	exit $FAILURE
}

clone_plugins_syntax_colors || {
	echo "[x] clone_plugins_syntax_colors: failed to clone and copy plugins"
	exit $FAILURE
}

cp -a "${CDIR}/vimrc" "${HOME}/.vimrc" || {
	echo "[x] cp: failed to copy vimrc"
	exit $FAILURE
} 

echo -e "\n\nSuccessfully cloned and install vim plugins + syntax"
echo "Be sure to open vim and run \":PluginInstall\" to install plugins"

exit $SUCCESS
