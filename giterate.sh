#!/bin/bash

# params - source file, dest folder, hrs
FILE=$1
DEST=$2
HRS=$3

cd "$DEST"

# check if repo exists at dest, if not, make it
if [ -d ".git/" ]
then
    echo "Repo exists at directory"
else
    echo "Repo does not exist"
    git init
fi

# divide dest into 5 line chunks, store in array e.g. [0..,5..,10..,15..,21] 
lines=`wc -l < "$FILE"`
chunk_size=$((lines / 4))

echo $lines
echo $chunk_size

for chunk_i in {0..4}
do
    chunks[$chunk_i]=""
done

i=0
while IFS= read -r line; do
    chunk_i=$((i / chunk_size))
    temp=${chunks[$chunk_i]}
    temp+=$line
    temp+=$'\n'
    chunks[$chunk_i]=$temp

    i=$((i+1))
done < "$FILE"

# loop 5 times: write from chars [i] to [i+1] & commit
filename="$(basename -- "$FILE")"

for chunk_i in {0..4}
do
    chunk=${chunks[$chunk_i]}
    echo $chunk >> "$DEST/$filename"
    echo "Wrote chunk $chunk_i"
    sleep 0.1
done


echo "Done."