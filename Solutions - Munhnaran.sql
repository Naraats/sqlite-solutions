----Task1----
SELECT  c.product_name, b.company_name, b.company_number, a.PRODUCT_code FROM bridge a
inner join company b on a.COMPANY_CODE=b.COMPANY_NUMBER
inner join products c on a.product_code=c.PRODUCT_CODE
group by b.company_number, a.PRODUCT_code, b.company_name;

----Task2----
SELECT a.company_code,  b.company_name, a.PRODUCT_CODE, 
case 
when sum(a.volume)=0 then 'No sells'
when sum(a.volume)<=4000 then 'Low sells'
when sum(a.volume)<=200000 then "Medium sells"
When sum(a.volume)>200000 then "High sells" else "Failed" end as Sells from sales a
inner join company b on a.company_code=b.COMPANY_NUMBER
group by a.PRODUCT_CODE,a.company_code, b.company_name;

----Task3----
select a.client_number, b.COMPANY_NAME, b.COMPANY_NUMBER from sales a
inner join company b on a.company_code=b.COMPANY_NUMBER
where a.product_code in ('2','5','10')
group by a.client_number, b.COMPANY_NUMBER, b.COMPANY_NAME, a.product_code;

----Task4----
select Year, Sales, product_code, product_name from (
SELECT a.PRODUCT_CODE, b.product_name, strftime('%Y',a.SALES_DATE) as "Year" ,sum(a.volume) as "Sales" FROM sales a
inner join products b on a.product_code=b.PRODUCT_CODE
group by a.product_code, Year) b
where Sales>0
order by PRODUCT_CODE asc, year desc;

----Task5----
select 100*sum(volume)/(SELECT sum(volume) from sales) as '%'from sales
where currency='EUR';
