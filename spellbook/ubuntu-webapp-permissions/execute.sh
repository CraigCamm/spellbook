#!/bin/bash

# Assign a default destination directory
destination_directory=.

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook permissions-ubuntu-webapp [-u ][your-username] [-d destination-directory]"
    exit 1
fi

while getopts "u:d:" opt; do
    case $opt in
        u)
            username=$OPTARG
        ;;
        d)
            destination_directory=$OPTARG
        ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
        ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
        ;;
    esac
done

echo $destination_directory" "$username

exit 0

# Define the standard data
ubuntu_apache_group=www-data

# Define the file and directory modes to apply
file_mode=664
directory_mode=775

# change the user on all of the files and directories
chown -R $username $destination_directory

# change the group on all of the files and directories
chgrp -R $ubuntu_apache_group $destination_directory

# change permissions on files and directories.
find $destdir -type f -print0 | xargs -0 chmod $file_mode $i
find $destdir -type d -print0 | xargs -0 chmod $directory_mode $i
