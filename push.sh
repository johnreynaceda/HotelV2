#!/bin/bash

# Add all changes
git add .

# Commit with a message (passed as argument or use default)
commit_message=${1:-"Auto-commit: changes pushed via script"}
git commit -m "$commit_message"

# Push to the current branch
git push
