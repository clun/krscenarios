Execute the CQL script to insert sample data:
```
SOURCE '~/investment_data.cql'
```{{execute}}

Retrieve all rows from table `accounts_by_user`:
```
SELECT * FROM accounts_by_user;        
```{{execute}}

Retrieve all rows from table `positions_by_account`:
```
SELECT * FROM positions_by_account;
```{{execute}}

Retrieve all rows from table `trades_by_a_d`:
```   
SELECT * FROM trades_by_a_d;                    
```{{execute}}

Retrieve all rows from table `trades_by_a_td`:
```
SELECT * FROM trades_by_a_td;
```{{execute}}

Retrieve all rows from table `trades_by_a_std`:
```
SELECT * FROM trades_by_a_std;       
```{{execute}}

Retrieve all rows from table `trades_by_a_sd`:
```
SELECT * FROM trades_by_a_sd;       
```{{execute}}