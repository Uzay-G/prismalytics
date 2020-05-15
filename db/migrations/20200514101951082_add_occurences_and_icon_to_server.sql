-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE servers ADD COLUMN icon varchar(40);
ALTER TABLE servers ADD COLUMN message_count integer; 
-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE servers DROP COLUMN icon;
ALTER TABLE servers DROP COLUMN message_count;