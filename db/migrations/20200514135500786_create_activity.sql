-- +micrate Up
CREATE TABLE activities (
  id BIGSERIAL PRIMARY KEY,
  value INT,
  bot_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX activity_bot_id_idx ON activities (bot_id);

-- +micrate Down
DROP TABLE IF EXISTS activities;
