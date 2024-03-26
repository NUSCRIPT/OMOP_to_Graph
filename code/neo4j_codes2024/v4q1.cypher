match path = (v1:VisitOccurrence)<-[:ASSOCIATED_DURING_VISIT]-(c:ConditionOccurrence)<-[r0:HAS_CONDITION_OCCURRENCE]-(p:Person)-[r:HAS_DRUG_EXPOSURE]->(d:DrugExposure)-[r1:ASSOCIATED_DURING_VISIT]->(v2:VisitOccurrence)-[r2:ASSOCIATED_DURING_VISIT]-(p2:ProcedureOccurrence)
where d.drug_concept_name = 'dexamethasone' and p2.procedure_concept_name contains 'chest' and c.condition_concept_name ='Spontaneous pneumothorax' 
and v1=v2  
return path limit 10; 