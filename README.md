# OMOP_to_Graph
Transform the [OMOP](https://github.com/OHDSI/CommonDataModel/wiki) CDM to graph model\
Manuscript published on 2024/12 - [Evolution of a Graph Model for the OMOP Common Data Model](https://pubmed.ncbi.nlm.nih.gov/39631779/)

## 1. Draft Schemas

1. [Schema Draft 1](Draft_schema.md)
1. [Schema Draft 2](draft_schema_option2.md)  **[ Exclude ]**
1. [Schema Draft 3](draft_schema_option3.md) [ To review ]
4. [Schema Draft 4](draft_schema_option4.md) **[Finalized version for AMIA submission]**

## 2. Multiple ways to load data and build the database in seconds to minutes -

### 2.1 Create the neo4j database directly from a relational database instructions
(This method is only recommended for small to medium sized database, as the JDBC connection can get timeout when loading too much data in one transaction - in general it is a good practice to preprocess the data and then load into Neo4j)
1. Create a local or cloud Neo4j database - more information [here](https://neo4j.com/cloud/aura/?ref=nav-get-started-cta)
2. Use [neo4j drivers](https://neo4j.com/developer/language-guides/#neo4j-drivers) and embedd the cypher [code](https://github.com/NUSCRIPT/OMOP_to_Graph/blob/master/code/omop_to_neo4j_build_database.cypher) into your scripts, either Python, Java, JavaScript .etc\
OR\
Use Cypher shell to run the code directly in the terminal - more information [here](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/)\
  Steps:
   - Go to the local bin folder
   - `./cypher-shell -a [your-server-link]:[your-port-number] -u [your-username]`
   - Copy paste the [code](https://github.com/NUSCRIPT/OMOP_to_Graph/blob/master/code/omop_to_neo4j_build_database.cypher) you want to load or use `:source import/your_cypher_file.cypher` that contains the loading code


### 2.2 Build database with [neo4j-admin import](https://neo4j.com/docs/operations-manual/current/tutorial/neo4j-admin-import/)
(fastest import method, only works for empty database,datasets in CSV format) 
1. Prepare datasets with the sql [code](https://github.com/NUSCRIPT/OMOP_to_Graph/tree/master/code) from OMOP relational database and save as CSV files as below\
cond_visit.csv\
cond.csv\
drug_visit.csv\
drug.csv\
eth.csv\
gender.csv\
has_cond.csv\
has_drug.csv\
has_eth.csv\
has_gender.csv\
has_meas.csv\
has_obs_period.csv\
has_obs.csv\
has_proc.csv\
has_race.csv\
has_visit.csv\
meas_visit.csv\
meas.csv\
obs_period.csv\
obs_visit.csv\
obs.csv\
person.csv\
proc_visit.csv\
proc.csv\
race.csv\
visit.csv
2. run the command below in the Neo4j database shell\
`./bin/neo4j-admin import --database [database_name] --nodes=Person=import/person.csv --nodes=Measurement=import/meas.csv --nodes=VisitOccurrence=import/visit.csv --nodes=ConditionOccurrence=import/cond.csv --nodes=DrugExposure=import/drug.csv --nodes=Observation=import/obs.csv  --nodes=ObservationPeriod=import/obs_period.csv  --nodes=ProcedureOccurrence=import/proc.csv --nodes=Race=import/race.csv --nodes=Gender=import/gender.csv --nodes=Ethnicity=import/eth.csv --relationships=HAS_MEASUREMENT=import/has_meas.csv --relationships=ASSOCIATED_DURING_VISIT=import/meas_visit.csv, import/cond_visit.csv, import/drug_visit.csv, import/proc_visit.csv, import/obs_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=import/has_cond.csv --relationships=HAS_DRUG_EXPOSURE=import/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=import/has_proc.csv --relationships=HAS_VISIT=import/has_visit.csv --relationships=HAS_OBSERVATION=import/has_obs.csv  --relationships=HAS_OBSERVATION_PERIOD=import/has_obs_period.csv --relationships=HAS_Gender=import/has_gender.csv --relationships=HAS_race=import/has_race.csv --relationships=HAS_ETHNICITY=import/has_eth.csv --ignore-empty-strings`

