#!/bin/zsh

# Use inklecate to compile all ink in /data/dialogue

# for each file ending in .ink in /data/dialogue
for file in ink/*.ink; do
    # compile the file and output to the same directory with the same name but .json extension
    output_name=${file%.ink}
    ink/inklecate_mac/inklecate -o $output_name.json $file
done