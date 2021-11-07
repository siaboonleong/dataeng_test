# DSAID Data Engineering Technical Test

cd path to where you downloaded the Section 2 folder 
run "docker-compose up"

ERD diagram saved as ERD.png

run docker psql command to execute the sql statements

SQL Statements for the 2 questions as below :

I want to know the list of our customers and their spending.

SELECT
	cus.first_name,
	cus.last_name,
	txt.quantity,
	car.price,
	(txt.quantity*car.price) as total
FROM
	public."Customer" cus
INNER JOIN public."transaction" txt
    ON txt.customer_id = cus.id
INNER JOIN  public."Car" car ON txt.car_id = car.id;

I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.

SELECT
	manu.name,
	sum(txt.quantity ) as total_quantity,
	sum(txt.quantity*car.price) as total_price
	 
FROM
	public."transaction" txt
INNER JOIN  public."Car" car ON txt.car_id = car.id
Inner Join public."manufacturer" manu on manu.id = car.manu_id
WHERE EXTRACT(MONTH FROM txt.date)= EXTRACT(MONTH FROM CURRENT_DATE)
Group by manu.name
order by total_quantity desc 
Limit 3
