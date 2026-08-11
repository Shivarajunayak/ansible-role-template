#!/bin/bash

# Fetch all branches from the remote
git fetch --all

# Loop through each branch
for branch in $(git branch -r | grep -v '\->' | grep -v 'main' | sed 's/origin\///'); do
    echo "Running pre-commit on branch: $branch"
    
    # Checkout the branch
    git checkout $branch

    # Run pre-commit hooks
    pre-commit run -a

    echo "Finished running pre-commit on branch: $branch"
done
