----------Create table's in Bronze layer--------
if OBJECT_ID ('Bronze.crm_cust_info','U') is not null 
drop table Bronze.crm_cust_info;

create table Bronze.crm_cust_info (
cst_id	INT,
cst_key	NVARCHAR(50),
cst_firstname	NVARCHAR(50),
cst_lastname	NVARCHAR(50),
cst_marital_status	NVARCHAR(50),
cst_gndr	NVARCHAR(50),
cst_create_date DATE
);


if OBJECT_ID ('Bronze.crm_prd_info','U') is not null 
drop table Bronze.crm_prd_info;

create table Bronze.crm_prd_info ( 
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);


if OBJECT_ID ('Bronze.crm_sales_details','U') is not null 
drop table Bronze.crm_sales_details;

Create table Bronze.crm_sales_details ( 
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt NVARCHAR(50),
sls_ship_dt NVARCHAR(50),
sls_due_dt NVARCHAR(50),
sls_sales INT,
sls_quantity INT,
sls_price INT
);


if OBJECT_ID ('Bronze.erp_cust_AZ12','U') is not null 
drop table Bronze.erp_cust_AZ12;

Create table Bronze.erp_cust_AZ12 (  
CID NVARCHAR(50),
BDATE DATE ,
GEN NVARCHAR(50)
);


if OBJECT_ID ('Bronze.erp_loc_a101','U') is not null 
drop table Bronze.erp_loc_a101;

Create table Bronze.erp_loc_a101 (  
CID NVARCHAR(50),
CNTRY NVARCHAR(50)
);


if OBJECT_ID ('Bronze.erp_px_cat_g1v2','U') is not null 
drop table Bronze.erp_px_cat_g1v2;

Create table Bronze.erp_px_cat_g1v2 (  
ID NVARCHAR(50),
CAT NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENANCE NVARCHAR(50)
);
