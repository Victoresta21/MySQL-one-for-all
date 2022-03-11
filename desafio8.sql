SELECT ar.Artist_Name AS 'artista', al.Album_Name AS 'album' FROM SpotifyClone.Artist AS ar
JOIN SpotifyClone.Album AS al ON ar.Artist_ID = al.Artist_ID
WHERE ar.Artist_Name = 'Walter Phoenix'
ORDER BY al.Album_Name ASC;