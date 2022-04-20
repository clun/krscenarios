Execute the CQL script to insert sample data:
```sql
SOURCE '~/investment_data.cql'
```{{execute}}

Retrieve all rows from table `accounts_by_user`:
```sql
SELECT * FROM accounts_by_user;        
```{{execute}}

Retrieve all rows from table `positions_by_account`:
```sql
SELECT * FROM positions_by_account;
```{{execute}}

Retrieve all rows from table `trades_by_a_d`:
```sql
SELECT * FROM trades_by_a_d;                    
```{{execute}}

Retrieve all rows from table `trades_by_a_td`:
```sql
SELECT * FROM trades_by_a_td;
```{{execute}}

Retrieve all rows from table `trades_by_a_std`:
```sql
SELECT * FROM trades_by_a_std;       
```{{execute}}

Retrieve all rows from table `trades_by_a_sd`:
```sql
SELECT * FROM trades_by_a_sd;       
```{{execute}}