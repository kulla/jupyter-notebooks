#!/bin/bash

NOTEBOOK_DIR="notebooks"
NOTEBOOK_TITLE="$@"

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

# Convert the input string to lowercase, replace spaces with hyphens, and trim
# leading/trailing spaces or hyphens.
FILENAME=$(echo "$NOTEBOOK_TITLE" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | sed 's/^[ \-]*//;s/[ \-]*$//')

# Define the notebook path
NOTEBOOK_PATH="$NOTEBOOK_DIR/$YEAR/$YEAR-$MONTH-$DAY-$FILENAME.ipynb"

# Create the directory structure if it doesn't exist
mkdir -p "$(dirname "$NOTEBOOK_PATH")"

# Create the new jupyter notebook
cp template.ipynb "$NOTEBOOK_PATH"

sed -i "s/NOTEBOOK_TITLE/$NOTEBOOK_TITLE/g" "$NOTEBOOK_PATH"
sed -i "s/YEAR/$YEAR/g" "$NOTEBOOK_PATH"

# Open the jupyter notebook
jupyter lab --notebook-dir="$NOTEBOOK_DIR" "$NOTEBOOK_PATH"
