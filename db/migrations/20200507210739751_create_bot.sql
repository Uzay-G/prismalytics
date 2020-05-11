-- +micrate Up
CREATE TABLE bots (
  id BIGSERIAL PRIMARY KEY,
  token VARCHAR,
  name VARCHAR,
  user_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX bot_user_id_idx ON bots (user_id);

-- +micrate Down
DROP TABLE IF EXISTS bots;
