SELECT 
  Ocurrences.Family, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified, 
  Ocurrences.Orde, 
  Ocurrences.Class
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.Family, 
  Ocurrences.Orde, 
  Ocurrences.Class;