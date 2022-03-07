# OMOP_to_Graph
Transform the [OMOP](https://github.com/OHDSI/CommonDataModel/wiki) CDM to graph model

## Draft Schemas

1. [Schema Draft 1](Draft_schema.md)
1. [Schema Draft 2](draft_schema_option2.md)  **[ Exclude ]**
1. [Schema Draft 3](draft_schema_option3.md) [ To review ]
4. [Schema Draft 4](draft_schema_option4.md) **[Finalized version for AMIA submission]**


## Create the neo4j database from a relational database instructions
1. Create a local or cloud Neo4j database - more information [here](https://neo4j.com/cloud/aura/?ref=nav-get-started-cta)
2. Use [neo4j drivers](https://neo4j.com/developer/language-guides/#neo4j-drivers) and embedd the cypher code into your scripts, either Python, Java, JavaScript .etc
3. Use Cypher shell to run the code directly in the terminal - more information [here](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/)\
  Steps:
   - Go to the local bin folder
   - ./cypher-shell -a [your-server-link]:[your-port-number] -u [your-username]
   - Copy paste the [code](https://github.com/NUSCRIPT/OMOP_to_Graph/blob/master/code/omop_to_neo4j_build_database.cypher) you want to load


## Build database with neo4j-admin import
1. Prepare datasets with the sql code from OMOP relational database
2. run ./bin/neo4j-admin import --database [database_name] --nodes=Person=import/person.csv --nodes=Measurement=import/meas.csv --nodes=VisitOccurrence=import/visit.csv --nodes=ConditionOccurrence=import/cond.csv --nodes=DrugExposure=import/drug.csv --nodes=Observation=import/obs.csv  --nodes=ObservationPeriod=import/obs_period.csv  --nodes=ProcedureOccurrence=import/proc.csv --nodes=Race=import/race.csv --nodes=Gender=import/gender.csv --nodes=Ethnicity=import/eth.csv --relationships=HAS_MEASUREMENT=import/has_meas.csv --relationships=ASSOCIATED_DURING_VISIT=import/meas_visit.csv, import/cond_visit.csv, import/drug_visit.csv, import/proc_visit.csv, import/obs_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=import/has_cond.csv --relationships=HAS_DRUG_EXPOSURE=import/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=import/has_proc.csv --relationships=HAS_VISIT=import/has_visit.csv --relationships=HAS_OBSERVATION=import/has_obs.csv  --relationships=HAS_OBSERVATION_PERIOD=import/has_obs_period.csv --relationships=HAS_Gender=import/has_gender.csv --relationships=HAS_race=import/has_race.csv --relationships=HAS_ETHNICITY=import/has_eth.csv --ignore-empty-strings

