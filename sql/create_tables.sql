USE cloud_admin_db;
GO

CREATE TABLE clients (
    id INT IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);