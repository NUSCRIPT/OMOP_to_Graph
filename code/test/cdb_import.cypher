
//20230628 MV1admin import
/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv1/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv1/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv1/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv1/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv1/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv1/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv1/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv1/ethnicity.csv --nodes=ATC3=/data/neo4j_standalone/import/CRITICAL/mv1/atc3.csv --relationships=DRUG_ATC3=/data/neo4j_standalone/import/CRITICAL/mv1/drug_atc3.csv  --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_condition.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv1/has_measurement.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv1/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv1/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv1/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv1/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv1/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv1/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv1/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true

//20230628 MV4admin import
/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv4/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv4/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv4/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv4/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv4/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv4/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv4/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv4/ethnicity.csv --nodes=ATC3=/data/neo4j_standalone/import/CRITICAL/mv4/atc3.csv --relationships=DRUG_ATC3=/data/neo4j_standalone/import/CRITICAL/mv4/drug_atc3.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv4/has_measurement.csv --relationships=ASSOCIATED_DURING_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/meas_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/condition_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/drug_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/procedure_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/observation_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_condition.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv4/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv4/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv4/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv4/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv4/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv4/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true

//20230814 MV1admin atc4 import

/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv1/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv1/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv1/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv1/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv1/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv1/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv1/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv1/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv1/ethnicity.csv --nodes=ATC4=/data/neo4j_standalone/import/CRITICAL/mv1/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/CRITICAL/mv1/drug_atc4.csv  --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_condition.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv1/has_measurement.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv1/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv1/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv1/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv1/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv1/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv1/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv1/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv1/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true

//202308 MV4admin import
/usr/bin/neo4j-admin import --database neo4j --nodes=Person=/data/neo4j_standalone/import/CRITICAL/mv4/person.csv --nodes=Measurement=/data/neo4j_standalone/import/CRITICAL/mv4/lab.csv --nodes=VisitOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/visit.csv --nodes=ConditionOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/condition.csv --nodes=DrugExposure=/data/neo4j_standalone/import/CRITICAL/mv4/drug.csv --nodes=Observation=/data/neo4j_standalone/import/CRITICAL/mv4/observation.csv  --nodes=ObservationPeriod=/data/neo4j_standalone/import/CRITICAL/mv4/obs_period.csv  --nodes=ProcedureOccurrence=/data/neo4j_standalone/import/CRITICAL/mv4/procedure.csv --nodes=Race=/data/neo4j_standalone/import/CRITICAL/mv4/race.csv --nodes=Gender=/data/neo4j_standalone/import/CRITICAL/mv4/gender.csv --nodes=Ethnicity=/data/neo4j_standalone/import/CRITICAL/mv4/ethnicity.csv --nodes=ATC4=/data/neo4j_standalone/import/CRITICAL/mv4/atc4.csv --relationships=DRUG_ATC4=/data/neo4j_standalone/import/CRITICAL/mv4/drug_atc4.csv --relationships=HAS_MEASUREMENT=/data/neo4j_standalone/import/CRITICAL/mv4/has_measurement.csv --relationships=ASSOCIATED_DURING_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/meas_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/condition_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/drug_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/procedure_visit.csv, /data/neo4j_standalone/import/CRITICAL/mv4/observation_visit.csv --relationships=HAS_CONDITION_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_condition.csv --relationships=HAS_DRUG_EXPOSURE=/data/neo4j_standalone/import/CRITICAL/mv4/has_drug.csv  --relationships=HAS_PROCEDURE_OCCURRENCE=/data/neo4j_standalone/import/CRITICAL/mv4/has_procedure.csv --relationships=HAS_VISIT=/data/neo4j_standalone/import/CRITICAL/mv4/has_visit.csv --relationships=HAS_OBSERVATION=/data/neo4j_standalone/import/CRITICAL/mv4/has_observation.csv  --relationships=HAS_OBSERVATION_PERIOD=/data/neo4j_standalone/import/CRITICAL/mv4/has_obs_period.csv --relationships=HAS_Gender=/data/neo4j_standalone/import/CRITICAL/mv4/has_gender.csv --relationships=HAS_race=/data/neo4j_standalone/import/CRITICAL/mv4/has_race.csv --relationships=HAS_ETHNICITY=/data/neo4j_standalone/import/CRITICAL/mv4/has_ethnicity.csv --ignore-empty-strings --report-file=/dev/null --skip-bad-relationships=true



// 202307 qeury for v1q2 - get the co-prescribed drug categories - atc3 level



//original query 
match (a1:ATC3)<-[r0:DRUG_ATC3]-(d1:DrugExposure)<-[r1:HAS_DRUG_EXPOSURE]-(p:Person)-[r2:HAS_DRUG_EXPOSURE]->(d2:DrugExposure)-[r3:DRUG_ATC3]->(a2:ATC3)
where r1.visit_occurrence_id = r2.visit_occurrence_id
        and d1.drug_concept_id < d2.drug_concept_id
return a1.atc_name, a2.atc_name, count(*) as frequency
order by frequency desc
limit 10;


return datetime();

with ['Anesthetics, local','Local anesthetics','Sodium','Salt solutions','Other irrigating solutions','Tests for diabetes','Carbohydrates','Potassium','Zinc','Other diagnostic agents','Tests for bile duct patency','Bulk-forming laxatives','Tests for gastric secretion','Paramagnetic contrast media','Other i.v. solution additives','Tests for thyreoidea function','Tests for fertility disturbances','Tests for pituitary function','Bioflavonoids','Watersoluble, hepatotropic X-ray contrast media','Tests for pancreatic function','Watersoluble, nephrotropic, high osmolar X-ray contrast media','Tests for renal function and ureteral injuries','Watersoluble, nephrotropic, low osmolar X-ray contrast media','Non-watersoluble X-ray contrast media','Tests for liver functional capacity','Colouring agents'] as exclude_list
match (a1:ATC3)<-[r0:DRUG_ATC3]-(d1:DrugExposure)<-[r1:HAS_DRUG_EXPOSURE]-(p1:Person)
                    with r1.visit_occurrence_id as v1, collect(distinct a1.atc3_name) as a1
                    with v1, apoc.coll.dropDuplicateNeighbors(apoc.coll.sort(apoc.coll.flatten(a1))) as a1
                    where size(a1)>1 
                    unwind a1 as x
                    unwind a1 as y

                    call {
                        with x,y
                        with x,y where x < y and not x in exclude_list and not y in exclude_list
                        return  x as d1, y as d2

                    }
                    return count(*) as ct,d1, d2
                    order by ct desc
                    limit 30;
return datetime(); // should limit the drugs to the same visit occurrence


// 202307 qeury for v4q2 - get the co-prescribed drug categories - atc3 level
// with ['Anesthetics, local','Local anesthetics','Sodium','Salt solutions','Other irrigating solutions','Tests for diabetes','Carbohydrates','Potassium','Zinc','Other diagnostic agents','Tests for bile duct patency','Bulk-forming laxatives','Tests for gastric secretion','Paramagnetic contrast media','Other i.v. solution additives','Tests for thyreoidea function','Tests for fertility disturbances','Tests for pituitary function','Bioflavonoids','Watersoluble, hepatotropic X-ray contrast media','Tests for pancreatic function','Watersoluble, nephrotropic, high osmolar X-ray contrast media','Tests for renal function and ureteral injuries','Watersoluble, nephrotropic, low osmolar X-ray contrast media','Non-watersoluble X-ray contrast media','Tests for liver functional capacity','Colouring agents'] as exclude_list
 match (v:VisitOccurrence)<-[r1:ASSOCIATED_DURING_VISIT]-(d1:DrugExposure)-[r2:DRUG_ATC4]-(a:ATC4)
                    with v.visit_occurrence_id as v, collect(distinct a.atc4_id) as a1
                    with v, apoc.coll.dropDuplicateNeighbors(apoc.coll.sort(apoc.coll.flatten(a1))) as a1
                    where size(a1)>1 
                    unwind a1 as x
                    unwind a1 as y
                    call {
                        with x,y
                        with x,y where x < y and x <>"No matching concept" and y <>"No matching concept"
                        return  x as d1, y as d2
                    }
                    return count(*) as ct,d1, d2
                    order by ct desc
                    limit 10; 

with ['Anesthetics, local','Local anesthetics','Sodium','Salt solutions','Other irrigating solutions','Tests for diabetes','Carbohydrates','Potassium','Zinc','Other diagnostic agents','Tests for bile duct patency','Bulk-forming laxatives','Tests for gastric secretion','Paramagnetic contrast media','Other i.v. solution additives','Tests for thyreoidea function','Tests for fertility disturbances','Tests for pituitary function','Bioflavonoids','Watersoluble, hepatotropic X-ray contrast media','Tests for pancreatic function','Watersoluble, nephrotropic, high osmolar X-ray contrast media','Tests for renal function and ureteral injuries','Watersoluble, nephrotropic, low osmolar X-ray contrast media','Non-watersoluble X-ray contrast media','Tests for liver functional capacity','Colouring agents'] as exclude_list
 match (v:VisitOccurrence)<-[r1:ASSOCIATED_DURING_VISIT]-(d1:DrugExposure)-[r2:DRUG_ATC4]-(a:ATC4)
                    with v, collect(distinct a.atc4_name) as a1
                    with v, apoc.coll.dropDuplicateNeighbors(apoc.coll.sort(apoc.coll.flatten(a1))) as a1
                    where size(a1)>1 
                    unwind a1 as x
                    unwind a1 as y
                    call {
                        with x,y
                        with x,y where x < y and not x in exclude_list and not y in exclude_list
                    }
                    return count(*) as ct,d1, d2
                    order by ct desc
                    limit 30;   // check the top 30 drugs
