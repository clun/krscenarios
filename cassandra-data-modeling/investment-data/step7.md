Find all trades for account `joe001` and date range `2020-09-07` - `2020-09-11`; order by trade date (desc):

<details>
  <summary>Solution</summary>
```
SELECT account, 
       TODATE(DATEOF(trade_id)) AS date, 
       trade_id, type, symbol,
       shares, price, amount 
FROM trades_by_a_d
WHERE account = 'joe001'
  AND trade_id > maxTimeuuid('2020-09-07')
  AND trade_id < minTimeuuid('2020-09-12');
```{{execute}}
</details>


