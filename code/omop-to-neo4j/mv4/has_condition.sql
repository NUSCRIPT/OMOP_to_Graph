\copy (select distinct person_id as ":START_ID(Person)", condition_occurrence_id as ":END_ID(ConditionOccurrence)", 'HAS_CONDITION_OCCURRENCE' as ":TYPE" from public.condition_occurrence) to 'has_condition.csv' WITH CSV HEADER;