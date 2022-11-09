#!/usr/bin/env bash
> db_load_timev1.txt 
echo 'mv1_load_time' >> db_load_timev1.txt


# cd python/venv

for (( i=1; i<=5; i++))

do

    # python auto_db_load.py
    # USE DOCKER RECREATE instead of database level
    docker stop neo4j-test06
    
    # docker start neo4j-test06
    # docker exect -it nest-test06 
    # exit

    
    #CLEAR THE container to restart the DB
    docker rm neo4j-test06
    rm -rf neo4j-test06 

    docker run \
    --name neo4j-test06 \
    -p57474:7474 -p57687:7687 \
    -d \
    -v $HOME/neo4j-test06/data:/data \
    -v $HOME/neo4j-test06/logs:/logs \
    -v $HOME/neo4j-test06/import:/var/lib/neo4j/import \
    -v $HOME/neo4j-test06/plugins:/plugins \
    --env NEO4J_AUTH=neo4j/test \
    neo4j:latest
    ## what is the $HOME directory
    # Create teh largest database
        # 1. currently 91 GB available for testing $HOME/neo4j
        # 2. put on the data partition 6.5TB, for RAM 533GB / 184 GB in use
    
    rm -rf data 

    #LOAD THE RAW DATA TO IMPORT/ FOLDER
    cd ~/neo4j-test06
    cd /share/fsmresfiles/Limited_Data/Workspace/DMBI_core/mk/graphdb_import/neo4j_admin/
    cp -r mv1/ ~/neo4j-test06/import
    #  cp -r mv4/ ~/neo4j-test06/import

    

    printf -- "------------------- This is number $i run --------------------\n"

    printf -- "load started\n"

    TIMEFORMAT=%R
    ( time ./neo4j1.sh ) 2>> db_load_timev1.txt 

    printf -- "load finished"

    # start the db
    # ./bin/neo4j start

    #wait till the db fully start for the next load - macOS only take in seconds
    # sleep 60
    # exit
    # back to the python file directory in venv
    # cd python/venv/



done


 
