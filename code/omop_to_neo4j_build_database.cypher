// call apoc.periodic.iterate("MATCH (n) return n", "DETACH DELETE n", {batchSize:10000})
// yield batches, total return batches, total

CREATE 
  (`0` :Observation {observation_id:'Integer',observation_date:'String'}),
  (`1` :Gender {gender_concept_id:'Integer',gender_concept_name:'String'}),
  (`2` :Measurement {range_high:'Float',measurement_date_time:'Datetime',operator_concept_name:'String',range_low:'Float',unit_concept_name:'String',value_as_number:'String',operator_concept_id:'String',value_as_concept_name:'String',value_as_number:'String',unit_concept_id:'String',measurement_id:'Integer'}),
  // measurement date -> datetime for v4
  (`3` :DrugExposure {drug_type_concept_id:'Integer',drug_exposure_end_datetime:'DateTime',drug_exposure_id:'Integer',drug_exposure_start_datetime:'DateTime',drug_type_concept_name:'String',stop_reason:'String',route_concept_id:'Integer',drug_type_concept_name:'String'}),
  (`4` :Person {year_of_birth:'Integer',person_id:'String'}),
  (`5` :ObservationPeriod {observation_period_end_date:'Datetime',observation_period_id:'String',observation_period_start_date:'Datetime'}),
  (`6` :ProcedureOccurrence {procedure_occurrence_id:'Integer',procedure_datetime:'DateTime'}),
  (`7` :Provider {provider_id:'Integer'}),
  (`8` :Ethnicity {ethnicity_concept_id:'Integer',ethnicity_concept_name:'Integer'}),
  (`9` :Race {race_concept_name:'String',race_concept_id:'Integer'}),
  (`10` :ConditionOccurrence {condition_start_datetime:'Date',condition_end_datetime:'Date', condition_occurrence_id:'Integer'}), // added conditionEndDatetime for v4
  (`11` :Concept {invalid_reason:'String',valid_end_date:'Date',valid_start_date:'Date',concept_code:'String',standard_concept:'Boolean',concept_name:'String',concept_id:'Integer'}),
  (`12` :VisitOccurrence {visit_end_date:'Date',visit_occurrence_id:'Integer',visit_start_date:'Date'}),
  (`13` :Domain {domain_name:'String',domain_id:'Integer'}),
  (`14` :Vocabulary {vocabulary_version:'String',vocabulary_reference:'String',vocabulary_name:'String',vocabulary_id:'Integer'}), // vocabulary corrected
  (`15` :ConceptClass {concept_class_name:'String',concept_class_id:'Integer'}),
  (`12`)-[:NEXT ]->(`12`),
  (`11`)-[:RELATED_TO ]->(`11`),
  (`15`)-[:HAS_CONCEPT ]->(`11`),
  (`14`)-[:HAS_CONCEPT ]->(`11`),
  (`0`)-[:ASSOCIATED_DURING_VISIT ]->(`12`),
  (`4`)-[:HAS_MEASUREMENT ]->(`2`),
  (`4`)-[:HAS_PROCEDURE_OCCURRENCE ]->(`6`),
  (`4`)-[:HAS_RACE ]->(`9`),
  (`4`)-[:HAS_GENDER ]->(`1`),
  (`7`)-[:RESPONSIBLE_FOR ]->(`0`),
  (`7`)-[:INITIATED ]->(`3`),
  (`7`)-[:RESPONSIBLE_FOR ]->(`2`),
  (`3`)-[:ASSOCIATED_DURING_VISIT ]->(`12`),
  (`4`)-[:HAS_CONDITION_OCCURRENCE ]->(`10`),
  (`7`)-[:RESPONSIBLE_FOR ]->(`6`),
  (`4`)-[:HAS_ETHNICITY ]->(`8`),
  (`6`)-[:ASSOCIATED_DURING_VISIT ]->(`12`),
  (`2`)-[:HAS_CONCEPT ]->(`11`),
  (`4`)-[:HAS_VISIT_OCCURRENCE ]->(`12`),
  (`2`)-[:ASSOCIATED_DURING_VISIT ]->(`12`),
  (`7`)-[:CAPTURED ]->(`10`),
  (`4`)-[:HAS_DRUG_EXPOSURE ]->(`3`),
  (`7`)-[:ASSOCIATED_WITH ]->(`12`),
  (`4`)-[:HAS_OBSERVATION_PERIOD ]->(`5`),
  (`10`)-[:ASSOCIATED_DURING_VISIT ]->(`12`),
  (`4`)-[:HAS_OBSERVATION_OCCURRENCE ]->(`0`),
  (`12`)-[:HAS_CONCEPT ]->(`11`),
  (`3`)-[:HAS_CONCEPT ]->(`11`),
  (`6`)-[:HAS_CONCEPT ]->(`11`),
  (`10`)-[:HAS_CONCEPT ]->(`11`),
  (`0`)-[:HAS_CONCEPT ]->(`11`),
  (`11`)-[:IN_DOMAIN ]->(`13`),
  (`11`)-[:USES_VOCABULARY ]->(`14`),
  (`11`)-[:BELONGS_TO_CLASS ]->(`15`),
  (`13`)-[:HAS_COCEPT ]->(`11`);

// example of change/remove a label from a node 
// match (n:MeasurementOccurrence) remove n:MeasurementOccurrence set n:Measurement return n


  //-----------------------create constraints for import -----------------------//



CREATE CONSTRAINT ON (p:Person) ASSERT p.person_id IS UNIQUE;
CREATE CONSTRAINT ON (o:Observation) ASSERT o.observation_id IS UNIQUE;
CREATE CONSTRAINT ON (o1:ObservationPeriod) ASSERT o1.observation_period_id IS UNIQUE;
CREATE CONSTRAINT ON (d1:DrugExposure) ASSERT d1.drug_exposure_id IS UNIQUE;
CREATE CONSTRAINT ON (v:VisitOccurrence) ASSERT v.visit_occurrence_id IS UNIQUE;
CREATE CONSTRAINT ON (c:ConditionOccurrence) ASSERT c.condition_occurrence_id IS UNIQUE;
CREATE CONSTRAINT ON (p1:Provider) ASSERT p1.provider_id IS UNIQUE;
CREATE CONSTRAINT ON (m:Measurement) ASSERT m.measurement_id IS UNIQUE;
CREATE CONSTRAINT ON (p:ProcedureOccurrence) ASSERT p.procedure_occurrence_id IS UNIQUE;
create constraint on (c:Concept) Assert c.concept_id is unique;


  //-----------------------create index for loading rels -----------------------//
CREATE INDEX person FOR (p:Person) ON (p.person_id);
CREATE INDEX meas FOR (m:Measurement) ON (m.measurement_id);
CREATE INDEX drug FOR (d:DrugExposure) ON (d.drug_exposure_id;
CREATE INDEX visit FOR (v:VisitOccurrence) ON (v.visit_occurrence_id);
CREATE INDEX prov FOR (p1:Provider) ON (p1.provider_id);
CREATE INDEX obs FOR (o:Observation) ON (o.observation_id);
CREATE INDEX cond FOR (c:Condition) ON (c.condition_occurrence_id);
CREATE INDEX proc FOR (p:ProcedureOccurrence) ON (p.procedure_occurrence_id);






//----------------- person ---------------------//

:param azure_url => 'jdbc:sqlserver://[server link];databaseName=[databasename];user=[username];password=[password]';

call apoc.load.jdbc($azure_url,"select * from omop.person as p") 
yield row 
create (p:Person)
set p.person_id = row.person_id, p.year_of_birth= row.year_of_birth;



//----------------- provider ---------------------//


call apoc.load.jdbc($azure_url,
"select p.provider_id from omop.provider as p") 
yield row 
create (p1:Provider)
set p1.provider_id = row.provider_id;

//----------------- visit ---------------------//


call apoc.load.jdbc($azure_url,"select v.* from omop.visit_occurrence as v") 
yield row 
create (v:VisitOccurrence)
set v.visit_occurrence_id = row.visit_occurrence_id, v.visit_start_date = row.visit_start_date, v.visit_end_date= row.visit_end_date, v.visit_concept_name = row.visit_concept_name,v.visit_concept_id = row.visit_concept_id;


//----------------- observation ---------------------//


call apoc.load.jdbc($azure_url,"select o.* from omop.observation as o") 
yield row 
create (o:Observation)
set o.observation_id = row.observation_id,  
o.observation_date = row.observation_date,
o.observation_concept_id = row.observation_concept_id,
o.observation_concept_name = row.observation_concept_name;

//----------------- observation_period ---------------------//


call apoc.load.jdbc($azure_url,"select o.* from omop.observation_period as o") 
yield row 
create (o1:ObservationPeriod)
set o1.observation_period_id = row.observation_period_id,  o1.observation_period_start_date = row.observation_period_start_date, 
o1.observation_period_end_date = row.observation_period_end_date;

//----------------- drug ---------------------//

call apoc.load.jdbc($azure_url,"select d.* from omop.drug_exposure as d") 
yield row 
create (d:DrugExposure)
set d.drug_exposure_id = row.drug_exposure_id,
d.drug_exposure_start_datetime = row.drug_exposure_start_datetime,
d.drug_exposure_end_datetime = row.drug_exposure_end_datetime,
d.drug_type_concept_id = row.drug_type_concept_id, // drug_concept_id? name?
d.drug_type_concept_name = row.drug_type_concept_name,
d.route_concept_id = row.route_concept_id,
d.route_concept_id = row.route_concept_id,
d.stop_reason = row.stop_reason,
d.drug_concept_id = row.drug_concept_id, 
d.drug_concept_name = row.drug_concept_name;



//----------------- condition ---------------------//


call apoc.load.jdbc($azure_url,"select c.* from omop.condition_occurrence as c") 
yield row 
create (c:ConditionOccurrence)
set c.condition_occurrence_id = row.condition_occurrence_id,
c.condition_start_datetime = row.condition_start_datetime,
c.condition_end_datetime = row.condition_end_datetime,
c.condition_concept_id = row.condition_concept_id, 
c.condition_concept_name = row.condition_concept_name;


//----------------- measurement ---------------------//

// parrallel import
call apoc.periodic.iterate('call apoc.load.jdbc($azure_url,"select m.* from omop.measurement as m") 
yield row
','
create (m:Measurement)
set m.measurement_id = row.measurement_id,
m.measurement_datetime = row.measurement_datetime,
m.unitConceptunit_concept_id = row.unit_concept_id,
m.unit_concept_name = row.unit_concept_name,
m.value_as_number = row.value_as_number,
m.measurement_concept_id = row.measurement_concept_id,
m.measurement_concept_name = row.measurement_concept_name', {batchSize:10000, iterateList:True, parallel:True, params:{azure_url:$azure_url}, retries:5});



//----------------- procedure occurrence ---------------------//
call apoc.load.jdbc($azure_url,"select p2.* from omop.procedure_occurrence as p2") 
yield row 
create (p2:ProcedureOccurrence)
set p2.procedure_occurrence_id = row.procedure_occurrence_id,
p2.procedure_datetime = row.procedure_datetime,
p2.procedure_concept_id = row.procedure_concept_id,
p2.procedure_concept_name = row.procedure_concept_name;  
//Added 140550 labels, created 140550 nodes, set 281100 properties, completed after 3299 ms.




//----------------- vocabulary tables ---------------------//

:param voc_url => 'jdbc:sqlserver://[server name];databaseName=[database name];user=[username];password=[password';

:param sql_concept => "SELECT * FROM vocab.concept WHERE vocabulary_id IN ('Visit','Visit Type', 'Race', 'Gender', 'Ethnicity', 'NULL', 'Condition Type','CPT4','Drug Type','HCPCS','ICD10CM','ICD10PCS','ICD9CM','ICD9Proc','LOINC','Meas Type','None','Obs Period Type','Observation Type','RxNorm','SNOMED','UCUM')"
// this is the sql for importing partial vocab for SCRIPT instead of all vocabularies

call apoc.load.jdbc($voc_url,$sql_concept) 
yield row 
match (c1:Concept)
set c1.concept_id = row.concept_id,
c1.concept_name = row.concept_name,
c1.concept_code = row.concept_code,
c1.valid_start_date = row.valid_start_date,
c1.valid_end_date = row.valid_end_date,
c1.invalid_reason = row.invalid_reason,
c1.standard_concept = row.standard_concept;


// adding missing concept nodes
call apoc.load.jdbc($voc_url,$sql_concept) 
yield row 
with row 
where row.standard_concept is not null
merge (c1:Concept {concept_id:row.concept_id})
set c1.concept_name = row.concept_name,
c1.concept_code = row.concept_code,
c1.valid_start_date = row.valid_start_date,
c1.valid_end_date = row.valid_end_date,
c1.invalid_reason = row.invalid_reason,
c1.standard_concept = row.standard_concept; // case statement for null values


 // added for v4

call apoc.load.jdbc($voc_url,"select c1.* from vocab.concept_class as c1") 
yield row 
create (c2:ConceptClass)
set c2.concept_class_id = row.concept_class_id,
c2.concept_class_name = row.concept_class_name,  
c2.concept_class_concept_id = row.concept_class_concept_id;


call apoc.load.jdbc($voc_url,"select d.* from vocab.domain as d") 
yield row 
create (d1:Domain)
set d1.domain_id = row.domain_id,
d1.domain_name = row.domain_name;


call apoc.load.jdbc($voc_url,"select v2.* from vocab.vocabulary as v2") 
yield row 
create (v2:Vocabulary)
set v2.vocabulary_id = row.vocabulary_id,
v2.vocabulary_name = row.vocabulary_name,
v2.vocabulary_reference = row.vocabulary_reference,
v2.vocabulary_version = row.vocabulary_version;






//-------------------------------------------------- has gender N & E------------------------------------------//

//Gender node - id and name
CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select distinct gender_concept_id, gender_concept_name from omop.person")
yield row ',' 
create (g:Gender {gender_concept_id:row.gender_concept_id,gender_concept_name:row.gender_concept_name})',{batchSize:10000, iterateList:True, parallel:True, params:{azure_url:$azure_url} 
}
);






//-------------------------------------------------- has ethnicity N & E------------------------------------------//

CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select distinct ethnicity_concept_id, ethnicity_concept_name from omop.person")
yield row
','
create (e:Ethnicity {ethnicity_concept_id:row.ethnicity_concept_id,ethnicity_concept_name:row.ethnicity_concept_name})',{batchSize:10000, iterateList:True, parallel:True, params:{azure_url:$azure_url} 
}
);


//-------------------------------------------------- has race  N & E------------------------------------------//

CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select distinct race_concept_id, race_concept_name from omop.person")
yield row
','
create (r:Race {race_concept_name:row.race_concept_name,race_concept_id:row.race_concept_id})',{batchSize:10000, iterateList:True, parallel:True, params:{azure_url:$azure_url} 
}
);








//--------------------------------------------------------------------------------------load relationships------------------------------------------------------------------------------//
//person & visit

//-------------------------------------------------- person - visit  occurrence ------------------------------------------//


call apoc.periodic.iterate('call apoc.load.jdbc($azure_url,"select v.person_id, v.visit_occurrence_id from omop.visit_occurrence as v") 
yield row
','
match (p:Person {person_id:toInteger(row.person_id)})   
match (v:VisitOccurrence {visit_occurrence_id:toInteger(row.visit_occurrence_id)})
merge (p)-[:HAS_VISIT_OCCURRENCE]->(v)', {batchSize:10000, iterateList:True, parallel:False, params: {azure_url: $azure_url}, retries: 5} );// merge is safer for nodes without constraints



//-------------------------------------------------- person- observation ------------------------------------------//
call apoc.periodic.iterate('call apoc.load.jdbc($azure_url,"select o.person_id, o.observation_id, o.observation_date
from omop.observation o") 
yield row
','
match (p:Person {person_id:row.person_id})
match (o:Observation {observation_id:row.observation_id, observation_date:row.observation_date})
merge (p)-[:HAS_OBSERVATION_OCCURRENCE]->(o)', {batchSize:10000, iterateList:True, parallel:False, params: {azure_url: $azure_url}, retries:5});
//1075


//-------------------------------------------------- person - obs period ------------------------------------------//




call apoc.periodic.iterate('call apoc.load.jdbc($azure_url,"select p.person_id, p.observation_period_id from omop.observation_period as p") 
yield row
','
match (p:Person {person_id:row.person_id})
match (op:ObservationPeriod {observation_period_id:row.observation_period_id})
merge (p)-[:HAS_OBSERVATION_PERIOD]->(op)', {batchSize:10000, iterateList:True, parallel:False, params: {azure_url: $azure_url}});

//-------------------------------------------------- procedure occurrence ------------------------------------------//
call apoc.periodic.iterate('call apoc.load.jdbc($azure_url,"select p.person_id, p.procedure_occurrence_id from omop.procedure_occurrence as p") 
yield row
','
match (p:Person {person_id:row.person_id})
match (pc:ProcedureOccurrence {procedure_occurrence_id:row.procedure_occurrence_id})
merge (p)-[:HAS_PROCEDURE_OCCURRENCE]->(pc)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});


//-------------------------------------------------- condition occurrence ------------------------------------------//



CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select c.person_id, c.condition_occurrence_id from omop.condition_occurrence as c")
yield row
','
match (p:Person {person_id:row.person_id})
match (c:ConditionOccurrence {condition_occurrence_id:row.condition_occurrence_id}) 
merge (p)-[:HAS_CONDITION_OCCURRENCE]->(c)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5 
}
);

//-------------------------------------------------- drug exposure ------------------------------------------//




CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select d.person_id, d.drug_exposure_id from omop.drug_exposure d")
             yield row
             ','
             match (p:Person {person_id:row.person_id})
             match (d:DrugExposure {drug_exposure_id:row.drug_exposure_id}) 
             merge (p)-[:HAS_DRUG_EXPOSURE]->(d)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});



//-------------------------------------------------- HAS Measurement Nodes and edges ------------------------------------------//




CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select m.person_id, m.measurement_id, m.measurement_datetime, m.unit_concept_id, m.unit_concept_name, m.value_as_number from omop.measurement m ")
yield row
','
match (p:Person {person_id:row.person_id})
match (m:Measurement {measurement_id: row.measurement_id}) 
merge (p)-[:HAS_MEASUREMENT]->(m)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5 
}
);


//-------------------------------------------------- provider activities ------------------------------------------//



 //-------------------------------------------------- provider-observation ------------------------------------------//
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select o.observation_id, o.provider_id from omop.observation o")
             yield row
             ','
             with row where row.provider_id is not null
             match (o:Observation {observation_id: row.observation_id})
             match (p3:Provider {provider_id:row.provider_id})
             merge (p3)-[:RESPONSIBLE_FOR]->(o)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});

 
 
 //-------------------------------------------------- provider-meas ------------------------------------------//
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select m.provider_id, m.measurement_id from omop.measurement m")
             yield row
             ','
             with row where row.provider_id is not null
             match (m:Measurement {measurement_id: row.measurement_id}), (p1:Provider {provider_id:row.provider_id})
             merge (p1)-[:RESPONSIBLE_FOR]->(m)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});

 
 //-------------------------------------------------- provider-visit ------------------------------------------//
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select v.provider_id, v.visit_occurrence_id from omop.visit_occurrence v")
             yield row
             ','
             with row where row.provider_id is not null
             match (v:VisitOccurrence {visit_occurrence_id: row.visit_occurrence_id}), (p1:Provider {provider_id:row.provider_id})
             merge (p1)-[r:ASSOCIATED_WITH]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});

 
 

 
 
 
 //-------------------------------------------------- provider-procedure ------------------------------------------//
 
 
 
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select p.provider_id, p.procedure_occurrence_id from omop.procedure_occurrence p")
             yield row
             ','
             with row where row.provider_id is not null
             match (p2:ProcedureOccurrence {procedure_occurrence_id: row.procedure_occurrence_id})
             match (p1:Provider {provider_id:row.provider_id})
             merge (p1)-[:RESPONSIBLE_FOR]->(p2)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});


 
 // 
 
 
 //-------------------------------------------------- provider-condition ------------------------------------------//
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select c.provider_id, c.condition_occurrence_id from omop.condition_occurrence c")
             yield row
             ','
             with row where row.provider_id is not null
             match (c:ConditionOccurrence {condition_occurrence_id: row.condition_occurrence_id})
             match (p1:Provider {provider_id:row.provider_id})
             merge (p1)-[:CAPTURED]->(c)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});





 //-------------------------------------------------- provider-drugs ------------------------------------------//
 
 CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select d.provider_id, d.drug_exposure_id from omop.drug_exposure d")
             yield row
             ','
             with row where row.provider_id is not null
             match (d:DrugExposure {drug_exposure_id: row.drug_exposure_id})
             match (p1:Provider {provider_id:row.provider_id})
             merge (p1)-[:INITIATED]->(d)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});


// add person_id to visit and condition for patient trajectory


CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select v.person_id, v.visit_occurrence_id from omop.visit_occurrence v")
             yield row
             ','
             match (v:VisitOccurrence)
             where v.visit_occurrence_id = row.visit_occurrence_id
             set v.person_id = row.person_id
             ',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});



             


CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select c.person_id, c.condition_occurrence_id from omop.condition_occurrence c;")
             yield row
             ','
             match (c:ConditionOccurrence {condition_occurrence_id: row.condition_occurrence_id})
             set c.person_id = row.person_id
             ',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});





//-------------------------------------------------- 5 ASSOCIATED DURING VISIT ------------------------------------------//


// 1.condition-visit
CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select c.condition_occurrence_id, c.visit_occurrence_id from omop.condition_occurrence c ")
yield row
','
match (c:ConditionOccurrence {condition_occurrence_id: row.condition_occurrence_id})
match (v:VisitOccurrence {visit_occurrence_id:row.visit_occurrence_id})
merge (c)-[:ASSOCIATED_DURING_VISIT]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});

// 2.procedure-visit 

CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select p.procedure_occurrence_id, p.visit_occurrence_id from omop.procedure_occurrence p")
yield row
','
match (p1:ProcedureOccurrence {procedure_occurrence_id: row.procedure_occurrence_id})
match (v:VisitOccurrence {visit_occurrence_id:row.visit_occurrence_id})
merge (p1)-[:ASSOCIATED_DURING_VISIT]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});




// 3.obs -visit
CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select o.observation_id, o.visit_occurrence_id from omop.observation o")
yield row
','
match (o:Observation {observation_id: row.observation_id})
match (v:VisitOccurrence {visit_occurrence_id:row.visit_occurrence_id})
merge (o)-[:ASSOCIATED_DURING_VISIT]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});




// 4.drug - visit

CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select o.drug_exposure_id, o.visit_occurrence_id from omop.drug_exposure o")
yield row
','
match (d:DrugExposure {drug_exposure_id: row.drug_exposure_id})
match (v:VisitOccurrence {visit_occurrence_id:row.visit_occurrence_id})
merge (d)-[:ASSOCIATED_DURING_VISIT]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});

// 5. meas-visit
CALL apoc.periodic.iterate('call apoc.load.jdbc($azure_url, "select m.measurement_id, m.visit_occurrence_id from omop.measurement m")
yield row
','
match (m:Measurement {measurement_id: row.measurement_id})
match (v:VisitOccurrence {visit_occurrence_id:row.visit_occurrence_id})
merge (m)-[:ASSOCIATED_DURING_VISIT]->(v)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});



//-------------------------------------------------- 3 DEMOGRAPHICS ------------------------------------------//


// rels
call apoc.load.jdbc($azure_url, "select distinct race_concept_id, person_id from omop.person")
yield row
match (p:Person {person_id:row.person_id})
match (r:Race {race_concept_id:row.race_concept_id})
merge (p)-[r1:HAS_RACE]-(r);
//Created 390 relationships, completed after 176 ms.



call apoc.load.jdbc($azure_url, "select distinct ethnicity_concept_id, person_id from omop.person")
yield row
match (p:Person {person_id:row.person_id})
match (e:Ethnicity {ethnicity_concept_id:row.ethnicity_concept_id})
merge (p)-[r:HAS_ETHNICITY]-(e);
// Created 390 relationships, completed after 159 ms.



call apoc.load.jdbc($azure_url, "select distinct gender_concept_id, person_id from omop.person")
yield row
match (p:Person {person_id:row.person_id})
match (g:Gender {gender_concept_id:row.gender_concept_id})
merge (p)-[r:HAS_GENDER]-(g);



//----------------- vocabulary tables relationships---------------------//


call apoc.load.jdbc($voc_url,"select d.* from vocab.domain as d") 
yield row 
match (d:Domain {domain_id:row.domain_id} 
match (c:Concept {concept_id:row.concept_id})
merge (c)-[r:IN_DOMAIN]->(d)




//----------------- patient trajectories ---------------------//

CALL apoc.periodic.iterate('
match (v1:VisitOccurrence)
match (v2:VisitOccurrence)
where v1.person_id = v2.person_id and v1.visit_start_date < v2.visit_start_date
merge (v1)-[r:NEXT]->(v2)',{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});


CALL apoc.periodic.iterate('match(v1:VisitOccurrence) match (v2:VisitOccurrence) return v1,v2',
'where v1.person_id = v2.person_id and v1.visit_start_date < v2.visit_start_date merge (v1)-[r:NEXT]->(v2)',
{batchSize:10000, iterateList:True, parallel:False, params:{azure_url:$azure_url}, retries:5});





  //--------------------- need to load the HAS_CONCEPT relationships (between instances)--------------//


//----------------- Condition ---------------------//
// iterate method
CALL apoc.periodic.iterate('
match (c1:ConditionOccurrence)
match (c:Concept)
where c1.condition_concept_id = c.concept_id return c, c1
','
merge (c1)-[r:HAS_CONCEPT]->(c)',{batchSize:10000, iterateList:True, parallel:False});

neo4j@neo4j> CALL apoc.periodic.iterate('
             match (c1:ConditionOccurrence)
             match (c:Concept)
             where c1.condition_concept_id = c.concept_id return c, c1
             ','
             merge (c1)-[r:HAS_CONCEPT]->(c)',{batchSize:10000, iterateList:True, parallel:False});


//----------------- Meas ---------------------//


match (m:Measurement)
match (c:Concept)
where m.measurement_concept_id = c.concept_id
merge (m)-[r:HAS_CONCEPT]->(c);


//----------------- Procedure ---------------------//



match (p:ProcedureOccurrence)
match (c:Concept)
where p.procedure_concept_id = c.concept_id
merge (p)-[r:HAS_CONCEPT]->(c);




//----------------- Observation ---------------------//

match (o:Observation)
match (c:Concept)
where o.observation_concept_id = c.concept_id
merge (o)-[r:HAS_CONCEPT]->(c);




//----------------- VisitOccurrence ---------------------//


match (v:VisitOccurrence)
match (c:Concept)
where v.visit_concept_id = c.concept_id
merge (v)-[r:HAS_CONCEPT]->(c);


//----------------- DrugExposure ---------------------//

match (d:DrugExposure)
match (c:Concept)
where d.drug_concept_id = c.concept_id
merge (d)-[r:HAS_CONCEPT]->(c);


//----------------- add more edges to the graph : patient-instances direct OPTIONAL ---------------------//


match (p:Person)-[]->(c:ConditionOccurrence)-[]->(c1:Concept) merge (p)-[r:HAS_CONDITION_CONCEPT]-(c1) return count(r);

match (p:Person)-[]->(p1:ProcedureOccurrence)-[]->(c1:Concept) merge (p)-[r:HAS_PROCEDURE_CONCEPT]-(c1) return count(r);

match (p:Person)-[]->(o:Observation)-[]->(c1:Concept) merge (p)-[r:HAS_OBSERVATION_CONCEPT]-(c1) return count(r);

match (p:Person)-[]->(v:VisitOccurrence)-[]->(c1:Concept) merge (p)-[r:HAS_VISIT_CONCEPT]-(c1) return count(r);

match (p:Person)-[]->(d:DrugExposure)-[]->(c1:Concept) merge (p)-[r:HAS_DRUG_CONCEPT]-(c1) return count(r);

match (p:Person)-[]->(m:Measurement)-[]->(c1:Concept) merge (p)-[r:HAS_MEASUREMENT_CONCEPT]-(c1) return count(r);
