#!/bin/bash

function super-upgrade() {
	sudo apt update -y
	sudo apt full-upgrade -y
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ < \1> /'
}

function activate_env() {
    if ! command -v gum &> /dev/null
    then
	echo "Executable 'gum' is missing, here is how you can install it"
	echo ""
	echo "sudo mkdir -p /etc/apt/keyrings"
	echo "curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg"
	echo "echo \"deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *\" | sudo tee /etc/apt/sources.list.d/charm.list"
	echo "sudo apt update && sudo apt install gum"
	return 1
    fi
    PY_ENV_HOME="$HOME/PythonEnvironments/"
    PY_ENV_LIST=($(ls "$PY_ENV_HOME"))
    PY_ENV=$(gum choose "${PY_ENV_LIST[@]}")
    source "${PY_ENV_HOME}${PY_ENV}/bin/activate"
}

function gum_commit() {
    if ! command -v gum &> /dev/null
    then
	echo "Executable 'gum' is missing, here is how you can install it"
	echo ""
	echo "sudo mkdir -p /etc/apt/keyrings"
	echo "curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg"
	echo "echo \"deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *\" | sudo tee /etc/apt/sources.list.d/charm.list"
	echo "sudo apt update && sudo apt install gum"
	return 1
    fi
    TYPE=$(gum choose "fix" "feat" "wip" "docs" "style" "refactor" "test" "chore" "revert")
    SCOPE=$(gum input --placeholder "scope")
    test -n "$SCOPE" && SCOPE="($SCOPE)"
    SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change" --width 50)
    DESCRIPTION=$(gum write --placeholder "Details of this change (CRTL+D to finish)" --width 72)

    gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
}
