\copy (select distinct person_id as ":START_ID(Person)", procedure_concept_id as ":END_ID(ProcedureOccurrence)", procedure_occurrence_id,procedure_date, 'HAS_PROCEDURE_OCCURRENCE' as ":TYPE" from public.procedure_occurrence) to 'has_procedure.csv' WITH CSV HEADER;