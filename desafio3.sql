SELECT u.User_Name AS 'usuario', COUNT(h.Song_ID) AS 'qtde_musicas_ouvidas', ROUND(SUM(s.Song_Length /60), 2) AS 'total_minutos' FROM SpotifyClone.User As u
JOIN SpotifyClone.History AS h ON u.User_ID = h.User_ID
JOIN SpotifyClone.Song AS s ON h.Song_ID = s.Song_ID
GROUP BY u.User_Name ORDER BY u.User_Name;