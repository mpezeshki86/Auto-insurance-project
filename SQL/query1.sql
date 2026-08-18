with c as (select *,
CASE when drivage between 18 and 24 then '18-24'
when drivage between 25 and 34 then '25-34'
when drivage between 35 and 44 then '35-44'
when drivage between 45 and 54 then '45-54'
when drivage between 55 and 64 then '55-64'
when drivage >=65 then '65+'
else 'Unknown' END AS age_cat
from policy_frequency)

select age_cat,
COUNT(idpol) AS number_of_policies,
sum(claimnb) as Total_claims,
sum(exposure) as Total_exp, 
sum(claimnb)/sum(exposure) as Total_claim_freq
from c
group by c.age_cat

--testgjghjhj