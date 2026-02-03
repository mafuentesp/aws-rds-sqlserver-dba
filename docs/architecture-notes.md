# Architecture Notes – AWS RDS SQL Server DBA Project

## Overview
This document describes the architecture and design decisions for a cloud-only
SQL Server deployment on AWS RDS, focused on security, connectivity, and
operational best practices.

---

## Architecture Components

### Client Layer
- Local Windows machine
- SQL Server Management Studio (SSMS)
- PowerShell for network validation

Purpose:
- Remote administration
- Connectivity testing prior to authentication

---

### Database Layer
- Amazon RDS for SQL Server (Express Edition)
- Single-instance deployment (no replication)
- Region: us-east-1

Purpose:
- Managed relational database
- Reduced operational overhead
- Focus on DBA-level administration rather than engine maintenance

---

### Network & Security Layer
- AWS VPC (default)
- Dedicated Security Group attached to RDS instance
- Inbound rule:
  - TCP 1433 allowed only from a trusted public IP (/32)
- Outbound traffic allowed by default

Rationale:
- Apply the principle of least privilege
- Use Security Groups as the primary firewall mechanism

---

## Connectivity Design

- Database configured as publicly accessible for administrative access
- Exposure controlled strictly through Security Group rules
- TCP connectivity validated before SQL authentication using PowerShell:

```powershell
Test-NetConnection <rds-endpoint> -Port 1433
