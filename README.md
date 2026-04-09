This project simulates a real-world Business Intelligence solution for a global operations environment similar to Supply Chain. 
The objective is to design and implement an end-to-end data pipeline that transforms raw operational data into actionable insights for order fulfillment
and supply chain performance.

The solution demonstrates how data can be ingested, transformed, modeled, and visualized to support decision-making across logistics, warehouse operations, and customer delivery performance.

#**Architecture** 
The solution follows a modern Lakehouse architecture using Azure Databricks:

Bronze Layer: Raw ingestion of source data with ingestion metadata (timestamp, batch_id, source)
Silver Layer: Data cleansing, transformation, and standardization
Gold Layer: Dimensional modeling (fact and dimension tables) optimized for analytics and reporting

**Data Model**

A star schema is implemented in the Gold layer:

Fact Table: fact_order_fulfillment
Measures: order amount, cycle time, shipment duration
Dimension Tables:
dim_customer
dim_date
dim_warehouse
dim_carrier

This model enables efficient querying and supports scalable BI reporting.
