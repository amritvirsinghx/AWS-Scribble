## What is AWS Glue?
AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. You can create and run an ETL job with a few clicks in the AWS Management Console. You simply point AWS Glue to your data stored on AWS, and AWS Glue discovers your data and stores the associated metadata (e.g. table definition and schema) in the AWS Glue Data Catalog. Once cataloged, your data is immediately searchable, queryable, and available for ETL.

[Reference Link](https://aws.amazon.com/glue/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)

The below image shows integration of AWS Glue with other Amazon Services

![](https://docs.aws.amazon.com/athena/latest/ug/images/glue_architecture.png)

## AWS Glue offers the following capabilities:

- Integrated Data Catalog—a persistent metadata store that stores table definitions, job definitions, and other control information to help you manage the ETL process. Glue automatically creates partitions to make queries more efficient.
- Automatic schema discovery—Glue crawlers connect to your data, runs through a list of classifiers to determine the best schema for your data, and creates the appropriate metadata in the Data Catalog.
- Code generation—Glue automatically generates Scala or Python code, written for Apache Spark, to extract, transform, flatten, enrich, and load your data.
- Developer endpoints—Glue connects to your IDE and let you edit the auto-generated ETL scripts. Add custom readers, writers, or transformations as custom libraries.
- Job scheduler—Glue runs ETL jobs in parallel, either on a pre-scheduled basis, on-demand, or triggered by an event. It lets you define dependencies to build complex ETL processes
