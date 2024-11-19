WITH
    last_currency_rate AS (
        SELECT
            c.id AS currency_id,
            c.name AS currency_name,
            c.rate_to_usd,
            ROW_NUMBER() OVER (
                PARTITION BY
                    c.id
                ORDER BY c.updated DESC
            ) AS rn
        FROM currency c
    )
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    SUM(b.money) AS volume,
    COALESCE(
        lc.currency_name,
        'not defined'
    ) AS currency_name,
    COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(b.money) * COALESCE(lc.rate_to_usd, 1) AS total_volume_in_usd
FROM
    balance b
    LEFT JOIN "user" u ON b.user_id = u.id
    LEFT JOIN last_currency_rate lc ON b.currency_id = lc.currency_id
    AND lc.rn = 1
GROUP BY
    u.name,
    u.lastname,
    b.type,
    lc.currency_name,
    lc.rate_to_usd
ORDER BY COALESCE(u.name, 'not defined') DESC, COALESCE(u.lastname, 'not defined') ASC, b.type ASC;