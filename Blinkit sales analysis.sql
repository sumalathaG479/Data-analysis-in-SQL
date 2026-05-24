UPDATE blinkit_data
set Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF','low fat') then'Low Fat'
when Item_Fat_Content='reg' then 'Regular'
else Item_Fat_Content
end;
select distinct Item_Fat_Content from blinkit_data
select * from blinkit_data;

select cast(AVG(`Total Sales`) as DECIMAL(10,2)) as Avg_Sales
from blinkit_data;

SELECT cast(sum(`Total Sales`)/1000000 as decimal(10,2)) as Total_Sales_Million
from blinkit_data
where `Outlet Establishment Year`=2022;

select cast(avg(`Rating`) as decimal(10,2)) as Avg_Rating
from blinkit_data;

select count(*) as No_of_items from blinkit_data;
SELECT cast(sum(`Total Sales`)/1000000 as decimal(10,2)) as Total_Sales_Million
from blinkit_data
where Item_Fat_Content = 'Low Fat';



select Item_Fat_Content ,sum(`Total Sales`)  as Total_Sales
from blinkit_data
group by Item_Fat_Content
order by Total_Sales DESC;

select `Outlet Location Type`,
       sum( 
	   case
       when Item_Fat_Content ='Low Fat' then `Total Sales`
       else 0
       end ) as Low_Fat,
       sum(
            case
            when Item_Fat_Content = 'Regular' then `Total Sales`
       else 0
       end ) as Regular
       from blinkit_data
       group by `Outlet Location Type`
       order by `Outlet Location Type`;
       
       select`Outlet Establishment Year` ,sum(`Total Sales`)
       from blinkit_data
       group by `Outlet Establishment Year` 
       order by `Outlet Establishment Year` desc;
       

select `Outlet Size`,sum(`Total Sales`) ,
round(sum(`Total Sales`)*100/
(select sum(`Total Sales`) from blinkit_data),2) as sales_percentage
from blinkit_data
group by `Outlet Size`
order by  sales_percentage desc;

select `Outlet Location Type`,sum(`Total Sales`)     
from blinkit_data
group by  `Outlet Location Type`
order by sum(`Total Sales`) desc
 

 select `Outlet Type`,
  cast( sum(`Total Sales`) as decimal (10,2)) AS total_sales,
    cast(avg(`Total Sales`) as decimal(10,2)) as avg_sales,
    cast(avg(`Rating`) as decimal(10,2)) as avg_rating,
	count(*) as no_of_items,
	cast(avg(`Item Visibility`) as decimal(10,2)) as avg_item_visibility
from blinkit_data
group by `Outlet Type`
order by total_Sales ;
	

