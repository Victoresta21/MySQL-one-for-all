SELECT s.Song_Name AS 'cancao', COUNT(h.Reproduction_Timestamp) AS 'reproducoes' FROM SpotifyClone.Song AS s JOIN SpotifyClone.History AS h ON s.Song_ID = h.Song_ID
GROUP BY s.Song_ID
ORDER BY COUNT(h.Reproduction_Timestamp) DESC, s.Song_Name ASC LIMIT 2;