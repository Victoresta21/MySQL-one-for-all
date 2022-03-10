SELECT User_Name AS 'usuario', IF(MAX(YEAR(h.Reproduction_Timestamp)) >= '2021','Usuário ativo','Usuário inativo') AS 'condicao_usuario' FROM SpotifyClone.User AS u
JOIN SpotifyClone.History AS h ON u.User_ID = h.User_ID
GROUP BY User_Name ORDER BY User_Name ASC;