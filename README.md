AWS RDS SQL Server – DBA Hands-On Project
📌 Project Overview

This project demonstrates hands-on experience administering SQL Server on AWS RDS using a cloud-only approach.
The focus is on networking, security, connectivity validation, user management, and backup/restore operations, following real DBA best practices.

🎯 Objectives

Deploy a SQL Server database on AWS RDS

Secure access using Security Groups and IP restrictions

Validate network connectivity before authentication

Connect remotely using SQL Server Management Studio (SSMS)

Manage databases, users, and permissions

Perform backup and restore using RDS snapshots

🛠️ Tools & Technologies

Amazon RDS (SQL Server Express)

AWS Security Groups

SQL Server Management Studio (SSMS)

PowerShell (Test-NetConnection)

GitHub

🧱 Architecture

Local Windows machine (SSMS & PowerShell)

AWS RDS SQL Server instance (us-east-1)

Security Group allowing TCP 1433 from a trusted IP only

🔐 Security Configuration

Public access enabled for administrative purposes

Inbound traffic restricted to port 1433 and single public IP (/32)

Dedicated master user for administration

No use of the default sa account

🌐 Network Connectivity Validation

TCP connectivity was validated before authentication using PowerShell:

Test-NetConnection contadb.cup2scm2ywmt.us-east-1.rds.amazonaws.com -Port 1433


Result:

TcpTestSucceeded : True

🧑‍💻 Database Administration
CREATE DATABASE cloud_admin_db;
GO

USE cloud_admin_db;
GO

CREATE TABLE clients (
    id INT IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);

👤 User & Permission Management

A read-only user was created following least-privilege principles:

CREATE LOGIN readonly_user WITH PASSWORD = 'Strong#Pass2026';
GO

USE cloud_admin_db;
CREATE USER readonly_user FOR LOGIN readonly_user;
EXEC sp_addrolemember 'db_datareader', 'readonly_user';

💾 Backup & Restore

Automated backups enabled in AWS RDS

Manual snapshot created

Snapshot restored to a new RDS instance

Data integrity validated after restore

🧠 Key DBA Learnings

Always validate network connectivity before authentication

Security Groups act as the primary firewall

Passwords cannot be viewed, only reset

AWS manages the database engine in RDS

Snapshots are the correct backup mechanism in RDS

🚀 Future Improvements

Enable Multi-AZ deployment

Add CloudWatch alarms

Simulate on-premises to AWS migration

Cost optimization analysis

👤 Author

Miguel Fuentes
AWS / SQL


Server DBA – Hands-on Projects









