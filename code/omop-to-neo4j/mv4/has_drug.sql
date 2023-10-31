\copy (select distinct person_id as ":START_ID(Person)", drug_exposure_id as ":END_ID(DrugExposure)",'HAS_DRUG_EXPOSURE' as ":TYPE" from public.drug_exposure) to 'has_drug.csv' WITH CSV HEADER;
