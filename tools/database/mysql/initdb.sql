DROP DATABASE IF EXISTS rms_database;
CREATE DATABASE rms_database;
CREATE USER rms_user IDENTIFIED BY 'rms_password';
GRANT ALL PRIVILEGES ON rms_user.* TO ucsf_rap IDENTIFIED BY 'rms_password';

USE rms_database;
