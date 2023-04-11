\copy (select distinct period_type_concept_id as "period_type_concept_id:ID(ObservationPeriod)", pt.concept_name as period_type_concept_name from public.observation_period op left join public.concept pt on period_type_concept_id = pt.concept_id) to 'obs_period.csv' WITH CSV HEADER;