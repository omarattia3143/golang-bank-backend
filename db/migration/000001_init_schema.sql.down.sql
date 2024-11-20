-- Drop dependent objects first
DROP TABLE IF EXISTS entries CASCADE;
DROP TABLE IF EXISTS transfers CASCADE;

-- Now drop the accounts table
DROP TABLE IF EXISTS accounts CASCADE;
