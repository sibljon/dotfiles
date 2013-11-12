# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# ###
# Jon's additions:
# ###

# Delete Xcode's derived data folder
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData'

# Make prompt in the following form:
# top_level_directory_name(git_branch_name) [hamburger unicode character]source ~/.git-prompt.sh
source ~/.git-prompt.sh
PS1='\[\e[1;32m\]\W$(__git_ps1 "(%s)") 🏀  \[\e[0m\] '

# Reinstall cocoapods in an Xcode project's directory
alias podstall='rm -rf Podfile.lock; rm -rf Pods; pod install --verbose'
