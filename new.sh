#!/bin/bash

# Get the current year, month, and day from the system's date
YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

# Prompt the user to enter a filename, read it into the FILENAME variable, and
# format it
read -p "Enter filename: " INPUT

# Convert the input string to lowercase, replace spaces with hyphens, and trim
# leading/trailing spaces or hyphens.
FILENAME=$(echo "$INPUT" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | sed 's/^[ \-]*//;s/[ \-]*$//')

# Create the directory structure if it doesn't exist
DIR="notebooks/$YEAR"
mkdir -p "$DIR"

# Define the notebook path
NOTEBOOK_PATH="$DIR/$YEAR-$MONTH-$DAY-$FILENAME.ipynb"

# Open the jupyter notebook
jupyter notebook "$NOTEBOOK_PATH"
