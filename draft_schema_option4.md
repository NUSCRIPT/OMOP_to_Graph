### Design
In this version, we added the Domain, Vocabulary, ConceptClass to the schema. we also created self-directed relationship RELATED_TO and NEXT between Concept and VisitOccurrence (to present patient journey) seperately

### Diagram
![v4 schema](https://raw.githubusercontent.com/NUSCRIPT/OMOP_to_Graph/master/figures/omop_schema_v4.svg?token=AG5FZH2CTSA6UPUK7ZR3PSC7QX6ME)

**Arrows Markdown**
[For use in Arrow](http://www.apcjones.com/arrows/#)

```
<ul class="graph-diagram-markup" data-internal-scale="2.24" data-external-scale="1">
  <li class="node" data-node-id="0" data-x="371.4498876535569" data-y="605.4527960839318">
    <span class="caption">DrugExposure</span><dl class="properties"><dt>drugExposureId</dt><dd>''</dd><dt>drugExposureStartDatetime</dt><dd>''</dd><dt>drugExposureEndDatetime</dt><dd>''</dd><dt>stopReason</dt><dd>''</dd><dt>drugTypeConceptId</dt><dd>''</dd><dt>drugTypeConceptName</dt><dd>''</dd><dt>routeConceptId</dt><dd>''</dd><dt>routeConceptName</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="1" data-x="993.4215557793323" data-y="-542.8533458865409">
    <span class="caption">Person</span><dl class="properties"><dt>personId</dt><dd>''</dd><dt>yearOfBirth</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="2" data-x="-541.9494312399219" data-y="-372.8930459811755">
    <span class="caption">VisitOccurrence</span><dl class="properties"><dt>visitOccurrenceId</dt><dd>''</dd><dt>visitStartDate</dt><dd>''</dd><dt>visitEndDate</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="3" data-x="1478.0652952488292" data-y="-267.60673018804135">
    <span class="caption">Gender</span><dl class="properties"><dt>genderConceptId</dt><dd>''</dd><dt>genderConceptName</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="4" data-x="1452.1155345429438" data-y="-785.8288615126163">
    <span class="caption">Race</span><dl class="properties"><dt>raceConceptId</dt><dd>''</dd><dt>raceConceptName</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="5" data-x="1478.0652952488292" data-y="-542.8533458865409">
    <span class="caption">Ethnicity</span><dl class="properties"><dt>ethnicityConceptId</dt><dd>''</dd><dt>ethnicityConceptName</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="6" data-x="371.4498876535569" data-y="210.14233223667327">
    <span class="caption">ConditionOccurrence</span><dl class="properties"><dt>conditionOccurrenceId</dt><dd>''</dd><dt>conditionStartDatetime</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="7" data-x="993.4215557793323" data-y="210.14233223667327">
    <span class="caption">Provider</span><dl class="properties"><dt>providerId</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="8" data-x="371.4498876535569" data-y="-267.60673018804135">
    <span class="caption">ProcedureOccurrence</span><dl class="properties"><dt>procedureOccurrenceId</dt><dd>''</dd><dt>procedureDatetime</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="9" data-x="371.4498876535569" data-y="-1215.4018924393797">
    <span class="caption">MeasurementOccurrence</span><dl class="properties"><dt>measurementId</dt><dd>''</dd><dt>measurementDate</dt><dd>''</dd><dt>operatorConceptId</dt><dd>''</dd><dt>operatorConceptName</dt><dd>''</dd><dt>valueAsNumber</dt><dd>''</dd><dt>valueAsConceptId</dt><dd>''</dd><dt>valueAsConceptName</dt><dd>''</dd><dt>unitConceptId</dt><dd>''</dd><dt>unitConceptName</dt><dd>''</dd><dt>rangeLow</dt><dd>''</dd><dt>rangeHigh</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="10" data-x="371.4498876535569" data-y="-785.8288615126163">
    <span class="caption">ObservationOccurrence</span><dl class="properties"><dt>observationId</dt><dd>''</dd><dt>observationDate</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="11" data-x="993.4215557793323" data-y="-1215.4018924393797">
    <span class="caption">ObservationPeriod</span><dl class="properties"><dt>observationPeriodId</dt><dd>''</dd><dt>observationPeriodStartDate</dt><dd>''</dd><dt>observationPeriodEndDate</dt><dd>''</dd></dl></li>
  <li class="node" data-node-id="18" data-x="-1216.2125511169465" data-y="-293.52861022949327">
    <span class="caption">Concept</span><dl class="properties"><dt>conceptId</dt><dd>"Integer"</dd><dt>conceptCode</dt><dd>"String"</dd><dt>conceptName</dt><dd>"String"</dd><dt>standardConcept</dt><dd>"Boolean"</dd><dt>invalidReason</dt><dd>"String"</dd><dt>validStartDate</dt><dd>"Date"</dd><dt>validEndDate</dt><dd>"Date"</dd></dl></li>
  <li class="node" data-node-id="19" data-x="-1704.3199870245867" data-y="-239.91677818979554">
    <span class="caption">Domain</span><dl class="properties"><dt>domainId</dt><dd>"Integer"</dd><dt>domainName</dt><dd>"String"</dd></dl></li>
  <li class="node" data-node-id="20" data-x="-1637.3317232132008" data-y="-542.8533458865409">
    <span class="caption">ConceptClass</span><dl class="properties"><dt>conceptClassId</dt><dd>"Integer"</dd><dt>conceptClassName</dt><dd>"String"</dd></dl></li>
  <li class="node" data-node-id="21" data-x="-1216.2125511169465" data-y="-740.1550006902107">
    <span class="caption">Vocabulary</span><dl class="properties"><dt>vacabularyId</dt><dd>"Integer"</dd><dt>vocabularyName</dt><dd>"String"</dd><dt>vocabularyReference</dt><dd>"String"</dd><dt>vocabularyVersion</dt><dd>"String"</dd></dl></li>
  <li class="relationship" data-from="1" data-to="0">
    <span class="type">HAS_DRUG_EXPOSURE</span>
  </li>
  <li class="relationship" data-from="0" data-to="2">
    <span class="type">ASSOCIATED_DURING_VISIT</span>
  </li>
  <li class="relationship" data-from="1" data-to="2">
    <span class="type">HAS_VISIT_OCCURRENCE</span>
  </li>
  <li class="relationship" data-from="1" data-to="3">
    <span class="type">HAS_GENDER</span>
  </li>
  <li class="relationship" data-from="1" data-to="4">
    <span class="type">HAS_RACE</span>
  </li>
  <li class="relationship" data-from="1" data-to="5">
    <span class="type">HAS_ETHNICITY</span>
  </li>
  <li class="relationship" data-from="1" data-to="6">
    <span class="type">HAS_CONDITION_OCCURRENCE</span>
  </li>
  <li class="relationship" data-from="6" data-to="2">
    <span class="type">ASSOCIATED_DURING_VISIT</span>
  </li>
  <li class="relationship" data-from="1" data-to="8">
    <span class="type">HAS_PROCEDURE_OCCURRENCE</span>
  </li>
  <li class="relationship" data-from="8" data-to="2">
    <span class="type">ASSOCIATED_DURING_VISIT</span>
  </li>
  <li class="relationship" data-from="1" data-to="9">
    <span class="type">HAS_MEASUREMENT</span>
  </li>
  <li class="relationship" data-from="9" data-to="2">
    <span class="type">ASSOCIATED_DURING_VISIT</span>
  </li>
  <li class="relationship" data-from="1" data-to="10">
    <span class="type">HAS_OBSERVATION_OCCURRENCE</span>
  </li>
  <li class="relationship" data-from="10" data-to="2">
    <span class="type">ASSOCIATED_DURING_VISIT</span>
  </li>
  <li class="relationship" data-from="1" data-to="11">
    <span class="type">HAS_OBSERVATION_PERIOD</span>
  </li>
  <li class="relationship" data-from="7" data-to="2">
    <span class="type">ASSOCIATED_WITH</span>
  </li>
  <li class="relationship" data-from="7" data-to="6">
    <span class="type">CAPTURED</span>
  </li>
  <li class="relationship" data-from="7" data-to="0">
    <span class="type">INITIATED</span>
  </li>
  <li class="relationship" data-from="7" data-to="8">
    <span class="type">RESPONSIBLE_FOR</span>
  </li>
  <li class="relationship" data-from="7" data-to="9">
    <span class="type">RESPONSIBLE_FOR</span>
  </li>
  <li class="relationship" data-from="7" data-to="10">
    <span class="type">RESPONSIBLE_FOR</span>
  </li>
  <li class="relationship" data-from="9" data-to="18"></li>
  <li class="relationship" data-from="10" data-to="18"></li>
  <li class="relationship" data-from="8" data-to="18"></li>
  <li class="relationship" data-from="6" data-to="18"></li>
  <li class="relationship" data-from="0" data-to="18"></li>
  <li class="relationship" data-from="2" data-to="18"></li>
  <li class="relationship" data-from="18" data-to="19">
    <span class="type">IN_DOMAIN</span>
  </li>
  <li class="relationship" data-from="18" data-to="20">
    <span class="type">BELONGS_TO_CLASS</span>
  </li>
  <li class="relationship" data-from="18" data-to="21">
    <span class="type">USES_VACABULARY</span>
  </li>
  <li class="relationship" data-from="20" data-to="18">
    <span class="type">HAS_CONCEPT</span>
  </li>
  <li class="relationship" data-from="21" data-to="18">
    <span class="type">HAS_CONCEPT</span>
  </li>
  <li class="relationship" data-from="19" data-to="18">
    <span class="type">HAS_CONEPT</span>
  </li>
  <li class="relationship" data-from="18" data-to="18"></li>
</ul>
```
