-- +micrate Up
CREATE TABLE servers (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  region VARCHAR,
  users INT,
  bot_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX server_bot_id_idx ON servers (bot_id);

-- +micrate Down
DROP TABLE IF EXISTS servers;
