<ul class="graph-diagram-markup" data-internal-scale="0.87" data-external-scale="1">
  <li class="node" data-node-id="0" data-x="-796.3417450319076" data-y="488.7529779140516">
    <span class="caption">Provider</span><dl class="properties"><dt>id</dt><dd>0001</dd><dt>name</dt><dd>James</dd><dt>gender</dt><dd>Male</dd></dl></li>
  <li class="node" data-node-id="1" data-x="-1264.7610744645558" data-y="-846.5100968790343">
    <span class="caption">Person</span><dl class="properties"><dt>id</dt><dd>0001</dd><dt>gender</dt><dd>Female</dd></dl></li>
  <li class="node" data-node-id="2" data-x="552.9950710311263" data-y="350.88950906592675">
    <span class="caption">VisitOccurrence</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="3" data-x="-496.64474599724514" data-y="-1972.7090707124485">
    <span class="caption">ConditionOccurrence</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="4" data-x="-2685.855116098723" data-y="-846.5100968790343">
    <span class="caption">Observation</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="5" data-x="-2421.018884602557" data-y="-1658.9747000521513">
    <span class="caption">ObservationPeriod</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="6" data-x="-1460.1397711470759" data-y="-1972.7090707124485">
    <span class="caption">Measurement</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="7" data-x="-2421.018884602557" data-y="97.11397880397902">
    <span class="caption">DrugExposure</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="8" data-x="2115.5812878208067" data-y="310.98364988461464">
    <span class="caption">ProcedureOccurrence</span><dl class="properties"><dt>id</dt><dd>0001</dd></dl></li>
  <li class="node" data-node-id="9" data-x="640.7733422348801" data-y="-889.5975497346377">
    <span class="caption">Ethnicity</span><dl class="properties"><dt>ethnicity_concept_id</dt><dd>' '</dd><dt>ethnicity_concept_name</dt><dd>' '</dd><dt>ethnicity_source_value</dt><dd>' '</dd><dt>ethnicity_source_concept_id</dt><dd>' '</dd><dt>ethnicity_source_concept_name</dt><dd>' '</dd></dl></li>
  <li class="node" data-node-id="10" data-x="1359.507912588303" data-y="-1340.4412098150149">
    <span class="caption">Race</span><dl class="properties"><dt>race_concept_id</dt><dd>' '</dd><dt>race_concept_name</dt><dd>' '</dd><dt>race_source_value</dt><dd>' '</dd><dt>race_source_concept_id</dt><dd>' '</dd><dt>race_source_concept_name</dt><dd>' '</dd></dl></li>
  <li class="node" data-node-id="11" data-x="144.40948887529063" data-y="-1506.3866691164474">
    <span class="caption">Gender</span><dl class="properties"><dt>gender_concept_id</dt><dd>' '</dd><dt>gender_concept_name</dt><dd>' '</dd><dt>gender_source_value</dt><dd>' '</dd><dt>gender_source_concept_id</dt><dd>' '</dd><dt>gender_source_concept_name</dt><dd>' '</dd></dl></li>
  <li class="relationship" data-from="1" data-to="2">
    <span class="type">HAS_VIST_OCCURRENCE</span><dl class="properties"><dt>start_datetime</dt><dd>01-01-2090</dd><dt>end_datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="3">
    <span class="type">HAD_CONDITION_OCCURRENCE</span><dl class="properties"><dt>start_datetime</dt><dd>01-01-2090</dd><dt>end_datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="4">
    <span class="type">HAS_OBSERVATION</span><dl class="properties"><dt>datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="5">
    <span class="type">HAS_OBSERVATION_PERIOD</span><dl class="properties"><dt>datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="6">
    <span class="type">HAS_MEASUREMNET</span><dl class="properties"><dt>datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="7">
    <span class="type">HAS_DRUG_EXPOSURE</span><dl class="properties"><dt>start_datetime</dt><dd>01-01-2090</dd><dt>end_datetime</dt><dd>01-01-2090</dd></dl></li>
  <li class="relationship" data-from="1" data-to="9">
    <span class="type">HAS_ETHNICITY</span>
  </li>
  <li class="relationship" data-from="9" data-to="10">
    <span class="type">HAS_RACE</span>
  </li>
  <li class="relationship" data-from="1" data-to="11">
    <span class="type">HAS_GENDER</span>
  </li>
  <li class="relationship" data-from="2" data-to="8">
    <span class="type">HAS_PROCEDURE_OCCURRENCE</span><dl class="properties"><dt>datetime</dt><dd>01-01-2090</dd></dl></li>
</ul>
