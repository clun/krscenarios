Shut down your node, delete the logs/system.log file, restart your node, then search for CommitLog.java in the new logs/system.log file. You may see lines reporting replays.

TODO add commands for this

If there were no commit log segments found during startup, no replay needs to be done. If Cassandra finds commit log files, it will replay the mutations in those files into memtables and then flush the memtables to disk.
