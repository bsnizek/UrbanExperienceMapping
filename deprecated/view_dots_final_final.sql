SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS dots_final_final;
CREATE MATERIALIZED VIEW dots_final_final AS

select

raw_dots.route_id,
dots_final.*

from dots_final, raw_dots

where raw_dots.guid=dots_final.guid;