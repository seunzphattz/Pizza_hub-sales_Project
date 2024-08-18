--OVERVIEW OF ALL SALES MADE BY PIZZA_HUB--
Select *
from pizza_hub

-- Total Revenue --
Select sum(total_price) as Total_Revenue
from pizza_hub;

-- Average_order_amount--
Select sum(total_price)/ count(distinct order_id) as Average_order_amount
from pizza_hub;

--Total pizza sold--
Select sum(quantity) as Total_pizza_sold
from pizza_hub;

--Total pizza ordered--
Select count(distinct order_id) as total_order
from pizza_hub

-- Average pizza per order--
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_pizza_per_order
from pizza_hub

--Total order by day--
Select datename(dw, order_date) as order_day, count(distinct order_id) as count_of_order
from pizza_hub
group by datename(dw, order_date) 
order by 

-- Total order by Month--
Select datename(month, order_date) as order_day, count(distinct order_id) as count_of_order
from pizza_hub
group by datename(month, order_date) 
order by count(distinct order_id) desc

--Percentage of sales by category

Select pizza_category, sum(total_price) * 100/(select sum(total_price) from pizza_hub) as total_sales
from pizza_hub
group by pizza_category
order by pizza_category desc

--Percentage order by pizza size--
select pizza_size, sum(total_price) *100/(select sum(total_price) from pizza_hub) as percent_based_size
from pizza_hub
group by pizza_size

--Top 5 Best sellers by Revenue--
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_hub
group by pizza_name
order by total_revenue desc

--bottom 5 Best sellers by Revenue--
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_hub
group by pizza_name
order by total_revenue asc

--Top 5 Best sellers by Quantity--
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_hub
group by pizza_name
order by total_quantity desc

--bottow 5 Best sellers by Quantity--
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_hub
group by pizza_name
order by total_quantity asc

--Top 5 Best sellers by total order--
select top 5 pizza_name, count(distinct order_id) as total_order
from pizza_hub
group by pizza_name
order by total_order desc

-- bottom 5 Best sellers by total order--
select top 5 pizza_name, count(distinct order_id) as total_order
from pizza_hub
group by pizza_name
order by total_order asc

