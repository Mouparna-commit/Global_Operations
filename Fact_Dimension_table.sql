 ---- Fact table : fact_order_fulfillment ---- 
 Create table Global_Operations.dbo.Fact_order_fulfillment 
 (order_id numeric(10), 
 order_date_key date, 
 ship_date_key date, 
 order_amount numeric(10), 
 cycle_time datetime) ; 

 Alter table Global_Operations.dbo.Fact_order_fulfillment
 Add  
 Channel_id numeric(10), 
 Brand_id   numeric(10); 


 -------- Dimensions : Dim_Customer ---------
 Create table Global_Operations.dbo.dimension_Warehouse

 (Warehouse_id char(5), 
  Name Varchar(20),
  WHDCR datetime, 
  WHDLM datetime); 

  Alter table Global_Operations.dbo.dimension_Warehouse
  Add Add_info nchar(20),
      Add_info1 nchar(20), 
      Add_info2 nchar(20); 
  

  Select * 
  from Global_Operations.dbo.Fact_order_fulfillment; 

  Create table Global_operations.dbo.dimension_Brand
  (Brand_id numeric(10), 
   Brand_name nchar(30),
   BRDCR datetime, 
   BRDLM datetime) ; 
   
 


 
