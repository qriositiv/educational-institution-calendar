# Educational Institution Calendar — SQL implementation

The current School Calendar MySQL implementation is in [`sql/`](sql/). It
contains the 13-table schema, deterministic sample data, four active
functions, three stored procedures, three triggers, and executable checks.
The files already at the repository root are retained as an earlier laboratory
snapshot; use the `sql/` directory for the implementation documented in
laboratory work III.

From the repository root, create the database and run the demonstration checks:

```sh
mysql --commands -u root -p < sql/run_demo.sql
```

Alternatively, run `sql/run_all.sql` to create only the schema and program
objects. See [`sql/README.md`](sql/README.md) for the file layout and setup
order.
