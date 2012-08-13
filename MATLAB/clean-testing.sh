#!/bin/bash

echo "Cleaning testing files..."
rm --force --verbose josh_test.log josh_test.*.log
rm --force --verbose --recursive test/ test.*/
echo "DONE!"
exit 0
