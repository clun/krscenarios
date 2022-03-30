We've already downloaded Cassandra for you.

On node2, we'll edit the `cassandra.yaml` file



Change the initial_token value and set it to 9223372036854775807 (note you need a space between the colon and the value). This node will manage the second half of the token range--the positive tokens.
