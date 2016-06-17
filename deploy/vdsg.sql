-- Deploy versioned_detector_segments:vdsg to pg

BEGIN;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = tempseg, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE versioned_detector_segment_geometry (
    detector_id text,
    components text[] NOT NULL,
    refnum integer,
    direction text,
    seggeom public.geometry,
    CONSTRAINT enforce_dims_seggeom CHECK ((public.st_ndims(seggeom) = 2)),
    CONSTRAINT enforce_geotype_seggeom CHECK (((public.geometrytype(seggeom) = 'LINESTRING'::text) OR (seggeom IS NULL))),
    CONSTRAINT enforce_srid_seggeom CHECK ((public.st_srid(seggeom) = 4326))
);

--
-- Name: versioned_detector_segment_geometry_pkey; Type: CONSTRAINT; Schema: tempseg; Owner: slash; Tablespace:
--

ALTER TABLE ONLY versioned_detector_segment_geometry
    ADD CONSTRAINT versioned_detector_segment_geometry_pkey PRIMARY KEY (components,direction);


--
-- Name: tempseg_versioned_detector_segment_geometry_seggeom_idx; Type: INDEX; Schema: tempseg; Owner: slash; Tablespace:
--

CREATE INDEX tempseg_versioned_detector_segment_geometry_seggeom_idx ON versioned_detector_segment_geometry USING gist (seggeom);


COMMIT;
