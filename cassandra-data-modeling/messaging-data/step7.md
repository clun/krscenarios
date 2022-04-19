Find an attachment file with name `Budget.xlsx` for an email with id `8ae31dd0-d361-11ea-a40e-5dd6331dfc45`, assuming that the complete file is stored in one partition with chunk number `1`:

<details>
  <summary>Solution</summary>

```
SELECT filename, type, value,
       blobAsText(value)
FROM attachments
WHERE email_id = 8ae31dd0-d361-11ea-a40e-5dd6331dfc45
  AND filename = 'Budget.xlsx'
  AND chunk_number = 1;
```{{execute}}

</details>

Find an attachment file with name `Presentation.pptx` for an email with id `8ae31dd0-d361-11ea-a40e-5dd6331dfc45`, assuming that the three file chunks are stored across three partitions with chunk numbers `1`, `2` and `3`:

<details>
  <summary>Solution</summary>

```
SELECT filename, type, value,
       blobAsText(value)
FROM attachments
WHERE email_id = 8ae31dd0-d361-11ea-a40e-5dd6331dfc45
  AND filename = 'Presentation.pptx'
  AND chunk_number IN (1,2,3);
```{{execute}}

</details>