\copy (select distinct measurement_id as ":START_ID(Measurement)", m.visit_occurrence_id as ":END_ID(VisitOccurrence)", 'ASSOCIATED_DURING_VISIT' as ":TYPE" from public.measurement m where value_as_number is not null) to 'meas_visit.csv' WITH CSV HEADER;