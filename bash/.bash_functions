#!/bin/bash

function super-upgrade() {
	sudo apt update -y
	sudo apt full-upgrade -y
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ < \1> /'
}

