#!/usr/bin/env bash
> db_load_timev1.txt 
echo 'mv1_load_time' >> db_load_timev1.txt


for (( i=1; i<=30; i++))

do

    sudo neo4j stop
    
    #CLEAR THE container to restart the DB
    rm -rf /data/neo4j_standalone/data
    rm -rf /data/neo4j_standalone/logs


    #LOAD THE RAW DATA TO IMPORT/ FOLDER
    # cd /
    # cd /usr

    printf -- "------------------- This is number $i run --------------------\n"

    printf -- "load started\n"

    TIMEFORMAT=%R
    ( time ./neo4j1.sh ) 2>> db_load_timev1.txt 

    printf -- "load finished"

    /usr/bin/neo4j-admin set-initial-password XXX

    sleep 10

done