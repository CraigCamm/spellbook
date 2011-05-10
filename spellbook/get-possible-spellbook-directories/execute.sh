#!/bin/bash

# Determine the possible spell directories
directory_spellbook=`pwd`"/spellbook"
users_spellbook=`echo ~`"/spellbook"
users_hidden_spellbook=`echo ~`"/.spellbook"

# Echo the possible spell directories
echo $directory_spellbook $users_spellbook $users_hidden_spellbook
