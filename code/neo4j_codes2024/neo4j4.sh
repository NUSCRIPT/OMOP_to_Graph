#MV4admin import - CRITICAL

# /usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv4/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv4/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv4/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv4/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv4/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv4/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv4/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv4/ethnicity.csv --nodes=ATC4=/data/neo4j_standalone/import/CRITICAL/mv4/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/CRITICAL/mv4/drug_atc4v4.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv4/has_measurement.csv --relationships=ASSOCIATED_DURING_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/meas_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/condition_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/drug_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/procedure_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/observation_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_condition.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv4/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv4/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv4/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv4/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv4/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv4/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true

#202401 SCRIPT MV4admin SCRIPT import

/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/SCRIPT/mv4/person.csv --nodes=Measurement=/data/neo4j_standalone/import/SCRIPT/mv4/meas.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/SCRIPT/mv4/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/SCRIPT/mv4/cond.csv --nodes=DrugExposure=/data/neo4j_standalone/import/SCRIPT/mv4/drug.csv --nodes=Observation=/data/neo4j_standalone/import/SCRIPT/mv4/obs.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/SCRIPT/mv4/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/SCRIPT/mv4/proc.csv --nodes=Race=/data/neo4j_standalone/import/SCRIPT/mv4/race.csv --nodes=Gender=/data/neo4j_standalone/import/SCRIPT/mv4/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/SCRIPT/mv4/eth.csv --nodes=ATC4=/data/neo4j_standalone/import/SCRIPT/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/SCRIPT/drug_atc4v4.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/SCRIPT/mv4/has_meas.csv --relationships=ASSOCIATED_DURING_VISIT=/data/neo4j_standalone/import/SCRIPT/mv4/meas_visit.csv, /data/neo4j_standalone/import/SCRIPT/mv4/cond_visit.csv, /data/neo4j_standalone/import/SCRIPT/mv4/drug_visit.csv, /data/neo4j_standalone/import/SCRIPT/mv4/proc_visit.csv, /data/neo4j_standalone/import/SCRIPT/mv4/obs_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/SCRIPT/mv4/has_cond.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/SCRIPT/mv4/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/SCRIPT/mv4/has_proc.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/SCRIPT/mv4/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/SCRIPT/mv4/has_obs.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/SCRIPT/mv4/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/SCRIPT/mv4/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/SCRIPT/mv4/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/SCRIPT/mv4/has_eth.csv --ignore-empty-strings --skip-bad-relationships=true


