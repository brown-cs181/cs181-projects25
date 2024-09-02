#!/bin/bash

# Check if a project number was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <project_number>"
    exit 1
fi

PROJECT_NUMBER=$1
ZIP_FILE="project${PROJECT_NUMBER}_submission.zip"

# Define the specific files to include for each project
FILES_TO_ZIP[0]="project0/hamming.* project0/kmers.* project0/reverse.*"
FILES_TO_ZIP[1]="project1/alignment/affine.* project1/alignment/local.* project1/alignment/global.* project1/scripts/align_reads.sh  project1/scripts/student_chipseq.r project1/alignment/application.pdf project1/outputs/abridged_counts.txt.summary"
FILES_TO_ZIP[2]="project2/dfa.* project2/kmp.* project2/application.pdf"
FILES_TO_ZIP[3]="project3/upgma.* project3/application.pdf"
FILES_TO_ZIP[4]="project4/viterbi.* project4/application.pdf project4/motif_hmm/*.py"

# Check if the project number is valid
if [ -z "${FILES_TO_ZIP[$PROJECT_NUMBER]}" ]; then
    echo "Invalid project number: $PROJECT_NUMBER"
    exit 1
fi

# Check if all files exist
for FILE in ${FILES_TO_ZIP[$PROJECT_NUMBER]}; do
    if [ ! -f "$FILE" ]; then
        echo "Error: Required file $FILE is missing."
        exit 1
    fi
done

# Create the zip file with the specific files
zip -j $ZIP_FILE ${FILES_TO_ZIP[$PROJECT_NUMBER]}

# Print the result
if [ $? -eq 0 ]; then
    echo "Created $ZIP_FILE successfully!"
else
    echo "Failed to create $ZIP_FILE."
    exit 1
fi