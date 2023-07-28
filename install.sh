#!/bin/bash

SUCCESS=0
FAILURE=1

CDIR="$(pwd)"

GIT_URL="https://github.com"
VIM_INSTALL_DIR="${HOME}/.vim"
VIMRC_INSTALL_DIR="${HOME}/.vimrc"


# Create bundle + plugin directories
create_directories() {
	mkdir -p "${VIM_INSTALL_DIR}/bundle/Vundle.vim"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/preservim/nerdtree"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/airblade/vim-gitgutter"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/jiangmiao/auto-pairs"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/igankevich/mesonic"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/tikhomirov/vim-glsl"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/kergoth/vim-bitbake"
	mkdir -p "${VIM_INSTALL_DIR}/bundle/bfrg/vim-cpp-modern"

	mkdir -p "${VIM_INSTALL_DIR}/pack/colors/start"
	mkdir -p "${VIM_INSTALL_DIR}/pack/themes/start"

	mkdir -p "${VIM_INSTALL_DIR}/syntax"

	mkdir -p "${VIM_INSTALL_DIR}/autoload"

	mkdir -p "${VIM_INSTALL_DIR}/colors"

	return $SUCCESS
}


clone_plugins_syntax_colors() {
	# Plugins
	git clone "${GIT_URL}/VundleVim/Vundle.vim.git"   "${VIM_INSTALL_DIR}/bundle/Vundle.vim"             || return $FAILURE
	git clone "${GIT_URL}/preservim/nerdtree.git"     "${VIM_INSTALL_DIR}/bundle/preservim/nerdtree"     || return $FAILURE
	git clone "${GIT_URL}/airblade/vim-gitgutter.git" "${VIM_INSTALL_DIR}/bundle/airblade/vim-gitgutter" || return $FAILURE
	git clone "${GIT_URL}/jiangmiao/auto-pairs.git"   "${VIM_INSTALL_DIR}/bundle/jiangmiao/auto-pairs"   || return $FAILURE
	git clone "${GIT_URL}/igankevich/mesonic.git"     "${VIM_INSTALL_DIR}/bundle/igankevich/mesonic"     || return $FAILURE
	git clone "${GIT_URL}/tikhomirov/vim-glsl.git"    "${VIM_INSTALL_DIR}/bundle/tikhomirov/vim-glsl"    || return $FAILURE
	git clone "${GIT_URL}/kergoth/vim-bitbake.git"    "${VIM_INSTALL_DIR}/bundle/kergoth/vim-bitbake"    || return $FAILURE
	git clone "${GIT_URL}/bfrg/vim-cpp-modern.git"    "${VIM_INSTALL_DIR}/bundle/bfrg/vim-cpp-modern"    || return $FAILURE

	# Syntax
	git clone "${GIT_URL}/under-view/vim-vulkan.git" "${VIM_INSTALL_DIR}/syntax"           || return $FAILURE
	rm                                               "${VIM_INSTALL_DIR}/syntax/README.md" || return $FAILURE

	# Colors
	git clone "${GIT_URL}/joshdick/onedark.vim.git"       "${VIM_INSTALL_DIR}/onedark.vim" || return $FAILURE
	cp -ra    "${VIM_INSTALL_DIR}/onedark.vim/autoload"/* "${VIM_INSTALL_DIR}/autoload"    || return $FAILURE
	cp -ra    "${VIM_INSTALL_DIR}/onedark.vim/colors"/*   "${VIM_INSTALL_DIR}/colors"      || return $FAILURE
	rm -rf                                                "${VIM_INSTALL_DIR}/onedark.vim" || return $FAILURE

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


cp -a "${CDIR}/vimrc" "${VIMRC_INSTALL_DIR}" || {
	echo "[x] cp: failed to copy vimrc"
	exit $FAILURE
} 

echo -e "\n\nSuccessfully cloned and install vim plugins + syntax"
echo "Be sure to open vim and run \":PluginInstall\" to install plugins"

exit $SUCCESS
