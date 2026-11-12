# SQL scripts

The scripts are organized by database object and execution order.

- `00_database.sql` creates and selects the `school_calendar` database.
- `tables/` contains the 13 table definitions.
- `functions/` contains four read-only functions for classroom capacity and schedule availability.
- `procedures/` contains three stored procedures for class summaries, room capacity, and schedule availability.
- `triggers/` contains three triggers that validate lesson inserts and updates and assessment enrollment.
- `data/` contains deterministic mock data.
- `tests/` checks the functions, procedures, trigger rules, row counts, constraints, the lesson-time index, and DML/DDL operations.
- `run_all.sql` creates the schema and all ten stored objects.
- `run_demo.sql` creates the schema, loads mock data, and runs all checks.

Run the complete setup from the project root:

```sh
mysql --commands -u root -p < sql/run_all.sql
```

Then load the demonstration data and run the checks:

```sh
mysql --commands -u root -p < sql/run_demo.sql
```

The setup scripts create objects in dependency order. Run them against a new,
empty `school_calendar` database; they intentionally report duplicate objects
instead of silently replacing existing data.

The lesson-insert trigger calls `sp_check_schedule_slot` to reuse its teacher and class availability checks. The trigger tests include a separate room-only conflict case.
