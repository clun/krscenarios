Built around JSON-like documents, document model databases are both natural and flexible for developers to work with.

The [Stargate](https://stargate.io) open source project provides an API layer that allows you to expose a document-style API on top of any Cassandra database.

Astra DB now offers a Document API via Stargate, which allows you to use your Astra DB database as a document database. Create collections, add documents and modify them within your database.

In this scenario we will:
* Create a new collection and add a document
* Read the document back from the database
* Read a subdocument from the database
* Update a document
* Replace a subdocument
* Delete a document from the database

#### Before we begin
As a prerequisite, be sure to setup an Astra account and create a Cassandra as a Service database at [astra.datastax.com](https://astra.datastax.com/register?utm_source=devplay&utm_medium=katacoda&utm_campaign=astra-core-course).

Let's get started with Stargate Document API on Astra DB!

_This scenario is also available on our [datastax.com/dev](https://www.datastax.com/dev/documents-api) site, where you can find many more resources to help you succeed with Apache Cassandra™._
