#!/bin/bash

# Define the commit message
commit_message="precommit"

# Fetch all branches from the remote
git fetch --all

# Loop through each branch except 'main'
for branch in $(git branch | grep -v '\->' | grep -v 'origin/main' | sed 's/origin\///'); do
    branch=$(echo $branch | xargs) # Trim whitespace
    echo "Processing branch: $branch"
    
    # Checkout the branch
    git checkout $branch

    # Add changes
    git add .

    # Commit the changes
    git commit -m "$commit_message"

    # Push the branch
    git push origin $branch

    echo "Finished processing branch: $branch"
done
