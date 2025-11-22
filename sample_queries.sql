-- 1. Find ads targeting "Interior design" in the US
SELECT a.ad_id
FROM ad a
JOIN targeting_dimension t ON a.targeting_id = t.targeting_id
JOIN targeting_interest i ON i.targeting_id = t.targeting_id
WHERE t.country = 'US'
  AND i.interest_name = 'Interior design';

-- 2. Ads targeting mobile users
SELECT a.ad_id
FROM ad a
JOIN targeting_device_platforms d
    ON a.targeting_id = d.targeting_id
WHERE d.device_platform = 'mobile';

-- 3. Ads targeting "Recently moved" life event
SELECT a.ad_id
FROM ad a
JOIN targeting_flexible_spec f
    ON a.targeting_id = f.targeting_id
WHERE f.spec_type = 'life_event'
  AND f.spec_value = 'Recently moved';

-- 4. Check history (SCD Type 2)
SELECT *
FROM targeting_dimension_history
WHERE ad_id = 101
ORDER BY valid_from DESC;
