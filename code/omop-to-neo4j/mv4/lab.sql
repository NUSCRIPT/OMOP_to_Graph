\copy (SELECT distinct measurement_id as "measurement_id:ID(Measurement)", mc.concept_name as measurement_concept_name, measurement_date, value_as_number, unit_concept_id, uc.concept_name as unit_concept_name, measurement_concept_id from public.measurement c left join public.concept mc on mc.concept_id = c.measurement_concept_id left join public.concept uc on uc.concept_id = c.unit_concept_id where value_as_number is not null ) to 'lab.csv' WITH CSV HEADER;