-- Verify versioned_detector_segments:vdos on pg

BEGIN;

SELECT pg_catalog.has_sequence_privilege('tempseg.versioned_detector_ordering_sequence_id_seq', 'usage');

ROLLBACK;
