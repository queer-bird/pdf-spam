#!/bin/bash

# Path to the PDF file to insert
insert_file="./Page_Insert.pdf"

# Directory containing the PDF files
pdf_dir="../"

# Loop through each PDF file in the directory
find "$pdf_dir" -type f -name "*.pdf" | while read -r file; do
    # Insert the PDF file at the second page
    pdftk A="$file" B="$insert_file" cat A1-1 B A2-end output "$file"_new && mv "$file"_new "$file"
done
