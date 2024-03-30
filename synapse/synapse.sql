-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        -- URL of that file in ADLS 
        --   https://adlssynapse98.blob.core.windows.net/test/NYCTripSmall.parquet
        BULK 'https://adlssynapse98.dfs.core.windows.net/test/NYCTripSmall.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]  
Where passenger_count > 5


/*
select TOP 10 * From [SalesLT].[Product]
*/

-- OPENROWSET function in Azure Synapse Analytics -- TEMP / ONE TIME REFERNCE

SELECT
   count(VendorID) as 'Vendors', passenger_count
FROM
    OPENROWSET(
        -- URL of that file in ADLS 
        --   https://adlssynapse98.blob.core.windows.net/test/NYCTripSmall.parquet
        BULK 'https://adlssynapse98.dfs.core.windows.net/test/NYCTripSmall.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]  
Where passenger_count > 5
group by passenger_count 


/* 
==================================================================================================
*/

-- OpenROwset = function = Crete a temporary virtual table 
-- Only for AD Hoc (one time) analysis 

select *
from OPENROWSET (
    -- from where to get the data ? == Bulk 
    bulk 'https://adlssynapse98.blob.core.windows.net/test/movies.csv',
    Format = 'CSV',
    -- PARSER_VERSION = '2.0' required as without it gives ERROR 
    -- Schema cannot be determined from data files for file format 'CSV'. Please use WITH clause of OPENROWSET to define schema
    
    PARSER_VERSION = '2.0',

    -- it will automatically take first values as column names 
    -- so no more c1, c2 coulmn names 
    HEADER_ROW = TRUE 
) AS 
-- Nickname for this table 
John_cena 

