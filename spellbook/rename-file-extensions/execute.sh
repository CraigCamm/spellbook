#!bash

# Create meaningful variable names for the input arguments
original_extension=$1
new_extension=$2

# Loop over all of the files in the current directory
for filename in *.$original_extension; do
    # Grab the filename without the original extension
    base_filename=`basename "$filename" ".$original_extension"`
    # Rename the file, replacing the extension with the new one
    mv "$base_filename.$original_extension" "$base_filename.$new_extension"
done
