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
