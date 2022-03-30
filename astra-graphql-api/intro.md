GraphQL is an open-source data query and manipulation language for APIs that allows clients to understand the data that your APIs expose and ask for only the portions they want. With GraphQL, you can create applications and services to aggregate data from multiple services or data stores. The [Stargate](https://stargate.io) open source project provides an API layer that allows you to expose a GraphQL API on top of any Cassandra database. Astra DB now offers offers a GraphQL API via Stargate, which we explore in this scenario.

We'll use the GraphQL API to:
- **Create** tables and records
- **Read** records from the tables
- **Update** records
- **Delete** records

As a prerequisite, be sure to setup an Astra account and create a Cassandra as a Service database at [astra.datastax.com](https://astra.datastax.com/register?utm_source=devplay&utm_medium=katacoda&utm_campaign=astra-core-course).

GraphQL is great stuff! Let's take a look.

_This scenario is also available on our [datastax.com/dev](https://www.datastax.com/dev/graphql) site, where you can find many more resources to help you succeed with Apache Cassandra™._
