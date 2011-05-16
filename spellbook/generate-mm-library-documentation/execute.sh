#!/bin/bash

# Grab a reference to the current directory
current_directory=`pwd`

# Move into the workspace directory
cd ~/Workspace

# Delete all of the current documentation files
rm -rf mm_Library_Documentation

# Re-create the documentation directory
mkdir mm_Library_Documentation

# Run PHPDocumentor on the mm_Library/application directory
phpdoc -o HTML:frames:earthli -d mm_Library/application -t mm_Library_Documentation

# Hop into the generated documentations media directory
cd mm_Library_Documentation/media

# Correct the .cs files and make them into .css files
spellbook rename-file-extensions cs css

# Hop into the images directory
cd images

# Correct the .pn files and make them into .png files
spellbook rename-file-extensions pn png

# Copy the documentation files over to the vm share directory
rm -rf /media/sf_VM-Share && cp -r ~/Workspace/mm_Library_Documentation /media/sf_VM-Share

# Hop back to the directory we were in when we started this script
cd $current_directory
