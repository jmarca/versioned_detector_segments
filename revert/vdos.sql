-- Revert versioned_detector_segments:vdos from pg

BEGIN;

DROP SEQUENCE tempseg.versioned_detector_ordering_sequence_id_seq;

COMMIT;
