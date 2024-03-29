#!/usr/bin/env bash

#clean the databsae
python auto_db_load.py


cd ..
cd ..

#stop the db
./bin/neo4j stop


./bin/neo4j-admin import --database neo4j --nodes=Person=import/person.csv --nodes=Measurement=import/meas.csv --nodes=VisitOccurrence=import/visit.csv --nodes=ConditionOccurrence=import/cond.csv --nodes=DrugExposure=import/drug.csv --nodes=Observation=import/obs.csv  --nodes=ObservationPeriod=import/obs_period.csv  --nodes=ProcedureOccurrence=import/proc.csv --nodes=Race=import/race.csv --nodes=Gender=import/gender.csv --nodes=Ethnicity=import/eth.csv --relationships=HAS_MEASUREMENT=import/has_meas.csv --relationships=ASSOCIATED_DURING_VISIT=import/meas_visit.csv, import/cond_visit.csv, import/drug_visit.csv, import/proc_visit.csv, import/obs_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=import/has_cond.csv --relationships=HAS_DRUG_EXPOSURE=import/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=import/has_proc.csv --relationships=HAS_VISIT=import/has_visit.csv --relationships=HAS_OBSERVATION=import/has_obs.csv  --relationships=HAS_OBSERVATION_PERIOD=import/has_obs_period.csv --relationships=HAS_Gender=import/has_gender.csv --relationships=HAS_race=import/has_race.csv --relationships=HAS_ETHNICITY=import/has_eth.csv --ignore-empty-strings 


# start the db
./bin/neo4j start

sleep 60

cd python/venv/
