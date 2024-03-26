with ['Anesthetics, local','Local anesthetics','Sodium','Salt solutions','Other irrigating solutions','Tests for diabetes','Carbohydrates','Potassium','Zinc','Other diagnostic agents','Tests for bile duct patency','Bulk-forming laxatives','Tests for gastric secretion','Paramagnetic contrast media','Other i.v. solution additives','Tests for thyreoidea function','Tests for fertility disturbances','Tests for pituitary function','Bioflavonoids','Watersoluble, hepatotropic X-ray contrast media','Tests for pancreatic function','Watersoluble, nephrotropic, high osmolar X-ray contrast media','Tests for renal function and ureteral injuries','Watersoluble, nephrotropic, low osmolar X-ray contrast media','Non-watersoluble X-ray contrast media','Tests for liver functional capacity','Colouring agents','Other agents for local oral treatment'] as exclude_list
match (a1:ATC4)<-[r0:DRUG_ATC4]-(d1:DrugExposure)<-[r1:HAS_DRUG_EXPOSURE]-(p1:Person)-[r2:HAS_VISIT_OCCURRENCE]-(v:VisitOccurrence)
        where r1.visit_occurrence_id = r2.visit_occurrence_id and r2.visit_concept_name = 'Inpatient Visit'
                    with r1.visit_occurrence_id as v1, collect(distinct a1.atc4_name) as a1, exclude_list
                    with v1, apoc.coll.dropDuplicateNeighbors(apoc.coll.sort(apoc.coll.flatten(a1))) as a1, exclude_list
                    where size(a1)>1 
                    unwind a1 as x
                    unwind a1 as y

                    call {
                        with x,y, exclude_list
                        with x,y where x < y and not x in exclude_list and not y in exclude_list
                        return  x as d1, y as d2
                    }
                    return count(*) as ct,d1, d2
                    order by ct desc
                    limit 30;