CREATE 
  (`0` :DrugExposure {drug_exposure_id:'',drug_exposure_start_datetime:'',drug_exposure_end_datetime:'',stop_reason:'',drug_type_concept_id:'',drug_type_concept_name:'',route_concept_id:'',route_concept_name:''}) ,
  (`1` :Person {person_id:'',year_of_birth:''}) ,
  (`2` :VisitOccurrence {visit_occurrence_id:'',visit_start_date:'',visit_end_date:''}) ,
  (`3` :Gender {gender_concept_id:'',gender_concept_name:''}) ,
  (`4` :Race {race_concept_id:'',race_concept_name:''}) ,
  (`5` :Ethnicity {ethnicity_concept_id:'',ethnicity_concept_name:''}) ,
  (`6` :ConditionOccurrence {condition_occurrence_id:'',condition_start_datetime:''}) ,
  (`7` :Provider {provider_id:''}) ,
  (`8` :ProcedureOccurrence {procedure_occurrence_id:'',procedure_datetime:''}) ,
  (`9` :MeasurementOccurrence {measurement_id:'',measurement_date:'',operator_concept_id:'',operator_concept_name:'',value_as_number:'',value_as_concept_id:'',value_as_concept_name:'',unit_concept_id:'',unit_concept_name:'',range_low:'',range_high:''}) ,
  (`10` :ObservationOccurrence {observation_id:'',observation_date:''}) ,
  (`11` :ObservationPeriod {observation_period_id:'',observation_period_start_date:'',observation_period_end_date:''}) ,
  (`12` :VisitConcept {concept_id:'',concept_name:''}) ,
  (`13` :ObservationConcept {concept_id:'',concept_name:''}) ,
  (`14` :MeasurementConcept {concept_id:'',concept_name:''}) ,
  (`15` :ProcedureConcept {concept_id:'',concept_name:''}) ,
  (`16` :ConditionConcept {concept_id:'',concept_name:''}) ,
  (`17` :DrugConcept {concept_id:'',concept_name:''}) ,
  (`1`)-[:`HAS_DRUG_EXPOSURE` ]->(`0`),
  (`0`)-[:`ASSOCIATED_DURING_VISIT` ]->(`2`),
  (`1`)-[:`HAS_VISIT_OCCURRENCE` ]->(`2`),
  (`1`)-[:`HAS_GENDER` ]->(`3`),
  (`1`)-[:`HAS_RACE` ]->(`4`),
  (`1`)-[:`HAS_ETHNICITY` ]->(`5`),
  (`1`)-[:`HAS_CONDITION_OCCURRENCE` ]->(`6`),
  (`6`)-[:`ASSOCIATED_DURING_VISIT` ]->(`2`),
  (`1`)-[:`HAS_PROCEDURE_OCCURRENCE` ]->(`8`),
  (`8`)-[:`ASSOCIATED_DURING_VISIT` ]->(`2`),
  (`1`)-[:`HAS_MEASUREMENT` ]->(`9`),
  (`9`)-[:`ASSOCIATED_DURING_VISIT` ]->(`2`),
  (`1`)-[:`HAS_OBSERVATION_OCCURRENCE` ]->(`10`),
  (`10`)-[:`ASSOCIATED_DURING_VISIT` ]->(`2`),
  (`1`)-[:`HAS_OBSERVATION_PERIOD` ]->(`11`),
  // (`2`)-[:`HAS_CONCEPT` ]->(`12`), need to create varies type of concept relationship
  // (`10`)-[:`HAS_CONCEPT` ]->(`13`),
  // (`9`)-[:`HAS_CONCEPT` ]->(`14`),
  // (`8`)-[:`HAS_CONCEPT` ]->(`15`),
  // (`6`)-[:`HAS_CONCEPT` ]->(`16`),
  // (`0`)-[:`HAS_CONCEPT` ]->(`17`),
  (`7`)-[:`ASSOCIATED_WITH` ]->(`2`),
  (`7`)-[:`CAPTURED` ]->(`6`),
  (`7`)-[:`INITIATED` ]->(`0`),
  (`7`)-[:`RESPONSIBLE_FOR` ]->(`8`),
  (`7`)-[:`RESPONSIBLE_FOR` ]->(`9`),
  (`7`)-[:`RESPONSIBLE_FOR` ]->(`10`)


// create concept relationship seperately

match (v:VisitOccurrence)
match (v1:VisitConcept)
merge (v)-[r:HAS_V_CONCEPT]->(v1);

match (c:ConditionOccurrence)
match (c1:ConditionConcept)
merge (c)-[r:HAS_C_CONCEPT]->(c1);

match (m:MeasurementOccurrence)
match (m1:MeasurementConcept)
merge (m)-[r:HAS_M_CONCEPT]->(m1);

match (d:DrugExposure)
match (d1:DrugConcept)
merge (d)-[r:HAS_D_CONCEPT]->(d1);

match (o:ObservationOccurrence)
match (o1:ObservationConcept)
merge (o)-[r:HAS_O_CONCEPT]->(o1);

match (p:ProcedureOccurrence)
match (p1:ProcedureConcept)
merge (p)-[r:HAS_P_CONCEPT]->(p1);

match (p:Person)
match (b:BAL)
merge (p)-[:HAS_BAL_SAMPLE]->(bal)



// add constraints - Started streaming 15 records after 3 ms and completed after 3 ms.
// necessary step before importing dataset

create constraint on (p:Person) assert p.person_id is unique;
create constraint on (m:MeasurementOccurrence) assert m.measurement_id is unique; 
create constraint on (d:DrugExposure) assert d.drug_exposure_id is unique ;
create constraint on (co:ConditionOccurrence) assert co.condition_occurrence_id is unique ;
create constraint on (p:Provider) assert p.provider_id is unique ;
create constraint on (vo:VisitOccurrence) assert vo.visit_occurrence_id is unique ;
create constraint on (o:ObservationOccurrence) assert o.observation_id is unique ;
create constraint on (po:ProcedureOccurrence) assert po.procedure_occurrence_id is unique ;
create constraint on (op:ObservationPeriod) assert op.observation_period_id is unique ;

create constraint on (cc:ConditionConcept) assert cc.concept_name is unique ;
create constraint on (dc:DrugConcept) assert dc.concept_name is unique ;
create constraint on (cc:ObservationConcept) assert cc.concept_name is unique ;
create constraint on (cc:ProcedureConcept) assert cc.concept_name is unique ;
create constraint on (cc:VisitConcept) assert cc.concept_name is unique ;
create constraint on (cc:MeasurementConcept) assert cc.concept_name is unique ;
