#!/bin/bash
#set -evx

#directory="/mnt/c/Users/winde/OneDrive/Pictures/unreal_bood/originals/"
#output="/mnt/c/Users/winde/OneDrive/Pictures/unreal_bood/output/"

##mkdir output
#for dir in $directory*/
#do
#    basename=$(basename $dir)
#    for file in $dir*
#    do
#        filename=$(basename $file)
##        temp=${filename#*8K_}
##        type=${temp%.*}
##        if [ $type == "Roughness" ]
##        then
##            smoothness="$dir$basename-Smoothness.jpg"
##            #magick $output  -define colorspace:auto-grayscale=false -type truecolor -channel RGB -negate $smoothness
##        fi
##
##        if [ $type == "bump" ]
##        then
##            bumpfile="$dir${basename}_bump.dds"
##            echo $bumpfile
##            mv $file $bumpfile
##            #magick $output  -define colorspace:auto-grayscale=false -type truecolor -channel RGB -negate $smoothness
##        fi
##
##        if [ $filename == "color.dds" ]
##        then
##            dds="$dir${basename}.dds"
##            mv $file $dds
##        fi
##        if [ $filename == "color.jpg" ]
##        then
##            jpg="$dir${basename}.jpg"
##            mv $file $jpg
##        fi
#        #if [ $filename == "height.dds" ]
#        #then
#        #    height="$dir${basename}_bump#.dds"
#        #    mv $file $height
#        #fi
#        # backup bump#
#        #height="${basename}_bump#.dds"
#        #backup="${basename}_bump#BACKUP.dds"
#        #height_full_path="$dir${height}"
#        #if [ $filename == $height ]
#        #then
#        #    mv $dir$height $dir$height.BACKUP
#        #fi
#    done
#    cp ${dir}*.dds $output
#    mv *.dds $output
#done
#
##for file in $output*
##do
##    filename=$(basename $file)
##    temp=${filename#*8K_}
##    type=${temp%.*}
##    echo $filename
##done

output="/mnt/c/Users/winde/OneDrive/Pictures/unreal_bood/extra_output/"
directory="/mnt/c/Users/winde/OneDrive/Pictures/unreal_bood/extras/"
mkdir $output
for dir in $directory*/                  
do
     basename=$(basename $dir)
     for file in $dir*
     do
        filename=$(basename $file)
        temp=${filename#*8K_}
        type=${temp%.*}
        #output="$dir$basename-$type.jpg"
        #echo $filename $output
        if [ $type == "bump" ]
        then
             bumpfile="$dir${basename}_bump.dds"
             mv $file $bumpfile
        fi

        if [ $filename == "color.dds" ]
        then
             dds="$dir${basename}.dds"
             mv $file $dds
        fi
        if [ $filename == "color.jpg" ]
        then
            jpg="$dir${basename}.jpg"
            mv $file $jpg
        fi
        if [ $filename == "height.dds" ]
        then
            height="$dir${basename}_bump#.dds"
            mv $file $height
        fi
    done
    
    cp ${dir}*.dds $output
done