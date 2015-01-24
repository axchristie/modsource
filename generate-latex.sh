#!/bin/bash
# This script will get all the markdown files in 
# a specificed directory and generate partial 
# latex files from them, which can then be used 
# in conjunction with the build-anthology script
# to build an anthology.

rootdir="/Users/csforste/Projects/modsource-anthology"

texts=$rootdir"/markdown"
outdirectory=$rootdir"/latex-partials"

template=$rootdir"/templates/individual.latex"
filterdir=$rootdir"/python-filters/"

declare -a filters=("poetry.py")

files="$(find $texts -type f -name "*.md")"

filterstring=""
for i in "${filters[@]}"
do
#    echo $filterstring
#    echo $filterdir$i
    filterstring="$filterstring --filter=$filterdir$i"
done

for source in $files; 
do
    filename=$(basename $source)
    name="${filename%.md}.tex"
#    echo $name
    destination=$outdirectory'/'$name
    echo "Converting " $source " to " $destination
    pandoc -o $destination $filterstring --template=$template $source
done





