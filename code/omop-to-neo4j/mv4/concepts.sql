SELECT relationship_id, count(*) 
FROM "concept_relationship"
where concept_id_1 <> concept_id_2
group by relationship_id; -- 514 

--LIMIT 1000;

-- SELECT *
-- FROM "concept_relationship"
-- where concept_id_1 = concept_id_2 -- 6457018 records
--     and  relationship_id not in ('Maps to','Mapped from')  


SELECT relationship_id, count(*)
FROM "concept_relationship"
where concept_id_1 = concept_id_2 -- 6457018 records
group by relationship_id

-- relationship_id
-- character varying
-- count
-- bigint
-- 1	Maps to	3228501
-- 2	Value mapped from	2
-- 3	Panel contains	6
-- 4	Mapped from	3228501
-- 5	Maps to value	2
-- 6	Contained in panel	6


------------- concept node ---------------
select distinct concept_id as "concept_id:ID(Concept)", 
                concept_name, 
                domain_id,
                vocabulary_id,
                concept_class_id,
                concept_code
from public.concept
limit 10; -- too large to load in vs code- load from terminal

\copy (select distinct concept_id as "concept_id:ID(Concept)", concept_name, domain_id, vocabulary_id, concept_class_id,concept_code from public.concept) to 'concept.csv' WITH CSV HEADER;


------------- concept_class node ---------------
select distinct concept_class_id as "concept_class_id:ID(ConceptClass)", 
                concept_class_name, 
                concept_class_concept_id
from concept_class


------------- domain node ---------------
select distinct domain_id as "domain_id:ID(Domain)", 
                domain_name, 
                domain_concept_id
from domain

------------- vocabulary node ---------------
select distinct vocabulary_id as "vocabulary_id:ID(Domain)", 
                vocabulary_name, 
                vocabulary_concept_id
from vocabulary




------------- concept_relationship edge RELATED_TO ---------------
select distinct concept_id_1 as ":START_ID(Concept)", 
                concept_id_2 as ":END_ID(Concept)",
                relationship_id,
                'RELATED_TO' as ":TYPE"
from concept_relationship
where concept_id_1 <> concept_id_2 -- too large to load in vs code- load from terminal

\copy (select distinct concept_id_1 as ":START_ID(Concept)", concept_id_2 as ":END_ID(Concept)",relationship_id,'RELATED_TO' as ":TYPE" from concept_relationship where concept_id_1 <> concept_id_2) to 'related_to.csv' WITH CSV HEADER;


------------- concept_domain edge IN_DOMAIN ---------------
select distinct domain_concept_id as ":START_ID(Concept)", 
                domain_id as ":END_ID(Domain)",
                'IN_DOMAIN' as ":TYPE"
from domain d


select distinct domain_concept_id as ":END_ID(Concept)", 
                domain_id as ":START_ID(Domain)",
                'HAS_CONCEPT' as ":TYPE"
from domain

------------- concept_vocab edge USES_VOCABULARY ---------------
select distinct vocabulary_concept_id as ":START_ID(Concept)", 
                vocabulary_id as ":END_ID(Vocabulary)",
                'USES_VOCABULARY' as ":TYPE"
from vocabulary

select distinct vocabulary_concept_id as ":END_ID(Concept)", 
                vocabulary_id as ":START_ID(Vocabulary)",
                'HAS_CONCEPT' as ":TYPE"
from vocabulary

------------- concept_cclass edge BELONGS_TO_CLASS ---------------
select distinct concept_class_concept_id as ":START_ID(Concept)", 
                concept_class_id as ":END_ID(ConceptClass)",
                'BELONGS_TO_CLASS' as ":TYPE"
from concept_class

select distinct concept_class_concept_id as ":END_ID(Concept)", 
                concept_class_id as ":START_ID(ConceptClass)",
                'HAS_CONCEPT' as ":TYPE"
from concept_class


--------------- drug-class - IS_IN_DRUG_CLASS TBD ----------- 


select distinct drug_exposure_id as ":START_ID(Drug)", 
                concept_class_id as ":END_ID(ConceptClass)",
                'IS_IN_DRUG_CLASS' as ":TYPE"
from drug_exposure d 
    join concept c
    on d.drug_concept_id = c.concept_id
-- limit 10;


---- check on classes
select distinct 
                concept_class_id as ":END_ID(ConceptClass)"
from drug_exposure d 
    join concept c
    on d.drug_concept_id = c.concept_id 


