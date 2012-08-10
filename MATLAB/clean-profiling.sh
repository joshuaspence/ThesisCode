#!/bin/bash

echo "Cleaning..."
rm --force --verbose josh_profile.log josh_profile.*.log
rm --force --verbose --recursive Profiling/ Profiling.*/
echo "DONE!"
exit 0
