#mv1admin import - CRITICAL for paper
# /usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv1/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv1/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv1/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv1/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv1/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv1/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv1/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv1/ethnicity.csv --nodes=ATC4=/data/neo4j_standalone/import/CRITICAL/mv1/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/CRITICAL/mv1/drug_atc4.csv  --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_condition.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv1/has_measurement.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv1/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv1/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv1/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv1/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv1/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv1/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv1/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true

#202401 mv1admin import - SCRIPT for paper
/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/SCRIPT/mv1/person.csv --nodes=Measurement=/data/neo4j_standalone/import/SCRIPT/mv1/meas.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/SCRIPT/mv1/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/SCRIPT/mv1/cond.csv --nodes=DrugExposure=/data/neo4j_standalone/import/SCRIPT/mv1/drug.csv --nodes=Observation=/data/neo4j_standalone/import/SCRIPT/mv1/obs.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/SCRIPT/mv1/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/SCRIPT/mv1/proc.csv --nodes=Race=/data/neo4j_standalone/import/SCRIPT/mv1/race.csv --nodes=Gender=/data/neo4j_standalone/import/SCRIPT/mv1/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/SCRIPT/mv1/eth.csv --nodes=ATC4=/data/neo4j_standalone/import/SCRIPT/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/SCRIPT/drug_atc4.csv  --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/SCRIPT/mv1/has_meas.csv --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/SCRIPT/mv1/has_cond.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/SCRIPT/mv1/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/SCRIPT/mv1/has_proc.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/SCRIPT/mv1/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/SCRIPT/mv1/has_obs.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/SCRIPT/mv1/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/SCRIPT/mv1/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/SCRIPT/mv1/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/SCRIPT/mv1/has_eth.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true
