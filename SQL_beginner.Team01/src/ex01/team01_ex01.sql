SELECT COALESCE(u.name, 'not defined') as name, COALESCE(u.lastname, 'not defined') as lastname, c.name as currency_name,
       balance.money * COALESCE((SELECT rate_to_usd
        FROM currency
        WHERE currency.updated < balance.updated AND id = balance.currency_id
        ORDER BY currency.updated DESC
        LIMIT 1), (SELECT rate_to_usd
        FROM currency
        WHERE currency.updated > balance.updated AND id = balance.currency_id
        ORDER BY currency.updated
        LIMIT 1)) as currency_in_usd
FROM balance
LEFT JOIN public."user" u on balance.user_id = u.id
JOIN (SELECT DISTINCT id, name FROM currency) as c ON balance.currency_id = c.id
ORDER BY name DESC, lastname, currency_name;
