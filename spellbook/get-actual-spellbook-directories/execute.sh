#!bash

# Grab the spellbook directories that actually exist
possible_spellbook_directories=`spellbook get-possible-spellbook-directories`

# Define a place for the actual spellbook directories to go
actual_spellbook_directories=""

# Loop over all of the possible directory names
for current_directory in $possible_spellbook_directories; do
    # Check to see if this directory actually exists
    if [ -d $current_directory ]; then
        # Add this directory to the actual spellbook directories collection
        actual_spellbook_directories="$actual_spellbook_directories $current_directory"
    fi
done

# Remove any leading and trailing whitespace from the finished spellbook
# directories string
actual_spellbook_directories=`echo "$actual_spellbook_directories" | sed 's/^[[:space:]]*\(.*\)[[:space:]]*$/\1/'`

# Echo the spellbook directories that actually exist
echo $actual_spellbook_directories
