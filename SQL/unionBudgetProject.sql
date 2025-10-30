CREATE TABLE union_budget_schemes (
    Category VARCHAR(100),
    Ministry VARCHAR(255),
    Scheme VARCHAR(255),
    Actuals_2021 NUMERIC(18, 2), -- Actuals for 2021 (A_21_Tot)
    BE_2022 NUMERIC(18, 2),      -- Budget Estimate for 2022 (BE_22_Tot)
    BE_2023 NUMERIC(18, 2),      -- Budget Estimate for 2023 (BE_23_Tot)
    Growth_Percent NUMERIC(10, 4) -- The calculated growth percentage
);
alter table union_budget_schemes
alter column Growth_Percent type numeric(18,2); 
--coping the csv file
COPY union_budget_schemes
FROM 'C:\Users\Nyla Majid\OneDrive\Documents\Datasets\unionbudget_cleaned.csv' 
CSV HEADER;
-- checking if data is loaded
select * from union_budget_schemes limit 5;

--Top 10 ministries by 2023 budget

Select ministry,
       SUM(BE_2023) AS Total_2023
From union_budget_schemes	
Group By ministry
Order By Total_2023 DESC
LIMIT 10;

--Total number of Schemes under different ministries

Select ministry,
       count(Distinct Scheme) AS Total_Schemes
From  union_budget_schemes
Group BY ministry
Order BY Total_Schemes DESC;

-- Schemes under"Ministry of Textiles" 
Select Scheme,
       SUM(BE_2023) AS TotalScheme_allocation_2023
From union_budget_schemes
where ministry='Ministry of Textiles'
Group By Scheme
Order By TotalScheme_allocation_2023 desc
limit 5
;


--Schemes with highest budget allocation and its ministry
Select Scheme,ministry,
       SUM(BE_2023) AS TotalScheme_allocation_2023
From union_budget_schemes
Group By Scheme,ministry
Order By TotalScheme_allocation_2023 desc
limit 5
;

--Top growing schemes
select scheme,ministry,
     SUM(Growth_Percent) AS Growth_percentage
From union_budget_schemes
Group BY Scheme,ministry
HAVING  SUM(Growth_Percent)>0
Order BY Growth_percentage descSchemes with
LIMIT 5;

--Schemes with negative growth
select scheme,ministry,
     SUM(Growth_Percent) AS Growth_percentage
From union_budget_schemes
Group BY Scheme,ministry
HAVING  SUM(Growth_Percent)<0
Order BY Growth_percentage  
LIMIT 5;

--10 Schemes with zero growth percent

select scheme,ministry,
     SUM(Growth_Percent) AS Growth_percentage
From union_budget_schemes
Group BY Scheme,ministry
HAVING  SUM(Growth_Percent)=0
Order BY Growth_percentage  
LIMIT 10;












