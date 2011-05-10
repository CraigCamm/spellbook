#!bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Determine the name of this script file
    script_filename=`basename $0`
    # Display the usage instructions for this script, then stop
    echo "Usage: $script_filename script-name [arguments...]"
    exit 1
fi

# Grab the name of the child script that we are trying to run
child_script_name=$1

# Shift the arguments one position
shift

# Determine the two spellbook locations for the current user
directory_spellbook=`pwd`"/spellbook"
users_spellbook=`echo ~`"/spellbook"
users_hidden_spellbook=`echo ~`"/.spellbook"

# Holds the name of the execute script files
execute="execute.sh"

# Create a list of filenames that the requested spell file could have
possible_spell_locations=$directory_spellbook"/"$child_script_name"/"$execute" \
    "$users_spellbook"/"$child_script_name"/"$execute" \
    "$users_hidden_spellbook"/"$child_script_name"/"$execute

# Loop over each of the possible spell locations
for current_spell_filename in $possible_spell_locations; do

    # If the current spell file exists
    if [ -f $current_spell_filename ]; then
        # Run it, forwarding the shifted arguments
        bash $current_spell_filename "$@"
        # Halt execution
        exit 0
    fi

done

# Explain to the user that the child script could not be found
echo "The spell $child_script_name could not be found in any of the configured spellbook directories."
exit 1
