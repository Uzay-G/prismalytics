-- +micrate Up
CREATE TABLE commands (
  id BIGSERIAL PRIMARY KEY,
  command VARCHAR,
  occurences INT,
  bot_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX command_bot_id_idx ON commands (bot_id);

-- +micrate Down
DROP TABLE IF EXISTS commands;
