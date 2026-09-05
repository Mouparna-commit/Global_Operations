This project simulates a real-world Business Intelligence solution for a global operations environment similar to Warranty Application. 
The objective is to design and implement an end-to-end data pipeline that transforms raw operational data into actionable insights for Warranty /Claims Analytics. 

The solution demonstrates how data can be ingested, transformed, modeled, and visualized to support decision-making across supplier parts procurement, claims created against each part, and reimbursement from suppliers.

**Architecture** 
The solution follows a modern Lakehouse architecture using Azure Databricks:

Bronze Layer: Raw ingestion of source data with ingestion metadata (timestamp, batch_id, source). No Transformation 
Silver Layer: Data cleansing, transformation, and standardization,removal of Null values, conforming to Business Rules, deduplication, conforming to data formats. Bad Data or Data not following the data quality checks are captured in a separate /quarantine table , which are then later reconciled by an analyst and conformed to data quality checks. 
Gold Layer: Cleansed and governed data layer, Dimensional modeling (fact and dimension tables) optimized for analytics and reporting.

**Data Model**

A star schema is implemented in the Gold layer:

Fact_Claims (grain: one row per claim) — Date, Claim_count, Claim_Amount, FKs to Account_id and Product_id
Account — standard dimension, N:1 from Fact_Claims
Product — standard dimension, N:1 from Fact_Claims
Parts — bridge table (Claim_Id, Part_Id, Part_cd, Supplier_id) — resolves the many-to-many between claims and parts
Suppliers — dimension of the Parts bridge only, not directly of Fact_Claims 

This model enables efficient querying and supports scalable BI reporting.
