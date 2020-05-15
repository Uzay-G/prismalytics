-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE activities ADD COLUMN servers integer;
-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE servers DROP COLUMN servers;