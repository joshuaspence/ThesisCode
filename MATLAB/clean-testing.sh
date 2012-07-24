#!/bin/bash

echo "Cleaning..."
rm --verbose josh_test.log
rm --verbose --recursive test/
echo "DONE!"
exit 0
