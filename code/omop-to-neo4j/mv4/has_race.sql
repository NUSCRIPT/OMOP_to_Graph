\copy (select distinct person_id as ":START_ID(Person)", race_concept_id as ":END_ID(Race)" from public.person) to 'has_race.csv' WITH CSV HEADER;