SELECT ar.Artist_Name AS 'artista', al.Album_Name AS 'album', COUNT(f.User_ID) AS 'seguidores' FROM SpotifyClone.Album AS al
JOIN SpotifyClone.Artist AS ar ON al.Artist_ID = ar.Artist_ID
JOIN SpotifyClone.Following AS f ON f.Artist_ID = al.Artist_ID
GROUP BY al.Album_Name, ar.Artist_Name
ORDER BY COUNT(f.User_ID) DESC, ar.Artist_Name, al.Album_Name;