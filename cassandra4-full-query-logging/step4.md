Previously, you enabled full query logging for a Cassandra node using *nodetool*, but the logging will not remain enabled when the node is restarted unless you edit the `cassandra.yaml` file. In this step, you will learn how to configure some of the properties full query logging. 

Click to open the `/usr/share/cassandra/conf/cassandra.yaml`{{open}} file in the editor.

Add the YAML configuration to enable full query logging:
<pre class="file" data-filename="/etc/cassandra/cassandra.yaml">full_query_logging_options:</pre>
<pre class="file" data-filename="/etc/cassandra/cassandra.yaml">    log_dir: /tmp/fqllogs</pre>


# Configurable Properties
Here are the configurable properties for full query logging:

- `log_dir`: Enable full query logging by setting this property to an existing directory location.
- `roll_cycle`: Sets the frequency at which log segments are rolled - DAILY, HOURLY (the default), or MINUTELY.
- `block`: Determines whether writes to the full query log will block query completion if full query logging falls behind, defaults to true.
- `max_queue_weight`: Sets the maximum size of the in-memory queue of full query logs to be written to disk before blocking occurs, defaults to 256 MiB. 
- `max_log_size`: Sets the maximum size of full query log files on disk (default 16 GiB). After this value is exceeded, the oldest log file will be deleted.
- `archive_command`: Optionally, provides a command that will be used to archive full query log files before deletion.
- `max_archive_retries`: Sets a maximum number of times a failed archive command will be retried (defaults to 10)

# Summary

In this step, you learned how to enable full query logging in the `cassandra.yaml` file and explored the configurable properties of full query logging. 


