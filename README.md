# DSA-SQL-Capstone-Project
## Project topic: Kultra Mega Stores Inventory Analysis
### Project Overview
     This Analysis is to derive actionable business insights for KMS’s Abuja division by analyzing historical 
     order data (2009–2012) using SQL.  The focus is on identifying high-performing products, customers, 
     shipping methods, and regions, and recommending strategies to boost revenue and optimize operations.
### Data Source
     Excel CSV files containing order data from 2009 to 2012 and Status.
### Tools Used
    - MS Excel for Data Collection
    - Primary Tool: Microsoft SQL Server (for Data Cleaning, Querying and Analysis)
### Data Cleaning and Preparation
    - Data loading and inspection
    - Handling Missing Variables
    - Data cleaning and formating
### Data Modelling
     - Connected two tables together
### Exploratory Data Analysis
     1. Which product category had the highest sales
     2. What are the Top 3 and Bottom 3 regions in terms of sales
     3. What were the the total sales of appliances in Ontario
     4. KMS incurred the most shipping cost using which shipping method
     5. Who are the most valuable customers, and what products or services do they typically purchase
     6. Which small business customer had the highest sales
     7. Which corporate customer placed the most number of orders in 2009-2012
     8. Which consumer customer was the most profitable one
     9. Which customer returned items and what segment do they belong to
     10. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensiveone, do you think the company appropriately              spent shipping costs based on the order priority
### Data Analysis
     This where  i include my query

     ````SQL
      create Database PROJECT

```EXEC sp_rename 'KSM Sql','KSM_Sql'


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


select TOP 1 Ship_Mode,
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



```

### Results

![SQL Question 1](https://github.com/user-attachments/assets/5227cee7-bb90-47fd-8c0d-4cce3fede4dc)


![SQL Question 2](https://github.com/user-attachments/assets/d94824ae-8599-4c55-9236-f10d09e7a719)


![SQL Question 2b](https://github.com/user-attachments/assets/46eada37-4087-45f4-9a88-9fd52efc1ba7)


![SQL Question 3](https://github.com/user-attachments/assets/7a2260a0-e4f6-4555-a667-168d586b8629)


![SQL Qestion 4](https://github.com/user-attachments/assets/2b7728ae-79c1-42ff-bc7f-5312b4a8c30a)


![SQL Question 5](https://github.com/user-attachments/assets/4e9c0ccf-8db3-447e-a8bc-5b5fefa5e6fd)


![SQL Question 6](https://github.com/user-attachments/assets/e8c1f704-8645-4bac-a23e-c454d5e9c657)


![SQL QUESTION 7](https://github.com/user-attachments/assets/f1bb5c63-0ef0-42aa-8ab4-37f3bdeeb1ed)


![SQL Question 8](https://github.com/user-attachments/assets/6229485d-f167-415f-8d02-9dcb3a65e5d0)


![SQL Question 9](https://github.com/user-attachments/assets/aba8dd8d-ee0e-4ede-984f-b8a2cd57e6fb)


![SQL Question 10](https://github.com/user-attachments/assets/37b97426-09e4-4c1d-bbef-6aa4987493ed)


![SQL Question 11](https://github.com/user-attachments/assets/62763d61-dbd3-4d08-a3fc-31fc66a97643)
### Findings
    1.The Product categort that had the highest sales was Technologt with the Total Sales of #5,984,248.183
    - Action: Focus marketing and inventory on this category in Abuja to drive growth.
    2.The TOP 3 regions in term of sales are West,Ontario and Praries in descending order
      The Bottom 3 regions in term of sales are Nunavut, North West Territories and Yukon in ascending order
      - Action: launch local promotions or review pricing.
   3. Total Appliance Sales in Ontario was #202,346.840
   4. 


### Recommendation
   - Revenue Growth: Launch targeted marketing for low-tier customers using identified trends.

   - Cost Efficiency: Optimize shipping spend by aligning shipping mode more strictly with order priority.

   - Product Strategy: Expand inventory in best-selling categories and regions.

   - Customer Loyalty: Retain high-profit consumers with incentives and account management.





     


     

     













  
    
