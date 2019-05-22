#!/usr/bin/env zsh

if [[ -n $ZSH ]] then
    if [[ `basename $ZSH` == ".oh-my-zsh" ]] then
        mkdir -p "$ZSH/custom/plugins/workplace"
        cp _workplace $ZSH/custom/plugins/workplace/_workplace
        cp workplace.plugin.zsh $ZSH/custom/plugins/workplace/workplace.plugin.zsh
        cp README.md $ZSH/custom/plugins/workplace/README.md
    else
        echo "ZSH env variable doesn't contains .oh-my-zsh path!"
        return 1
    fi
else
    echo "Missing ZSH env variable"
    return 1
fi
