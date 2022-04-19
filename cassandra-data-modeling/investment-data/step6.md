Find all trades for account `joe001`; order by trade date (desc):

<details>
  <summary>Solution</summary>
```
SELECT account, 
       TODATE(DATEOF(trade_id)) AS date, 
       trade_id, type, symbol,
       shares, price, amount 
FROM trades_by_a_d
WHERE account = 'joe001';
```{{execute}}
</details>

