-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE bots ADD COLUMN prefix varchar(20); 
-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE bots DROP COLUMN prefix;