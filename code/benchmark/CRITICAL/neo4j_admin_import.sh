./bin/neo4j-admin import --database neo4j --nodes=Person=import/CRITICAL/mv1/person.csv --nodes=Measurement=import/CRITICAL/mv1/lab.csv --nodes=VisitOccurrence=import/CRITICAL/mv1/visit.csv --nodes=ConditionOccurrence=import/CRITICAL/mv1/condition.csv --nodes=DrugExposure=import/CRITICAL/mv1/drug.csv --nodes=Observation=import/CRITICAL/mv1/observation.csv  --nodes=ObservationPeriod=import/CRITICAL/mv1/has_obs_period.csv  --nodes=ProcedureOccurrence=import/CRITICAL/mv1/procedure.csv --nodes=Race=import/CRITICAL/mv1/race.csv --nodes=Gender=import/CRITICAL/mv1/gender.csv --nodes=Ethnicity=import/CRITICAL/mv1/ethnicity.csv --relationships=HAS_MEASUREMENT=import/CRITICAL/mv1/has_measurement.csv --relationships=HAS_DRUG_EXPOSURE=import/CRITICAL/mv1/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=import/CRITICAL/mv1/has_procedure.csv --relationships=HAS_VISIT=import/CRITICAL/mv1/has_visit.csv --relationships=HAS_OBSERVATION=import/CRITICAL/mv1/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=import/CRITICAL/mv1/has_obs_period.csv --relationships=HAS_Gender=import/CRITICAL/mv1/has_gender.csv --relationships=HAS_race=import/CRITICAL/mv1/has_race.csv --relationships=HAS_ETHNICITY=import/CRITICAL/mv1/has_ethnicity.csv --ignore-empty-strings

