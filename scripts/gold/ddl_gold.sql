-- # Gold Layer – Create Final Views

-- ### Overview:
-- This script builds the Gold Layer views in the data warehouse.
-- The Gold Layer represents the final analytical model, typically organized in a star schema format with fact and dimension views.

-- ### Purpose:
-- - Consolidate cleaned and enriched data from the Silver Layer.
-- - Structure the data for efficient querying and dashboarding.
-- - Serve as the foundation for BI tools, metrics tracking, and reporting.

-- ### Usage:
-- These views are intended to be queried directly for business analysis, supporting KPIs and decision-making workflows.

-- ===================================================================================================================================================
-- create dimension: gold.dim_customers
  -- ===================================================================================================================================================

create view gold.dim_customers as
select
	row_number() over (order by cst_id) as customer_key,
	ci.cst_id as customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname as firstname,
	ci.cst_lastname as lastname,
	la.cntry as country,
	ci.cst_marital_status as marital_status,
	case when ci.cst_gndr is not null then ci.cst_gndr -- crm is master for gener info
				else coalesce(ca.gen, 'unknown')
			end as gender,
	ca.bdate as birthdate,
	ci.cst_create_date as create_date
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
		on ci.cst_key = ca.cid
left join silver.erp_loc_a101 la
		on ci.cst_key = la.cid;

-- ===================================================================================================================================================
-- create dimension: gold.dim_customers
  -- ===================================================================================================================================================
  
create view gold.dim_products as 
select 
row_number() over (order by pn.prd_start_dt, pn.prd_key) as product_key,
pn.prd_id as product_id,
pn.prd_key as product_number,
pn.prd_nm as product_name,
pn.cat_id as category_id,
pc.cat as category,
pc.subcat as subcategory,
pc.maintenance,
pn.prd_cost as product_cost,
pn.prd_line as product_line,
pn.prd_start_dt as start_date
from silver.crm_prd_info pn
	left join silver.erp_px_cat_g1v2 pc
    on pn.cat_id = pc.id
where prd_end_dt is null;  -- filter out all historical data

-- ===================================================================================================================================================
-- create dimension: gold.dim_customers
  -- ===================================================================================================================================================
create view gold.fact_sales as
select
sd.sls_ord_num as order_number,
pr.product_key, 
cu.customer_key,
sd.sls_order_dt as order_date,
sd.sls_ship_dt as shipping_date,
sd.sls_due_dt as due_date,
sd.sls_sales as sales,
sd.sls_quantity as quantity,
sd.sls_price as price
from silver.vw_crm_sales_details sd
left join gold.dim_products pr
on sd.row_id = pr.product_key
left join gold.dim_customers cu
on sd.sls_cust_id = cu.customer_id
