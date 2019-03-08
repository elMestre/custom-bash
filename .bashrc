# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

###############################################
###############################################
# SET THIS CONFIG TO YOUR CONVENIENCE:

moduleFolder=~/custom/bash

modules=(
    aliases
    bash_completion
    colorize
    history
    pathAndExports
    prompt
    prompt_dynamic
    proxy
)

###############################################
###############################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -d ${moduleFolder} ]; then
    for module in "${modules[@]}"
    do
        if [ -f $moduleFolder/${module} ]; then
            . $moduleFolder/${module}
        fi
    done
else
    echo "moduleFolder not found, please, check config in .bashrc file"
fi


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

## Docker Autocompletion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     . $(brew --prefix)/etc/bash_completion
# fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
