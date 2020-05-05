#!/bin/bash


# loop 5 times: write from chars [i] to [i+1] & commit

# params - source folder, source file, dest, hrs
DIR=$1
SRC=$2
DEST=$3
HRS=$4

cd "$DEST"

# check if repo exists at dest, if not, make it
if [ -d ".git/" ]
then
    echo "Repo exists at directory"
else
    echo "Repo does not exist"
    git init
fi

# divide dest into 5 line chunks, store in array [0,5,10,15,21] 
lines=`wc -l < $SRC`
chunk_size=$((lines / 4))

while IFS= read line; do

done < $SRC

read