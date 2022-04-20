Create table `accounts_by_user`:
```sql
CREATE TABLE accounts_by_user (
  username TEXT,
  account_number TEXT,
  cash_balance DECIMAL,
  name TEXT STATIC,
  PRIMARY KEY ((username),account_number)
);
```{{execute}}

Create table `positions_by_account`:
```sql
CREATE TABLE positions_by_account (
  account TEXT,
  symbol TEXT,
  quantity DECIMAL,
  PRIMARY KEY ((account),symbol)
);
```{{execute}}

Create table `trades_by_a_d`:
```sql
CREATE TABLE trades_by_a_d (
  account TEXT,
  trade_id TIMEUUID,
  type TEXT,
  symbol TEXT,
  shares DECIMAL,
  price DECIMAL,
  amount DECIMAL,
  PRIMARY KEY ((account),trade_id)
) WITH CLUSTERING ORDER BY (trade_id DESC);
```{{execute}}

Create table `trades_by_a_td`:
```sql
CREATE TABLE trades_by_a_td (
  account TEXT,
  trade_id TIMEUUID,
  type TEXT,
  symbol TEXT,
  shares DECIMAL,
  price DECIMAL,
  amount DECIMAL,
  PRIMARY KEY ((account),type,trade_id)
) WITH CLUSTERING ORDER BY (type ASC, trade_id DESC);
```{{execute}}

Create table `trades_by_a_std`:
```sql
CREATE TABLE trades_by_a_std (
  account TEXT,
  trade_id TIMEUUID,
  type TEXT,
  symbol TEXT,
  shares DECIMAL,
  price DECIMAL,
  amount DECIMAL,
  PRIMARY KEY ((account),symbol,type,trade_id)
) WITH CLUSTERING ORDER BY (symbol ASC, type ASC, trade_id DESC);
```{{execute}}

Create table `trades_by_a_sd`:
```sql
CREATE TABLE trades_by_a_sd (
  account TEXT,
  trade_id TIMEUUID,
  type TEXT,
  symbol TEXT,
  shares DECIMAL,
  price DECIMAL,
  amount DECIMAL,
  PRIMARY KEY ((account),symbol,trade_id)
) WITH CLUSTERING ORDER BY (symbol ASC, trade_id DESC);
```{{execute}}