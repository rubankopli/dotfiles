#!/bin/bash

# Check if the number of commits to squash is provided
if [ -z "$1" ]; then
	echo "Error: Please specify the number of commits to squash"
	echo "Usage: git squash <number of commits>"
	exit 1
fi

# Show commits which will be squashed:
echo "The following commits will be squashed:"
git log -n "$1" --pretty=format:"    %C(bold cyan)%an%C(reset) %C(bold yellow)%cr%C(reset) %C(green)%s%C(reset)"

# Confirm squash
read -p "Do you wish to proceed? (y/N)" confirmation
if [[ "$confirmation" != [yY] ]]; then
        echo "Operation cancelled!"
        exit 0
fi

# Do the squash!
echo "Squashing the last ${1} commits..."

# Reset the current branch to the commit just before the last n commits.
git reset --soft HEAD~"$1"

# HEAD@{1} is where the branch was just before the previous command.
git merge --squash "HEAD@{1}"

# Commit the squashed changes. Commit message should be pre-populated with the commit messages of all the squashed commits.
git commit

