#!/bin/bash

base_dir="../gamedata/particles/srbd/fingers/fractional"

declare -a tracers=("srbd_finger_tracer_up" "srbd_finger_tracer_out_up" "srbd_finger_tracer_out")
declare -a tracer_options=("_up" "_out_up" "_out")
declare -a tracer_types=("" "_armor")
declare -a fingers=("smoke_point_blood_fingers_short" "smoke_point_fingers_short")
finger_action_1=52
finger_action_2=81

for (( i=0; i<10; i++ )); do
    particle_size_index=$(($i+1))
    size_output_dir="$base_dir/$particle_size_index"
    mkdir $size_output_dir

    ###########################################################################
    # Adjust finger size
    cp "$base_dir/../../hit/smoke_point_blood_fingers_short.pe" $size_output_dir
    cp "$base_dir/../../hit/smoke_point_fingers_short.pe" $size_output_dir

    for finger in ${fingers[@]}; do
        cp "$base_dir/../../hit/$finger.pe" $size_output_dir
        finger_file="$size_output_dir/$finger.pe"

        finger_size_1=$(printf "%6f\n" $(awk "BEGIN {print 1.25 * ($particle_size_index/10)}"))
        finger_action_replace_1="        vec_0001                         = $finger_size_1, $finger_size_1, 0.001000"
        sed -i "52s/.*/${finger_action_replace_1}/" $finger_file

        finger_size_2=$(printf "%6f\n" $(awk "BEGIN {print 1 * ($particle_size_index/10)}"))
        finger_action_replace_2="        v0                               = $finger_size_2, $finger_size_2, 0.000000"
        sed -i "81s/.*/${finger_action_replace_2}/" $finger_file

    done
    

    for (( j=0; j<10; j++ )); do
        particle_number_index=$(($j+1))

        output_dir="$base_dir/$particle_size_index/$particle_number_index"
        mkdir $output_dir

        for tracer in "${tracers[@]}"; do
            tracer_output="$output_dir/$tracer.pe"
            tracer_input="$base_dir/$tracer.pe"
            cp $tracer_input $output_dir 

            find="        max_particles                    = 10"
            replace="        max_particles                    = $particle_number_index"
            sed -i "s/$find/$replace/g" $tracer_output

            if [[ "$tracer" == "srbd_finger_tracer_out" ]]; then
                                                #v0                               = 0.000000, 0.010000, 15.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 15 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v0                               = 0.000000, 0.010000, $tracer_velocity"


                                                #v1                               = 0.000000, 0.100000, 15.000000
                sed -i "107s/.*/${tracer_velocity_replace}/" $tracer_output
                tracer_velocity_replace="        v1                               = 0.000000, 0.100000, $tracer_velocity"
                sed -i "108s/.*/${tracer_velocity_replace}/" $tracer_output

                                                #v2                               = 0.100000, 2.000000, 0.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 2 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v2                               = 0.100000, $tracer_velocity, 0.000000"
                sed -i "109s/.*/${tracer_velocity_replace}/" $tracer_output
            fi

            if [[ "$tracer" == "srbd_finger_tracer_up" ]]; then
                                    #107 v0                               = 0.000000, 5.000000, 0.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 5 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v0                               = 0.000000, $tracer_velocity, 0.000000"
                sed -i "107s/.*/${tracer_velocity_replace}/" $tracer_output


                                    #108 v1                               = 0.000000, 5.000000, 5.000000
                tracer_velocity_replace="        v1                               = 0.000000, $tracer_velocity, $tracer_velocity"
                sed -i "108s/.*/${tracer_velocity_replace}/" $tracer_output
                

                                    #109 v2                               = 0.100000, 2.000000, 0.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 2 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v2                               = 0.100000, $tracer_velocity, 0.000000"
                sed -i "109s/.*/${tracer_velocity_replace}/" $tracer_output
            fi

            if [[ "$tracer" == "srbd_finger_tracer_out_up" ]]; then
                                    #67         vec_0000                         = 0.000000, 2.000000, 0.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 5 * ($particle_size_index/10)}"))
                tracer_velocity_replace="         vec_0000                         = 0.000000, $tracer_velocity, 0.000000"
                sed -i "67s/.*/${tracer_velocity_replace}/" $tracer_output
                                    #107        v0                               = 0.000000, 0.010000, 15.000000
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 15 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v0                               = 0.000000, 0.010000, $tracer_velocity"
                sed -i "107s/.*/${tracer_velocity_replace}/" $tracer_output
                                    #108        v1                               = 0.000000, 0.100000, 15.000000
                tracer_velocity_replace="        v1                               = 0.000000, 0.100000, $tracer_velocity"
                sed -i "108s/.*/${tracer_velocity_replace}/" $tracer_output
                                    #109        v2                               = 0.100000, 12.000000, 0.000000            
                tracer_velocity=$(printf "%6f\n" $(awk "BEGIN {print 12 * ($particle_size_index/10)}"))
                tracer_velocity_replace="        v2                               = 0.100000, $tracer_velocity, 0.000000"
                sed -i "109s/.*/${tracer_velocity_replace}/" $tracer_output
            fi
        done

        for type in "${tracer_types[@]}"; do
            basename="srbd_hit_finger"
            for option in "${tracer_options[@]}"; do
                filename="$basename$option$type.pg"
                output="$output_dir/$filename"
                input="$base_dir/$filename"
                cp $input $output_dir

                find="effect_name                      = srbd\\\\fingers\\\\srbd_finger_tracer$option"
                replace="effect_name                      = srbd\\\\fingers\\\\fractional\\\\$particle_size_index\\\\$particle_number_index\\\\srbd_finger_tracer$option"
                sed="s/$find/$replace/g"
                sed -i ''"${sed}"'' $output
                find="on_play_child                    = srbd\\\\hit\\\\smoke_point_blood_fingers_short"
                replace="on_play_child                    = srbd\\\\fingers\\\\fractional\\\\$particle_size_index\\\\smoke_point_blood_fingers_short"
                sed="s/$find/$replace/g"
                sed -i ''"${sed}"'' $output
                find="on_play_child                    = srbd\\\\hit\\\\smoke_point_fingers_short"
                replace="on_play_child                    = srbd\\\\fingers\\\\fractional\\\\$particle_size_index\\\\smoke_point_fingers_short"
                sed="s/$find/$replace/g"
                sed -i ''"${sed}"'' $output
                echo ""
                echo ""
            done
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