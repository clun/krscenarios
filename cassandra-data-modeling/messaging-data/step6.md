Find all available information about an email with id `8ae31dd0-d361-11ea-a40e-5dd6331dfc45`:

<details>
  <summary>Solution</summary>
```
SELECT id, "to", "from",
       toTimestamp(id) AS timestamp,
       subject, body,
       attachments
FROM emails
WHERE id = 8ae31dd0-d361-11ea-a40e-5dd6331dfc45;
```{{execute}}
</details>

Notice the file names and sizes (measured in kilobytes) in column `attachments`. For more efficient retrieval, we can assume that larger files are split into 
chunks of 1000KB or less. For example, a 530KB file can be stored as one chunk, while a 2416KB file has to be stored using 3 chunks.  
