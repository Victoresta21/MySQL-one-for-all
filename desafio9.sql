SELECT COUNT(h.User_ID) AS 'quantidade_musicas_no_historico' FROM SpotifyClone.History AS h
JOIN SpotifyClone.User AS u ON h.User_ID = u.User_ID
WHERE u.User_Name = 'Bill'