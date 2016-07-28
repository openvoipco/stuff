#!/bin/bash

# Usage git-pull-all.sh [exclude_folder1 [exclude_folderN]]

DIR=$(pwd)
ROOT=/wayfair/data/codebase

for dir in $ROOT/*
do
    if [ -d $dir ] && [ -d $dir/.git ]; then
	for skip_dir in $@
        do
	    if [ "$skip_dir" == "$(basename $dir)" ]; then
    		printf "${COLOR_CYAN}>>> Skipping $dir${COLOR_NC}\n"
    		continue 2
	    fi
	done
	printf "${COLOR_GREEN}>>> Updating dir $dir ${COLOR_NC}\n"
	cd $dir && { git diff-files --ignore-submodules --quiet && git checkout master && git pull; } && printf "${COLOR_GREEN}>>> Dir $dir is updated${COLOR_NC}\n" || printf "${COLOR_RED}>>> Dir $dir is NOT updated !!!${COLOR_NC}\n"
    fi
done

cd $DIR
