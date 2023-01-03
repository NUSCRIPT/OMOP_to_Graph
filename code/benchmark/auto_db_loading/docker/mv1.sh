#!/usr/bin/env bash
> db_load_timev1.txt 
echo 'mv1_load_time' >> db_load_timev1.txt


# cd python/venv

for (( i=1; i<=5; i++))

do

    # python auto_db_load.py
    # USE DOCKER RECREATE instead of database level
    docker stop neo4j-test05
    

    # docker exec -it --user $(id -u):$(id -g) neo4j-test04 stop neo4j

    #CLEAR THE container to restart the DB
    docker rm neo4j-test05
    rm -rf neo4j-test05 
# update the mount folder

    docker run \
    --name neo4j-test05 \
    -p47474:7474 -p47687:7687 \
    -d \
    -v $HOME/neo4j-test05/data:/data \
    -v $HOME/neo4j-test05/logs:/logs \
    -v $HOME/neo4j-test05/import:/var/lib/neo4j/import \
    -v $HOME/neo4j-test05/plugins:/plugins \
    --env NEO4J_AUTH=neo4j/test \
    --privileged \
    neo4j:latest
    
    rm -rf data 

    #LOAD THE RAW DATA TO IMPORT/ FOLDER
    cd ~/neo4j-test05
    cd /share/fsmresfiles/Limited_Data/Workspace/DMBI_core/mk/graphdb_import/neo4j_admin/
    cp -r mv1/ ~/neo4j-test05/import
    #  cp -r mv4/ ~/neo4j-test05/import

    

    printf -- "------------------- This is number $i run --------------------\n"

    printf -- "load started\n"

    TIMEFORMAT=%R
    ( time ./neo4j1.sh ) 2>> db_load_timev1.txt 

    printf -- "load finished"


done
