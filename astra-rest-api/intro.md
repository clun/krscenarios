REST stands for Representational State Transfer. The RESTful API style is a popular way of using standard HTTP commands like POST, PUT, GET, DELETE, and others to support exchange of data, using formats such as JSON. This style of interface promotes a clean separation between implementation of clients and servers.  

The [Stargate](https://stargate.io) open source project provides an API layer that allows you to expose a REST API on top of any Cassandra database. When the Stargate REST API is added to an existing Cassandra deployment, it automatically creates HTTP endpoints that allow you to perform create, read, update, and delete (CRUD) operations on tables in your database. You can also create new database tables directly via the API.

Astra DB now offers offers a REST API via Stargate, which we explore in this scenario.

We'll use the Astra DB REST API to:
- **Create** a table and a record
- **Read** the record from the table
- **Update** the record
- **Delete** the record

As a prerequisite, be sure to setup an Astra account and create a Cassandra as a Service database at [astra.datastax.com](https://astra.datastax.com/register?utm_source=devplay&utm_medium=katacoda&utm_campaign=astra-core-course).

This is fun and easy!
We'll show you how.

_This scenario is also available on our [datastax.com/dev](https://www.datastax.com/dev/rest) site, where you can find many more resources to help you succeed with Apache Cassandra™._
