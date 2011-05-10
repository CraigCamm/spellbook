#!/bin/sh

# Display a warning and prevent the spellbook from running
echo "Don't ever try to run the spellbook directly. Copy-and-paste only what you need from it."
exit 0

x="pn"; nx="png"; for f in *.$x; do b=`basename "$f" ".$x"`; echo "$b.$x - $b.$nx"; mv "$b.$x" "$b.$nx"; done # Renames all of the files in the current directory with file extension $x to have file extension $nx
