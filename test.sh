#!/bin/bash

# If number of arguments less then 1; print usage and exit
if [ $# -lt 1 ]; then
    printf "Usage: %s <application>\n" "$0" >&2
    exit 1
fi

bin="$1"                                       # The application (from command arg)

file_in="boxes.txt"                            # The in file
file_out_val="boxes_output_for_test.txt"       # The out file to check against
file_out_tst="boxes_output.txt"                # The outfile from test application

# Validate infile exists (do the same for out validate file)
if [ ! -f "$file_in" ]; then
    printf "In file %s is missing\n" "$file_in"
fi

if [ ! -f "$file_out_val" ]; then
    printf "Validation file %s is missing\n" "$file_out_val"
fi

ruby fill_the_box.rb 'boxes.txt' > "boxes_output.txt"

printf "Testing against %s\n" "$file_out_tst"

diff -iad "$file_out_tst" "$file_out_val"

e_code=$?
if [ $e_code != 0 ]; then
        printf "TEST FAIL : %d\n" "$e_code"
else
        printf "TEST OK!\n"
fi
exit 0