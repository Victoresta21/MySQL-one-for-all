SELECT COUNT(DISTINCT s.Song_Name) AS 'cancoes',  COUNT( DISTINCT ar.Artist_Name) AS 'artistas', COUNT(DISTINCT al.Album_Name) AS 'albuns' FROM SpotifyClone.Song AS s 
JOIN SpotifyClone.Artist AS ar
ON s.Artist_ID = ar.Artist_ID
JOIN SpotifyClone.Album AS al
ON s.Album_ID = al.Album_ID;