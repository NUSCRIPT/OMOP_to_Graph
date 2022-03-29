// remove the limit


//----------------- modelv4 -------------//
//Q1v4 -- match on same visit
match path = (v1)<-[:ASSOCIATED_DURING_VISIT]-(c:ConditionOccurrence)<-[r0:HAS_CONDITION_OCCURRENCE]-(p:Person)-[r:HAS_DRUG_EXPOSURE]->(d:DrugExposure)-[r1:ASSOCIATED_DURING_VISIT]->(v2)-[r2:ASSOCIATED_DURING_VISIT]-(p2:ProcedureOccurrence)
where d.drug_concept_name = 'dexamethasone' and p2.procedure_concept_name contains 'chest' and c.condition_concept_name ='Spontaneous pneumothorax' 
and v1=v2  
return path;

//Q2v4 code - top 10 co prescribed drugs on the same visit

match path=(d1:DrugExposure)-[r0:ASSOCIATED_DURING_VISIT]->(v:VisitOccurrence)<-[r1:ASSOCIATED_DURING_VISIT]-(d2:DrugExposure) 
where d1.drug_concept_id <> d2.drug_concept_id
return d1.drug_concept_name, d2.drug_concept_name, count(distinct v.visit_occurrence_id) as frequency order by frequency desc limit 10; 
// the path counts is different from v1 - change to count(viist_occurrence_id)


//----------------- modelv1 -------------//

//q1v1 
match path=(c:ConditionOccurrence)<-[r1:HAS_CONDITION_OCCURRENCE]-(p1:Person)-[r0:HAS_DRUG_EXPOSURE]->(d:DrugExposure)<-[r2:HAS_DRUG_EXPOSURE]-(p1:Person)-[r3:HAS_PROCEDURE_OCCURRENCE]->(p4:ProcedureOccurrence)
where r1.visit_occurrence_id=r2.visit_occurrence_id and r2.visit_occurrence_id=r3.visit_occurrence_id and d.drug_concept_name = 'dexamethasone' and p4.procedure_concept_name contains 'chest'  and c.condition_concept_name ='Spontaneous pneumothorax' 
return path;

//q2v1 

match path=(d1:DrugExposure)<-[r1:HAS_DRUG_EXPOSURE]-(p1:Person)-[r2:HAS_DRUG_EXPOSURE]->(d2:DrugExposure)
where d1.drug_concept_id <> d2.drug_concept_id and r1.visit_occurrence_id=r2.visit_occurrence_id
return d1.drug_concept_name, d2.drug_concept_name, count(distinct r1.visit_occurrence_id) as frequency order by frequency desc limit 10; 


