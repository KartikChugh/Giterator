#!/bin/bash

# Parameters
FILE=$1
DEST=$2
HRS=${3:0}
CHUNKS=${4:-5}

fluct=$(( HRS*60*60 / 20 / $CHUNKS )) # seconds

if [ ! -d "$DEST" ]; then
    echo "giterator >> Destination $DEST doesn't exist. Create? [Y = Yes]"
    read input
    input=$(echo "$input" | awk '{print tolower($0)}')
    if [ $input == "y" ]; then
        mkdir "$DEST"
    else
        exit 0
    fi
fi

# Make repo at destination if non-existent
wd=$(PWD)
cd "$DEST"

if [ -d ".git/" ]; then
    echo "giterator >> Repo exists at directory"
else
    echo "giterator >> Repo does not exist"
    git init
fi

cd "$wd"

# Store lines of source file into array
linecount=`wc -l < "$FILE"`
chunk_size=$(( linecount / $CHUNKS + 1 ))
filename="$(basename -- "$FILE")"
period=$((HRS * 60 * 60 / $CHUNKS)) # in seconds

echo
echo "giterator >> File name: $filename"
echo "giterator >> File size: $linecount lines"
echo "giterator >> Chunk size: $chunk_size lines"
echo "giterator >> Chunk period: $period seconds"

mapfile -t lines < "$FILE"

# Write to destination file periodically
for (( chunk_i=0; chunk_i<$CHUNKS; chunk_i++ ))
do
    line_start=$((chunk_i * chunk_size))
    line_end=$((line_start + chunk_size-1))

    if (( $line_end > $linecount ))
    then line_end=$linecount
    fi

    echo
    echo "giterator >> Working on chunk $chunk_i ($line_start to $line_end)"

    # Sleep period +/- fluct
    rng=$((`shuf -i 0-$fluct -n 1` * 2 - $fluct))
    period_i=$(( period +  $rng))
    sleep $period_i

    for (( line_j=$line_start; line_j<=$line_end; line_j++ ))
    do
        line=${lines[line_j]}
        echo "$line" >> "$DEST/$filename"
    done

    echo "giterator >> Wrote chunk $chunk_i"
    
    # Skip one in five commits
    r=$(( $RANDOM % 5 ))
    if (( $line_end == $linecount )) || (( $r > 0 )); then
        echo 
        cd "$DEST"
        git add .
        git commit -m "Update $filename"
        cd "$wd"
    else echo "giterator >> Skipping commit";
    fi
done

truncate -s -1 "$DEST/$filename" # Removes ending newline
cd "$DEST"
git add .
git commit -m "Update $filename"
cd "$wd"

echo "giterator >> Done."