#!/bin/bash

################################################################################
# Display the number of rows and columns in a file.
#
# http://dancingpenguinsoflight.com/2011/01/counting-columns-in-a-csv-from-the-cli-on-linux/
################################################################################

if [ $# -le 0 ]; then
    echo "No file name was specified" >&2
    exit 1
fi

DELIM=","
FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File not found: ${FILE}" >&2
    exit 2
fi

echo "# of lines | Columns in ${FILE}"
echo "(>1 row means there are other separators in the file):"
awk -F"$DELIM" '{print NF}' "${FILE}" | sort | uniq -c

exit 0
