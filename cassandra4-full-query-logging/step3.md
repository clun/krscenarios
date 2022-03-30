In this step, you will use *fqltool* to read the contents of a full query log. 

Let's use the `fqltool dump` command, pointing it to the directory we set up previously to store our full query logs. 

```
fqltool dump /tmp/fqllogs
```{{execute}}

To see more about the different options for the `dump` command, use the help:

```
fqltool help dump
```{{execute}}

To see what other 'cqltool' commands are allowed, try:

```
fqltool help 
```{{execute}}

# Summary

In this step, you used *fqltool* to view the contents of a full query log.