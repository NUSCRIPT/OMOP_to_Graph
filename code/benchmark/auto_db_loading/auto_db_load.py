# goal is to automate the database drop and creation and loading
# each need to run 30 times - this file only performs the DB recreate step

import os
import csv
from py2neo import Graph
import subprocess
from datetime import datetime


'''
Steps #
Create a database cypher - CREATE or REPLACE database neo4j; mv1admin;
Load the data from /import folder - one line command using neo4j-admin
Record the loading time
Drop the database
Recreate a new database
'''


if __name__ == "__main__":
    times = 30 #input("How many times do you want to test: ")
    # for i in times:
    # recreate the database
    port = '7687' #input("Enter Neo4j DB Port: ")
    user = 'neo4j' #input("Enter Neo4j DB Username: ")
    pswd = 'XXX' #input("Enter Neo4j DB Password: ")
    try:
        graph = Graph('bolt://localhost:'+port, auth=(user, pswd), name='neo4j')
        print("-----Connected to the local graph database.------")
        print("-----Resetting the database.-----")

        # reload(graph, label) - can write a function
        query = """
                    CREATE or REPLACE database neo4j;

                """
        reload = graph.run(query) 
        # cannot include the stop database neo4j in cypher - this will broke the driver connection
        print('-----Neo4j database reset.-----')
    except:
        print("-----Could not connect to/reset the local graph database.-----")
        quit()       








