CREATE LOGIN readonly_user WITH PASSWORD = 'Strong#Pass2026';
GO

USE cloud_admin_db;
CREATE USER readonly_user FOR LOGIN readonly_user;
EXEC sp_addrolemember 'db_datareader', 'readonly_user';
