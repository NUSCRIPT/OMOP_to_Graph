-------------------------- data preparation for neo4j-admin import --------------------------
-- version 1 model tables
-- nodes and attributes include concept_id and concept_name
-- edge and attributes include visit_occurrence_id and start and end date

------------- person ---------------
-- removed case_number to include only distinct patient
select distinct person_id as [person_id:ID(Person)], year_of_birth, patient_ir_id 
from omop.person op join clinical.patient cp
on op.person_id = cp.cohort_patient_id

------------- lab ---------------
SELECT distinct measurement_concept_id as [measurement_concept_id:ID(Measurement)], measurement_concept_name--, unit_concept_id, unit_concept_name
from omop.measurement
where value_as_number is not null

-- there are still duplicates in labs table even when wiping out the null values in unit
-- move the units fields to edge attributes

------------- visit ---------------
SELECT distinct visit_concept_id as [visit_concept_id:ID(VisitOccurrence)], visit_concept_name
from omop.visit_occurrence



------------- has_measurement ---------------
select distinct  person_id as [:START_ID(Person)],  measurement_concept_id as [:END_ID(Measurement)],visit_occurrence_id,measurement_id,measurement_date ,unit_concept_id, unit_concept_name, value_as_number, 'HAS_MEASUREMENT' as [:TYPE]
from omop.measurement m
where value_as_number is not null




------------- condition ---------------

select distinct condition_concept_id as [condition_concept_id:ID(ConditionOccurrence)], condition_concept_name
from omop.condition_occurrence

------------- has_condition ---------------

select distinct  person_id as [:START_ID(Person)], condition_concept_id as [:END_ID(ConditionOccurrence)],visit_occurrence_id, condition_occurrence_id, condition_type_concept_id, condition_type_concept_name, condition_start_date, condition_end_date,   'HAS_CONDITION_OCCURRENCE' as [:TYPE]
from omop.condition_occurrence



------------- drug ---------------
select distinct drug_concept_id as [drug_concept_id:ID(DrugExposure)],drug_concept_name
from omop.drug_exposure as d

------------- has_drug ---------------
select distinct person_id as [:START_ID(Person)], drug_concept_id as [:END_ID(DrugExposure)],visit_occurrence_id, drug_exposure_id, drug_type_concept_id, drug_type_concept_name, drug_exposure_start_date, 'HAS_DRUG_EXPOSURE' as [:TYPE]
from omop.drug_exposure
where drug_exposure_start_date is not NULL
and drug_exposure_end_datetime is not null




------------- procedure ---------------
SELECT distinct procedure_concept_id as [procedure_concept_id:ID(ProcedureOccurrence)], procedure_concept_name
from omop.procedure_occurrence

------------- has_procedure ---------------
select distinct person_id as [:START_ID(Person)], procedure_concept_id as [:END_ID(ProcedureOccurrence)],visit_occurrence_id, procedure_occurrence_id,procedure_date, 'HAS_PROCEDURE_OCCURRENCE' as [:TYPE]
from omop.procedure_occurrence



------------- observation ---------------
SELECT distinct observation_concept_id as [observation_concept_id:ID(Observation)], observation_concept_name
from omop.observation

------------- has_ observation ---------------
select distinct o.person_id as [:START_ID(Person)], o.observation_concept_id as [:END_ID(Observation)],visit_occurrence_id, observation_date, observation_id, 'HAS_OBSERVATION' as [:TYPE]
from omop.observation o



------------- obs_period ---------------
select distinct period_type_concept_id as [period_type_concept_id:ID(ObservationPeriod)], op.period_type_concept_name
from omop.observation_period op 
------------- has_obs_period ---------------
select distinct p.person_id as [:START_ID(Person)], p.observation_period_id, p.period_type_concept_id as [:END_ID(ObservationPeriod)], p.observation_period_start_date, p.observation_period_end_date , 'HAS_OBSERVATION_PERIOD' as [:TYPE]
from omop.observation_period as p


------------- has_visit ---------------
select person_id as [:START_ID(Person)], visit_concept_id as [:END_ID(VisitOccurrence)], visit_occurrence_id, visit_start_date, visit_end_date, 'HAS_VISIT_OCCURRENCE' as [:TYPE]
from omop.visit_occurrence v



------ gender ---------------
select distinct gender_concept_id as [gender_concept_id:ID(Gender)] , gender_concept_name from omop.person

------------- ethnicity ---------------

select distinct ethnicity_concept_id as [ethnicity_concept_id:ID(Ethnicity)] , ethnicity_concept_name
from omop.person

------------- race ---------------
select distinct race_concept_id as [race_concept_id:ID(Race)] , race_concept_name
from omop.person


------------- has_race ---------------
select distinct person_id as [:START_ID(Person)], race_concept_id as [:END_ID(Race)]
from omop.person

------------- has_ethnicity---------------
select distinct person_id as [:START_ID(Person)], ethnicity_concept_id as [:END_ID(Ethnicity)]
from omop.person
------------- has_gender ---------------
select distinct person_id as [:START_ID(Person)], gender_concept_id as [:END_ID(Gender)]
from omop.person

