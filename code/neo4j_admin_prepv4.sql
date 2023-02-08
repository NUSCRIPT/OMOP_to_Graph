-------------------------- data preparation for neo4j-admin import --------------------------
-- version 2 model
-- nodes and attributes include concept_id and concept_name
-- edge and attributes include visit_occurrence_id and start and end date

------------- person ---------------
-- removed case_number to include only distinct patient
select distinct person_id as [person_id:ID(Person)], year_of_birth, patient_ir_id 
from omop.person op join clinical.patient cp
on op.person_id = cp.cohort_patient_id

------------- lab ---------------
SELECT distinct measurement_id as [measurement_id:ID(Measurement)], measurement_concept_name, measurement_date, value_as_number, unit_concept_id, unit_concept_name, measurement_concept_id
from omop.measurement
where value_as_number is not null



-- order by measurement_concept_id asc
-- there are still duplicates in labs table even when wiping out the null values in unit
-- move the units fields to edge attributes

------------- visit ---------------
SELECT distinct visit_occurrence_id as [visit_occurrence_id:ID(VisitOccurrence)], visit_concept_name, visit_concept_id, visit_start_date, visit_end_date
from omop.visit_occurrence



------------- has_measurement ---------------
select distinct  person_id as [:START_ID(Person)],  measurement_id as [:END_ID(Measurement)], 'HAS_MEASUREMENT' as [:TYPE]
from omop.measurement m
where value_as_number is not null



------------- meas_visit ---------------
select distinct  measurement_id as [:START_ID(Measurement)], m.visit_occurrence_id as [:END_ID(VisitOccurrence)],'ASSOCIATED_DURING_VISIT' as [:TYPE]
from omop.measurement m
where value_as_number is not null

-- where unit_concept_id is not null
-- and unit_concept_name is not null


------------- condition ---------------

select distinct condition_occurrence_id as [condition_occurrence_id:ID(ConditionOccurrence)], condition_concept_name, condition_concept_id, condition_start_date, condition_end_date
from omop.condition_occurrence

------------- has_condition ---------------

select distinct  person_id as [:START_ID(Person)], condition_occurrence_id as [:END_ID(ConditionOccurrence)], 'HAS_CONDITION_OCCURRENCE' as [:TYPE]
from omop.condition_occurrence


------------- condition_visit ---------------
select distinct condition_occurrence_id as [:START_ID(ConditionOccurrence)], c.visit_occurrence_id as [:END_ID(VisitOccurrence)], 'ASSOCIATED_DURING_VISIT' as [:TYPE]
from omop.condition_occurrence c




------------- drug ---------------
select distinct drug_exposure_id as [drug_exposure_id:ID(DrugExposure)],drug_concept_name, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, drug_type_concept_name, route_concept_id, route_concept_name, stop_reason
from omop.drug_exposure as d

------------- has_drug ---------------
select distinct person_id as [:START_ID(Person)], drug_exposure_id as [:END_ID(DrugExposure)],'HAS_DRUG_EXPOSURE' as [:TYPE]
from omop.drug_exposure
where drug_exposure_start_date is not NULL
and drug_exposure_end_datetime is not null


------------- drug_visit ---------------
select distinct drug_exposure_id as [:START_ID(DrugExposure)], d.visit_occurrence_id as [:END_ID(VisitOccurrence)], 'ASSOCIATED_DURING_VISIT' as [:TYPE]
from omop.drug_exposure d




------------- procedure ---------------
SELECT distinct procedure_occurrence_id as [procedure_occurrence_id:ID(ProcedureOccurrence)], procedure_concept_name, procedure_date, procedure_concept_id
from omop.procedure_occurrence

------------- has_procedure ---------------
select distinct person_id as [:START_ID(Person)], procedure_occurrence_id as [:END_ID(ProcedureOccurrence)], 'HAS_PROCEDURE_OCCURRENCE' as [:TYPE]
from omop.procedure_occurrence

------------- procedure_visit ---------------
SELECT distinct procedure_occurrence_id as [:START_ID(ProcedureOccurrence)], p.visit_occurrence_id as [:END_ID(VisitOccurrence)],'ASSOCIATED_DURING_VISIT' as [:TYPE]
from omop.procedure_occurrence p 





------------- observation ---------------
SELECT distinct observation_id as [observation_id:ID(Observation)], observation_concept_name, observation_date, observation_concept_id
from omop.observation

------------- has_ observation ---------------
select distinct o.person_id as [:START_ID(Person)], o.observation_id as [:END_ID(Observation)], 'HAS_OBSERVATION' as [:TYPE]
from omop.observation o

------------- observation_visit ---------------
select distinct o.visit_occurrence_id as [:END_ID(VisitOccurrence)], o.observation_id as [:START_ID(Observation)], 'ASSOCIATED_DURING_VISIT' as [:TYPE]
from omop.observation o





------------- obs_period ---------------
select distinct observation_period_id as [observation_period_id:ID(ObservationPeriod)], op.period_type_concept_name, period_type_concept_id, observation_period_start_date, observation_period_end_date
from omop.observation_period op 
------------- has_obs_period ---------------
select distinct p.person_id as [:START_ID(Person)], p.observation_period_id as [:END_ID(ObservationPeriod)], 'HAS_OBSERVATION_PERIOD' as [:TYPE]
from omop.observation_period as p


------------- has_visit ---------------
select person_id as [:START_ID(Person)], visit_occurrence_id as [:END_ID(VisitOccurrence)], 'HAS_VISIT_OCCURRENCE' as [:TYPE]
from omop.visit_occurrence v

------------- gender ---------------


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


