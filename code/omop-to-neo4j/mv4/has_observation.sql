\copy (select distinct o.person_id as ":START_ID(Person)", o.observation_id as ":END_ID(Observation)", 'HAS_OBSERVATION' as ":TYPE" from public.observation o) to 'has_observation.csv' WITH CSV HEADER;