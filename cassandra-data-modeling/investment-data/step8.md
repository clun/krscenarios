Find all trades for account `joe001`, date range `2020-09-07` - `2020-09-11` and transaction type `buy`; order by trade date (desc):

<details>
  <summary>Solution</summary>

```
SELECT account, 
       TODATE(DATEOF(trade_id)) AS date, 
       trade_id, type, symbol,
       shares, price, amount 
FROM trades_by_a_td
WHERE account = 'joe001'
  AND type = 'buy'
  AND trade_id > maxTimeuuid('2020-09-07')
  AND trade_id < minTimeuuid('2020-09-12');
```{{execute}}

</details>


