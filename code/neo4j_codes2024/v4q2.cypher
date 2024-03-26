with ['Anesthetics, local','Local anesthetics','Sodium','Salt solutions','Other irrigating solutions','Tests for diabetes','Carbohydrates','Potassium','Zinc','Other diagnostic agents','Tests for bile duct patency','Bulk-forming laxatives','Tests for gastric secretion','Paramagnetic contrast media','Other i.v. solution additives','Tests for thyreoidea function','Tests for fertility disturbances','Tests for pituitary function','Bioflavonoids','Watersoluble, hepatotropic X-ray contrast media','Tests for pancreatic function','Watersoluble, nephrotropic, high osmolar X-ray contrast media','Tests for renal function and ureteral injuries','Watersoluble, nephrotropic, low osmolar X-ray contrast media','Non-watersoluble X-ray contrast media','Tests for liver functional capacity','Colouring agents','Other agents for local oral treatment'] as exclude_list
match (v:VisitOccurrence)<-[r1:ASSOCIATED_DURING_VISIT]-(d1:DrugExposure)-[r2:DRUG_ATC4]-(a:ATC4)
            where  v.visit_concept_name = 'Inpatient Visit'
                    with v, collect(distinct a.atc4_name) as a1, exclude_list
                    with v, apoc.coll.dropDuplicateNeighbors(apoc.coll.sort(apoc.coll.flatten(a1))) as a1, exclude_list
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