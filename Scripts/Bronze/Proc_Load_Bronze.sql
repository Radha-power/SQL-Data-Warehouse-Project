------load data from CSV files to Tables----- Bulk Insert
------create a SP 
create or alter procedure bronze.load_bronze as
BEGIN
	declare @start_time datetime , @end_time datetime
	set @start_time = GETDATE()
	BEGIN TRY

		print '=================================================';
		print 'loading bronze layer';
		print '================================================';

		print '-------------------------------------------------';
		print 'loading CRM Tables';
		print '-------------------------------------------------';

		Set @start_time = GETDATE()
		print 'Truncating Table: bronze.crm_cust_info';
		TRUNCATE Table bronze.crm_cust_info;
		print 'Inserting Data into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		Set @end_time = GETDATE()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'


		set @start_time = GETDATE()
		print 'Truncating Table: bronze.crm_prd_info';
		TRUNCATE Table bronze.crm_prd_info;
		print 'Inserting Data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		set @end_time = GETDATE()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'

		set @start_time = getdate()
		print 'Truncating Table: bronze.crm_sales_details';
		TRUNCATE Table bronze.crm_sales_details;
		print 'Inserting data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		set @end_time = getdate()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'
	
		print '-------------------------------------------------';
		print 'loading ERP Tables';
		print '-------------------------------------------------';

		set @start_time = getdate()
		print 'Truncating Table: bronze.erp_cust_az12';
		TRUNCATE Table bronze.erp_cust_az12;
		print 'Inserting data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		set @end_time = getdate()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'

		set @start_time = getdate()
		print 'Truncating Table: bronze.erp_loc_a101';
		TRUNCATE Table bronze.erp_loc_a101;
		print 'Inserting data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		set @end_time = getdate()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'


		set @start_time = GETDATE()
		print 'Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE Table bronze.erp_px_cat_g1v2;
		print 'Inserting data into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2 
		from 'C:\Users\radhakrishna\Downloads\SQL BY baraa\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
		Firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		set @end_time = getdate()
		print '>> Load duration' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'

	END TRY

	BEGIN CATCH 
		print '===========================================================';
		print 'ERROR Occured during loading Bronze Layer';
		Print 'ERROR MESSAGE' + ERROR_MESSAGE();
		Print 'ERROR state' + cast(ERROR_state() as nvarchar(50));
		print '===========================================================';
	END CATCH
	set @end_time = getdate()
	print '>> Load duration of bronze layer: ' + CAST(datediff(second,@start_time,@end_time) as NVARCHAR) + ' Seconds'
END
