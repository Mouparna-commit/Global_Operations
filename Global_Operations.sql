Alter Table Global_Operations.dbo.practice_01
drop column last_updated_ts ; 

Alter Table global_Operations.dbo.Practice_01
Add last_updated_ts datetime2; 

insert into Global_Operations.dbo.practice_01
(order_id, customer_id, order_status, order_date, total_amount, last_updated_ts, ingest_batch_id)
values(1003,003, 'Cancelled', '2025-01-13', 200.00, '2025-01-13 11:30:00', 105); 

