\copy (select distinct o.visit_occurrence_id as ":END_ID(VisitOccurrence)", o.observation_id as ":START_ID(Observation)", 'ASSOCIATED_DURING_VISIT' as ":TYPE" from public.observation o) to 'observation_visit.csv' WITH CSV HEADER;