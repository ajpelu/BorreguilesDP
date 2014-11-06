SELECT 
  Ocurrences.Orde, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.Orde;