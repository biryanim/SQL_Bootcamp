SELECT address,
       round((max(age)::numeric - (min(age)::numeric / max(age))), 2) AS formula,
       round(avg(age), 2)                                             AS average,
       (max(age)::numeric - (min(age)::numeric / max(age))) > avg(age) AS comparison
FROM person
GROUP BY address
ORDER BY address;
