SELECT ROUND(MIN(s.Price), 2) AS 'faturamento_minimo',
ROUND(MAX(s.Price), 2) AS 'faturamento_maximo',
ROUND(AVG(s.Price), 2) AS 'faturamento_medio',
ROUND(SUM(s.Price), 2) AS 'faturamento_total'
FROM SpotifyClone.Subscription AS s
JOIN SpotifyClone.User AS u ON s.Subscription_ID = u.Subscription_ID;