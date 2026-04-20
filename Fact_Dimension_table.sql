  -------- Dimensions : Dim_Warehouse ---------
 CREATE TABLE Global_Operations.dbo.dim_warehouse (
    warehouse_id    CHAR(5) PRIMARY KEY,
    warehouse_name  VARCHAR(50),
    location        VARCHAR(50),
    created_date    DATETIME,
    last_modified   DATETIME
);
  
--- Brand Dimension ------
  CREATE TABLE Global_Operations.dbo.dim_brand (
    brand_id        INT PRIMARY KEY,
    brand_name      VARCHAR(50),
    created_date    DATETIME, 
    last_modified   DATETIME
);
---- Channel Dimension ----
CREATE TABLE Global_Operations.dbo.dim_channel (
    channel_id      INT PRIMARY KEY,
    channel_name    VARCHAR(50), -- e.g., E-commerce, Retail, Wholesale
    created_date    DATETIME,
    Last_modified   DATETIME
); 

---- Date Dimension -------
CREATE TABLE Global_Operations.dbo.dim_date (
    date_key        DATE PRIMARY KEY,
    year            INT,
    month           INT,
    day             INT,
    quarter         INT,
    day_of_week     VARCHAR(10)
);
 
 --- Fact Table Creation -----
CREATE TABLE Global_Operations.dbo.fact_order_fulfillment (
    order_id            BIGINT PRIMARY KEY,
    order_date_key      DATE,
    ship_date_key       DATE,
    warehouse_id        CHAR(5),
    brand_id            INT,
    channel_id          INT,
    
    order_amount        DECIMAL(12,2),
    cycle_time_days     INT,   -- Ship Date - Order Date
    
    CONSTRAINT fk_wh FOREIGN KEY (warehouse_id)
        REFERENCES Global_Operations.dbo.dim_warehouse(warehouse_id),
        
    CONSTRAINT fk_brand FOREIGN KEY (brand_id)
        REFERENCES Global_Operations.dbo.dim_brand(brand_id)
);

 
