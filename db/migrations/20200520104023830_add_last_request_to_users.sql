-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE users add column last_request TIMESTAMP;
-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE users drop column last_request;