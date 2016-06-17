-- Revert versioned_detector_segments:vdsg from pg

BEGIN;

DROP TABLE tempseg.versioned_detector_segment_geometry;

COMMIT;
