# DBMS Practical – College Database (MySQL)

SQL practical file: schema design, 25 prescribed queries, and database administration commands.

## Files
| File | Contents |
|---|---|
| `01_schema.sql` | Database and table creation (DDL) with PK, FK, UNIQUE and CHECK constraints |
| `02_sample_data.sql` | Sample rows for all five tables |
| `03_queries.sql` | The 25 prescribed queries (Q1–Q25) |
| `04_admin.sql` | Users, roles, GRANT/REVOKE, indexes |

## Schema
`STUDENT`, `COURSE`, `SOCIETY`, plus junction tables `ADMISSION` (Student–Course) and `ENROLLMENT` (Student–Society).

## How to run
Requires MySQL 8.0.16+ (CHECK constraints are enforced from that version).

```bash
mysql -u root -p < 01_schema.sql
mysql -u root -p < 02_sample_data.sql
mysql -u root -p < 03_queries.sql
mysql -u root -p < 04_admin.sql
```

## Author
Farzeen | 24019582078
