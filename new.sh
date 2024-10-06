#!/bin/bash

NOTEBOOK_DIR="notebooks"
NOTEBOOK_TITLE="$@"

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

# Convert the input string to lowercase, replace spaces with hyphens, and trim
# leading/trailing spaces or hyphens.
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | sed 's/^[ \-]*//;s/[ \-]*$//')

# Create the directory structure if it doesn't exist
DIR="$NOTEBOOK_DIR/$YEAR"
mkdir -p "$DIR"

# Define the notebook path
NOTEBOOK_PATH="$DIR/$YEAR-$MONTH-$DAY-$FILENAME.ipynb"

# Create the new jupyter notebook
cp template.ipynb "$NOTEBOOK_PATH"

sed -i "s/NOTEBOOK_TITLE/$NOTEBOOK_TITLE/g" "$NOTEBOOK_PATH"
sed -i "s/YEAR/$YEAR/g" "$NOTEBOOK_PATH"

# Open the jupyter notebook
jupyter lab --notebook-dir="$NOTEBOOK_DIR" "$NOTEBOOK_PATH"
