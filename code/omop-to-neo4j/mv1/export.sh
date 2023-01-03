dbname=$1
dbuser=$2

psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/condition.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/drug.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/ethnicity.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/gender.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_condition.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_drug.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_ethnicity.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_gender.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_measurement.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_obs_period.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_observation.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_procedure.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_race.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/has_visit.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/lab.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/obs_period.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/observation.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/person.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/procedure.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/race.sql
psql "dbname=${dbname} user=${dbuser}" -f /share/fsmresfiles/CRITICAL/Northwestern/scripts/OMOP_to_Graph/code/omop-to-neo4j/mv1/visit.sql