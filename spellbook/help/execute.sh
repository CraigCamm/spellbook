#!/bin/bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook help [spell-name]"
    exit 1
fi

# Grab the name of the spell script that we are trying to run
spell_name=$1

# Grab the spellbook directories that actually exist
actual_spellbook_directories=`spellbook get-actual-spellbook-directories`

# Loop over each of the possible spell locations
for current_spellbook_directory in $actual_spellbook_directories; do

    # Create a shortcut variable to the current search filename
    help_filename=$current_spellbook_directory"/"$spell_name"/HELP"

    # If the current spell file exists
    if [ -f $help_filename ]; then
        # Display the help file
        cat $help_filename
        # Halt execution
        exit 0
    fi

done

# Explain to the user that the spell does not provide a help file
echo "No help file found for $spell_name."
exit 1
