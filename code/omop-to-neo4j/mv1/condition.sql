\copy (select distinct condition_concept_id as "condition_concept_id:ID(ConditionOccurrence)", cc.concept_name as condition_concept_name from public.condition_occurrence c left join public.concept cc on cc.concept_id = c.condition_concept_id) to 'condition.csv' WITH CSV HEADER;