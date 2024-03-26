#!/usr/bin/env bash
> db_load_timev4.txt 
echo 'mv4_load_time' >> db_load_timev4.txt


# cd python/venv

for (( i=1; i<=30; i++))

do

    sudo neo4j stop
    
    #CLEAR THE data
    rm -rf /data/neo4j_standalone/data
    rm -rf /data/neo4j_standalone/logs


    printf -- "------------------- This is number $i run --------------------\n"

    printf -- "load started\n"

    TIMEFORMAT=%R
    ( time ./neo4j4.sh ) 2>> db_load_timev4.txt 

    printf -- "load finished"

    /usr/bin/neo4j-admin set-initial-password XXX

    sleep 10

done

