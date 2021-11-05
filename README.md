# OMOP_to_Graph
Transform the [OMOP](https://github.com/OHDSI/CommonDataModel/wiki) CDM to graph model

## Draft Schemas

1. [Schema Draft 1](Draft_schema.md)
1. [Schema Draft 2](draft_schema_option2.md)  **[ Exclude ]**
1. [Schema Draft 3](draft_schema_option3.md) [ To review ]
4. [Schema Draft 4](draft_schema_option4.md) **[Finalized version for AMIA submission]**


## Create the neo4j database from a relational database instructions
1. Use [neo4j drivers](https://neo4j.com/developer/language-guides/#neo4j-drivers) and embedd the cypher code into your scripts, either Python, Java, JavaScript .etc
2. Use Cypher shell to run the code directly in the terminal - more information [here](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/)
  Steps:
   - Go to the local bin folder
   - ./cypher-shell -a [your-server-link]:[your-port-number] -u [your-username]
   - Copy paste the [code](https://github.com/NUSCRIPT/OMOP_to_Graph/blob/master/code/omop_to_neo4j_build_database.cypher) you want to load
