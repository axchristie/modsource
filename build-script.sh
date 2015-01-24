#!/bin/bash
if [[ $# < 1 ]]; then
    echo "This script will build an anthology and process it to PDF. Please provide the names of the files (in the latex-partials subdirectory) that you would like to combine."
else 
    base="$(echo $@ | md5)"
    latexfile='output/'$base'.tex'

    cat templates/container-header.latex > $latexfile
    for var in "$@"
    do 
	# Check that filename exists.
	if [[ -f 'latex-partials/'$var'.tex' ]]; then
	    echo '\myinclude{../latex-partials/'$var'}' >> $latexfile
	else
	    echo $var ' not found.'
	fi 
    done
    echo '\end{document}' >> $latexfile
fi



