-- PORTFOLIO SUMMARY
-- Purpose: Summarize the overall size and claims experience of the portfolio

SELECT
    COUNT(*) AS total_policy_records,
    SUM(claimnb) AS total_claims,
    SUM(exposure) AS total_exposure,
    SUM(claimnb) / SUM(exposure) AS overall_claim_frequency
FROM policy_frequency;

-- FINDING:
-- The portfolio contains 678,013 policy records representing
-- approximately 358,499 policy-years of exposure and 36,102 claims.
-- Overall claim frequency is approximately 0.1007 claims per policy-year,
-- equivalent to 10.07 claims per 100 policy-years.


-- Analyze policy exposure
SELECT
	MIN(exposure) as min_exposure,
	Max(exposure) as max_exposure,
	AVG(exposure) as avg_exposure
FROM policy_frequency;

-- FINDING:
-- Average exposure is approximately 0.529 policy-years per record.
-- Exposure ranges from approximately 0.003 to 2.01 policy-years.
-- The maximum exposure exceeds two years and warrants further investigation.


SELECT
    COUNT(*) AS exposures_more_than_1
FROM policy_frequency
WHERE exposure > 1;

-- FINDING:
-- 1,224 policy records have exposure greater than one year.
-- These observations are rare and are retained for analysis.

SELECT
    COUNT(*) FILTER (WHERE claimnb = 0) AS no_claim_policies,
    COUNT(*) FILTER (WHERE claimnb >= 1) AS one_or_more_claim_policies,
	ROUND((COUNT(*) FILTER (WHERE claimnb >= 1)*100.0)/COUNT(*),2) AS percentage
FROM policy_frequency;

-- FINDING:
-- 34,060 policy records had at least one claim, while 643,953 had no claims.
-- Approximately 5.02% of policy records experienced at least one claim.
-- This differs from claim frequency, which accounts for policy exposure.