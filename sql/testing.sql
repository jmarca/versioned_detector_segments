with unique_segment_matched as (
     select distinct components[2] as did
     from tempseg.versioned_detector_segment_geometry vdsg
)
select count(*) from unique_segment_matched;





with unique_detectors as (
    select distinct detector_id::varchar
    from tempseg.tdetector
)
select count(*) from unique_detectors;



with unique_segment_matched as (
     select distinct components[2] as did
     from tempseg.versioned_detector_segment_geometry vdsg
),
unique_detectors as (
    select distinct detector_id::varchar
    from tempseg.tdetector
)
select aa.detector_id,b.did
from unique_detectors aa
left outer join unique_segment_matched b
  on (aa.detector_id = b.did)
order by aa.detector_id,b.did;
