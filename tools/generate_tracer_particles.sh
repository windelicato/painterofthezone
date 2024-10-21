#!/bin/bash

base_dir="gamedata/particles/srbd/hit/fractional"

declare -a tracers=("srbd_finger_tracer_up" "srbd_finger_tracer_out_up" "srbd_finger_tracer_out")
declare -a tracer_options=("_up" "_out_up" "_out")
declare -a tracer_types=("" "_armor")

for (( i=0; i<10; i++ )); do
    index=$(($i+1))

    output_dir="$base_dir/$index"
    mkdir $output_dir

    for tracer in "${tracers[@]}"; do
        tracer_output="$output_dir/$tracer.pe"
        tracer_input="$base_dir/$tracer.pe"
        cp $tracer_input $output_dir 

        find="        max_particles                    = 10"
        replace="        max_particles                    = $index"
        sed -i "s/$find/$replace/g" $tracer_output
    done

    for type in "${tracer_types[@]}"; do
        basename="srbd_hit_finger"
        for option in "${tracer_options[@]}"; do
            filename="$basename$option$type.pg"
            output="$output_dir/$filename"
            input="$base_dir/$filename"
            cp $input $output_dir

            find="effect_name                      = srbd\\\\hit\\\\srbd_finger_tracer$option"
            replace="effect_name                      = srbd\\\\hit\\\\fractional\\\\$index\\\\srbd_finger_tracer$option"
            sed -i "s/$find/$replace/g" $output
            echo ""
            echo ""
        done
    done
done

#dest="gamedata/particles/srbd"
#output="gamedata/particles/srbd/effects/hfx"
#input="gamedata/particles/hit_fx/effects"
#files_to_move=$(grep -Rh "hit_fx" $dest | sort | uniq | awk '{print $NF}' | sed 's/\\/\//g' | sed 's/\r/\n/g')
#
#mkdir $output
#
#for file in $files_to_move; do
#    filename="$(basename $file ).pe"
#    cp "$input/$filename" $output
#done
#
#files_to_modify=$(grep -RHl "hit_fx" $dest)
#for file in $files_to_modify; do
#    echo $file
#    sed -i 's/hit_fx\\effects/srbd\\effects\\hfx/g' $file
#done