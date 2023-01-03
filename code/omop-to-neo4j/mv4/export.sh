dbname=$1
dbuser=$2

psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/condition_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/condition.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/drug_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/drug.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/ethnicity.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/gender.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_condition.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_drug.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_ethnicity.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_gender.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_measurement.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_obs_period.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_observation.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_procedure.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_race.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/has_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/lab.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/meas_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/obs_period.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/observation_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/observation.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/person.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/procedure_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/procedure.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/race.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv4/visit.sql