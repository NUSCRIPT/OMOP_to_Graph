\copy (select person_id as ":START_ID(Person)", visit_concept_id as ":END_ID(VisitOccurrence)", visit_occurrence_id, visit_start_date, visit_end_date, 'HAS_VISIT_OCCURRENCE' as ":TYPE" from public.visit_occurrence v) to 'has_visit.csv' WITH CSV HEADER;