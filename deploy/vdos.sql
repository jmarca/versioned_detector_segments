-- Deploy versioned_detector_segments:vdos to pg

BEGIN;

CREATE SEQUENCE tempseg.versioned_detector_ordering_sequence_id_seq;

COMMIT;
