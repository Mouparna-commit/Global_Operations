Alter Table Global_Operations.dbo.practice_01
drop column last_updated_ts ; 

Alter Table global_Operations.dbo.Practice_01
Add last_updated_ts datetime2; 

insert into Global_Operations.dbo.practice_01
(order_id, customer_id, order_status, order_date, total_amount, last_updated_ts, ingest_batch_id)
values(1003,003, 'Cancelled', '2025-01-13', 200.00, '2025-01-13 11:30:00', 105); 

select * 
from Global_Operations.dbo.practice_01; 

/* Write a SQl Query to find the following 
 one Row per Order id
 the most recent record based on timestamp
 if there is a tie on last_updated_ts, then pick the row with highest ingest_batch_id
 */

 with T1 as (select order_id , 
 customer_id, 
 order_status, 
 order_date, 
 total_amount, 
 last_updated_ts, 
 ingest_batch_id, 
 row_number() over (partition by order_id order by last_updated_ts desc, ingest_batch_id desc )  as rn
 from Global_operations.dbo.practice_01) 

 select * 
 from  
 T1
 where T1.rn = 1
 order by order_id ; 

 ---- Fact table : fact_order_fulfillment ---- 
 Create table Global_Operations.dbo.Fact_order_fulfillment 
 (order_id numeric(10), 
 order_date_key date, 
 ship_date_key date, 
 order_amount numeric(10), 
 cycle_time datetime) ; 

 


 
