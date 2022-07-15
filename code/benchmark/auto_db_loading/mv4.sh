#!/usr/bin/env bash

# clear the recording file
cd ..
cd ..

> db_load_timev4.txt 
echo 'mv4_load_time' >> db_load_timev4.txt

cd python/venv

for (( i=1; i<=30; i++))

do

    python auto_db_load.py

    cd ..
    cd ..
    
    #stop the db
    ./bin/neo4j stop
    sleep 15
    

    

    printf -- "------------------- This is number $i run --------------------\n"

    printf -- 'load started'

    TIMEFORMAT=%R
    ( time ./neo4j4.sh ) 2>> db_load_timev4.txt 

    printf -- 'load finished'

    # start the db
    ./bin/neo4j start

    #wait till the db fully start for the next load - macOS only take in seconds
    sleep 60
    # back to the python file directory in venv
    cd python/venv/
done


 
