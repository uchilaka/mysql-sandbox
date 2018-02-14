#!/bin/bash
if ! [ -d ./.git ]; then 
    echo "Invalid .git repository. you need to run \"git init\" to initialize your github repository"
    exit 1
fi
git add -A
if [[ -z "$1" ]]; then
    COMMIT_NOTE="Nothing to see here. Just updating..."
else
    COMMIT_NOTE="$1"
fi
git commit -m "$COMMIT_NOTE"
git push
