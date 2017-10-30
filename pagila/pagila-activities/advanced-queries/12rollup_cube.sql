CREATE OR REPLACE VIEW staff_div_reg_country AS
SELECT s.*, cd.company_division, cr.company_regions, cr.country 
FROM staff s 
LEFT JOIN  company_divisions cd 
ON s.department = cd.department 
LEFT JOIN company_regions cr 
ON s.region_id = cr.region_id;

/* Review the columns available in staff_div_reg_country view */
select
  *
from
  staff_div_reg_country
limit
  10;

/* Select number of employees by company_region and country */
select
   company_regions, country, count(*)
from
   staff_div_reg_country
group by
   company_regions, country
order by
   country, company_regions;


/* Use rollup operation on the group by clause to create hierarchical sums */
select
   company_regions, country, count(*)
from
   staff_div_reg_country
group by
   rollup (country, company_regions)
order by
   country, company_regions;


/* Use cube operation on the group by clause to create all possible combination of sets of grouping columns */
select
   company_division, company_regions,  count(*)
from
   staff_div_reg_country
group by
   cube (company_division, company_regions);
