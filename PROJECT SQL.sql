create Database PROJECT

EXEC sp_rename 'KSM Sql','KSM_Sql'


alter table KSM_Sql
alter column Profit decimal (10,2)

alter table KSM_Sql
alter column Unit_Price decimal (10,2)

alter table KSM_Sql
alter column Shipping_Cost decimal(10,2)

alter table KSM_Sql
alter column Discount decimal (10,2)

alter table KSM_Sql
alter column Sales decimal (10,3)


select * from KSM_Sql

---Question (1). Which product category had the highest sales?
select Top 1 Product_Category,
   sum(Sales) as Total_Sales
from KSM_Sql
group by Product_Category
order by Total_Sales desc




----Question (2). What are the Top3 and Bottom 3 Regions in term of Sales

select Top 3 Region,
   sum(Sales) as Total_Sales
from KSM_Sql
group by Region
order by Total_Sales desc



select Top 3 Region,
   sum(Sales) as Total_Sales
from KSM_Sql
group by Region
order by Total_Sales asc



 -----Question (3).  What were the total sales of appliances in Ontario

select Product_Sub_Category,Region,
   sum(Sales) as Total_Sales
from KSM_Sql

  where Product_Sub_Category = 'Appliances' 
  and Region = 'Ontario'
  group by Product_Sub_Category,Region

  


  ------Question (4). Advice the management of KMS on what to do to increase the revenue from the bottom 10 customer.


  select Top 10 Customer_Name,Customer_Segment,
     sum(Sales) as Revenue
from KSM_Sql
group by Customer_Name,Customer_Segment
order by Revenue Asc


---------Question (5).  KSM incurred the most shipping cost using which shipping method


select Ship_Mode,
    sum(Shipping_Cost) as Shipping_Cost
from KSM_Sql
group by Ship_Mode
order by Shipping_Cost desc


-----Question (6). Who are the most valuable customers, and what products or services do they typically purchase?

select TOP 10 Customer_Name,Product_Sub_Category,  
   sum(profit) as Total_Profit,
   sum(Order_Quantity) as Total_Order

from KSM_Sql
group by Customer_Name,Product_Sub_Category
order by Total_Profit Desc



   





----Question (7). Which small business customer had the highest sales

select Top 1 Customer_Name,Customer_Segment,
   sum(Sales) as Total_Sales
   from KSM_Sql
   where Customer_Segment = 'Small Business'
   group by Customer_Name,Customer_Segment
   order by Total_Sales desc



   -----Quetion (8). Which corporate customer placed the most number of order i 2009-2012?

   select TOP 1 Customer_Name,Customer_Segment,sum(Order_Quantity) as Total_Order
   from KSM_Sql
   where Customer_Segment = 'Corporate'
   and Order_Date between '2009/01/01' and '2021/12/31'
   group by Customer_Name,Customer_Segment
   order by Total_Order DESC




   ----Question (9). Which consumer customer was the most profitable one?


   select  TOP 1 Customer_Name,Customer_Segment,
   sum(Profit) as Total_Profit
   from KSM_Sql
   where Customer_Segment = 'consumer'
   group by Customer_Name,Customer_Segment
   order by Total_Profit desc


   ------Question (10). Which customer retuned items and what segment do they belong to

   
   SELECT DISTINCT K.Customer_Name, K.Customer_Segment, K.Product_Name, O.Status
FROM KSM_Sql K
JOIN Order_Status O ON K.Order_ID = O.Order_ID
WHERE O.Status = 'Returned';


----Question (11). If the delivery truck is the most economical but the slowest shipping method and Express Air
----is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the order priority

SELECT 
 Order_Priority,
  Ship_Mode,
  COUNT(*) AS Number_of_Orders
FROM 
  KSM_Sql
GROUP BY 
  Order_Priority, Ship_Mode
ORDER BY 
  Order_Priority, Number_of_Orders DESC;
