from json import load
import os
import csv
import pandas as pd
from py2neo import Graph
import subprocess
from datetime import datetime


batch = 10

if __name__ == "__main__":

    port = '7687' #input("Enter Neo4j DB Port: ")
    user = 'XXX' #input("Enter Neo4j DB Username: ")
    pswd = 'XXX' #input("Enter Neo4j DB Password: ")
        
    #create the file to record the running times
    # file = open("query_running_timev1q1.txt", "w")

    agg = []
    while batch > 0:

        print('------Running batch ' ,batch, '------')

        # file.write("New batch starts \n")

        batch-=1

        # Recreate the database to make sure the cache is fully cleared
        subprocess.call(['sh','./mv1_once.sh'])

        try:
            graph = Graph('bolt://localhost:'+port, auth=(user, pswd), name='neo4j')
            print("-----Connected to the local graph database.------")

            # clear cache
            graph.run('CALL db.clearQueryCaches()')

            #add index
            print('--create indexes--')
          
            graph.run('CREATE INDEX person FOR (p:Person) ON (p.person_id);')
            graph.run('CREATE INDEX meas FOR (m:Measurement) ON (m.measurement_concept_id);')
            graph.run('CREATE INDEX drug FOR (d:DrugExposure) ON (d.drug_concept_id);')
            graph.run('CREATE INDEX visit FOR (v:VisitOccurrence) ON (v.visit_concept_id);')
            graph.run('CREATE INDEX obs FOR (o:Observation) ON (o.observation_concept_id);')
            graph.run('CREATE INDEX cond FOR (c:ConditionOccurrence) ON (c.condition_concept_id);')
            graph.run('CREATE INDEX proc FOR (p:ProcedureOccurrence) ON (p.procedure_concept_id);')               



            print('indexes created')
            # - transactions whether applied (use the driver correctly)
            # the driver need to be optimized
            # 
            
            run_times = 10

            # agg.append(',')
            total_run_times = ""
            current_times = []
            # current_df = pd.DataFrame()
            while run_times > 0:
                run_times-=1
                
                print("-----Running question2 on mv1.-----")

                # reload(graph, label) - can write a function
                query = """
                  match path=(d1:DrugExposure)<-[r1:HAS_DRUG_EXPOSURE]-(p1:Person)-[r2:HAS_DRUG_EXPOSURE]->(d2:DrugExposure)
                where d1.drug_concept_id <> d2.drug_concept_id and r1.visit_occurrence_id=r2.visit_occurrence_id
                return d1.drug_concept_name, d2.drug_concept_name, count(distinct r1.visit_occurrence_id) as frequency order by frequency desc limit 10; 
                """
                # query ="""match (n) return count(n);"""



                #load the data and record start and end time
                t1 = datetime.now()
                result = graph.run(query)
                t2 = datetime.now()
                load_time = t2 - t1

                #concat times to list of lists
                load_time = pd.Timedelta.total_seconds(load_time)
                total_run_times = total_run_times + str(load_time) + ","
                current_times.append(load_time)
                # agg.append(load_time)


                print(load_time)
                print(result.to_data_frame().head())



                #record the loading time to excel 

                # print('-----Recording loading time----')
                # try:
                    
                #     file.write(str(load_time) + "\n")
                    
                # except:
                #     print('cannot write to file')  

                # print(agg)  
            agg.append(current_times)

        
        #start a new column for new batches
        # file.write('\t')


        except:
            print("-----Could not connect to the local graph database.-----")
            quit()     
     
    print(agg)
    agg = pd.DataFrame(agg)
    agg = agg.transpose()
    header_list = []
    for i in range(1,11):
        header_list.append('batch' + str(i))
    agg.to_csv('query_running_timev1q2.csv', index=False, header=header_list)
       
    # file.close()


    

        
    