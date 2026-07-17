
select gender , SUM(purchase_amount) as revenue
from customer
group by gender

select customer_id ,purchase_amount 
from customer
where discount_applied='Yes' and purchase_amount>=(select AVG(purchase_amount) from customer)

select item_purchased ,AVG ( review_rating) as " Average Product Rating "
from customer
group by item_purchased 
order by avg(review_rating) desc
limit 5;

select shipping_type, AVG(purchase_amount)
from customer
where shipping_type in ('Standard','Express')
group by shipping_type

select subscription_status, 
COUNT(customer_id) as total_customers,
AVG( purchase_amount) as avg_spend ,
SUM(purchase_amount) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc; 
select item_purchased ,
ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0)/COUNT(*)*100,2) as purchase_rate
from customer 
group by item_purchased
order by discount_rate desc
limit 5 ;

with customer_type as(
select customer_id,previous_purchases,
CASE 
WHEN previous_purchases =1 THEN 'NEW'
WHEN previous_purchases BETWEEN 2 and 10 THEN 'Returning'
ELSE 'Loyal'
END AS customer_segment
from customer
)

select customer_segment , count(*) as 'Number of Customers')
from customer_type
group by customer_segment

with item_counts as (
select category,
item_purchased,
COUNT(customer_id) as total_orders
ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
from customer 
group by category , item_purchased
)

select item_rank , category ,item_purchased , total_orders
from item_counts
where item_rank <=3;

select subscription_status,
count(customer_id) as repeat_buyers
from customer 
group by subscription_status

select age_group ,
SUM(purchase_amount) as total_revenue
from customer
group by age_group 
order by total_revenue desc;


}




 
