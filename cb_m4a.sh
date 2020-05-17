#!/bin/sh
for fi in `ls`
do
    echo $fi
    if [ -d $fi ]
    then
        cd $fi
        echo $PWD
        `ffmpeg -f concat -safe 0 -i <(for f in ./*.m4a; do echo "file '$PWD/$f'"; done) -c copy $fi.m4a`
        cd ..
    fi
done
