#!/bin/bash

echo "Cleaning..."
rm --force --verbose josh_test.log
rm --force --verbose --recursive test/
echo "DONE!"
exit 0
