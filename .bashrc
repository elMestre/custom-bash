# # # # # # # # # # # # # # # # # # # # # # # #
# SET THIS CONFIG TO YOUR CONVENIENCE:
# # # # # # # # # # # # # # # # # # # # # # # #

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

moduleFolder=$HOME/.bash
modules=(
    10_history
    20_winsize
    30_prompt_vanilla
    40_bash_completion
    50_pathAndExports
    80_nvm_npm_node
    90_aliases
    # 99_colors
    # 99_prompt
    # 99_prompt_dynamic
)

moduleErrors=false

if ! [ -d ${moduleFolder} ]; then
    echo "moduleFolder not found, please, check config in .bashrc file" >&2
else
    for module in "${modules[@]}"
    do
        if ! [ -f $moduleFolder/${module} ]; then
            echo "warn: Module '"${module}"' not found" >&2
            moduleErrors=true
        else
            . $moduleFolder/${module}
        fi
    done
    if [ $moduleErrors = true ] ; then
        echo >&2
    fi
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
