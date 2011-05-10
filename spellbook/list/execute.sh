#!bash

# Grab the spellbook directories that actually exist
actual_spellbook_directories=`spellbook get-actual-spellbook-directories`

# Display all of the unique spells available
echo `ls $actual_spellbook_directories | grep -v "^$\\|/" | sort -u | uniq`
