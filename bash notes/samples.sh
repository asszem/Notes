#!/bin/bash
_file="$1"

# if filename not supplied at the command prompt
# display usae message and die
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }

echo "Script name: $0"
echo "Argument value: $1"
# Escaping $1 is \$1
echo "\$1 = $1, so \$_file set to $1"


read -t15 -n1 -r -p 'Press any key in the next 15 seconds...' key
if [ "$?" -eq "0" ]; then
    echo 'A key was pressed.'
	echo "The key that was pressed is $key"
else
    echo 'No key was pressed.'
fi

# if file not found, display an error and die
[ ! -f "$_file" ] && { echo "$0: $_file file not found."; exit 2; }

# if we are here, means everything is okay
echo "Processing $_file..."
