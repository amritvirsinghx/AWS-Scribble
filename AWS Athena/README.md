# What is AWS Athena?

Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to manage, and you pay only for the queries that you run.
Athena is easy to use. Simply point to your data in Amazon S3, define the schema, and start querying using standard SQL. Most results are delivered within seconds. With Athena, there’s no need for complex ETL jobs to prepare your data for analysis. This makes it easy for anyone with SQL skills to quickly analyze large-scale datasets.

[Reference Link](https://aws.amazon.com/athena/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)

![](https://www.holistics.io/blog/content/images/2020/07/Athena-1.png)

## Features of Athena:
- Athena is a query service that uses standard SQL
- Uses data stored as objects on Amazon S3
- Has no infrastructure to manage
- You only pay only for the queries you run
- Based on Facebook Presto, an open source distributed SQL query engine
- Supports CSV, JSON, Gzip files and columnar formats like Apache Parquet
- Performance scales automatically based on query profilin

## Why use Athena?
- Scale — Athena scales automatically — executing queries in parallel — so results are fast, even with large datasets and complex queries.
- Security — Data is encrypted using Server-Side AES-256 Encryption with Amazon S3 or AWS Key Management Service (KMS).
- Performance — Athena automatically executes queries in parallel to make sure that most results come back within seconds.
- Cost — Pay only for the queries that you run without storage charges beyond S3. Reduce cost and improve performance by converting your data to a columnar format.
- Flexibility — Athena uses Presto and works with CSV, JSON, ORC, Avro, and Parquet. S3 is its underlying data store, making your data highly available and durable.
- Operations — Did we mention Athena is serverless? You can quickly query your data without having to set up and manage any servers or data warehouses.
