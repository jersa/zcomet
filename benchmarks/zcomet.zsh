# This benchmark file for zcomet is intended to be used with
# zimfw/zsh-framework-benchmark; just place it in the
# /path/to/zsh-framework-benchmark/frameworks directory, and you will see
# zcomet's performance compared to that of the major plugin managers and
# frameworks.

() {
local -r home_dir=${1}

setopt EXTENDED_GLOB

cp ${HOME}/.zcomet/bin/zcomet.zsh $home_dir
mkdir ${home_dir}/functions
cp -r ${HOME}/.zcomet/bin/functions/*~*.zwc ${home_dir}/functions

# add modules to .zshrc
print 'source ${HOME}/zcomet.zsh
zcomet load zimfw/environment
zcomet load zimfw/git
zcomet load zimfw/input
zcomet load zimfw/termtitle
zcomet load zimfw/utility
zcomet load zimfw/duration-info
zcomet load zimfw/git-info
zcomet load zimfw/asciiship
zcomet fpath zsh-users/zsh-completions src
zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-history-substring-search
# zcomet adds functions to fpath but does not autoload them!
autoload -Uz git-alias-lookup \\
         git-branch-current \\
         git-branch-delete-interactive \\
         git-dir \\
         git-ignore-add \\
         git-root \\
         git-stash-clear-interactive \\
         git-stash-recover \\
         git-submodule-move \\
         git-submodule-remove \\
         mkcd \\
         mkpw \\
         duration-info-precmd \\
         duration-info-prexec \\
         coalesce \\
         git-action \\
         git-info
[[ $TERM != dumb ]] && () {
  zcomet compinit
}

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
' >>! ${home_dir}/.zshrc

} "${@}"
