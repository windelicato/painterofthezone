#!/bin/bash

dest="gamedata/particles/srbd"
output="gamedata/particles/srbd/effects/hfx"
input="gamedata/particles/hit_fx/effects"
files_to_move=$(grep -Rh "hit_fx" $dest | sort | uniq | awk '{print $NF}' | sed 's/\\/\//g' | sed 's/\r/\n/g')

mkdir $output

for file in $files_to_move; do
    filename="$(basename $file ).pe"
    cp "$input/$filename" $output
done

files_to_modify=$(grep -RHl "hit_fx" $dest)
for file in $files_to_modify; do
    echo $file
    sed -i 's/hit_fx\\effects/srbd\\effects\\hfx/g' $file
done