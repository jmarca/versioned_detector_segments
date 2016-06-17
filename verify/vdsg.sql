-- Verify versioned_detector_segments:vdsg on pg

BEGIN;

select detector_id,components,refnum,direction,seggeom
from tempseg.versioned_detector_segment_geometry
where false;


ROLLBACK;
