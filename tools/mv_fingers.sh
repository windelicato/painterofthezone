#!/bin/bash

dest="../gamedata/particles/srbd"

files_to_modify=$(grep -RnisIl "srbd_finger" $dest | sort | uniq)
for file in $files_to_modify; do
    #echo $file
    updates=$(grep -RnisIh "srbd_finger" $file | sort | uniq | awk '{print $NF}')
    for update in $updates; do
        echo "---------"
        particle_name=$(echo "$update" | rev | cut -d "\\" -f 1 | rev)
        particle_path=$(echo "$update" | rev | cut -d "\\" -f 2- | rev )
        echo "$update"
        echo "$particle_name"
        echo "$particle_path"
        #sed -i "s/srbd\\\\hit/srbd\\\\fingers/g" $file
        updated_path=$(echo $update | sed "s/srbd\\\\hit/srbd\\\\fingers/g")
        sed_find=$(echo $update | sed "s/\\\\/\\\\\\\\/g")
        sed_replace=$(echo $updated_path | sed "s/\\\\/\\\\\\\\/g")
        echo $sed_find
        echo $sed_replace
        sed -i "s/$sed_find/$sed_replace/g" $file

    done
    echo "---------"
done