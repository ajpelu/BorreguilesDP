SELECT 
  Ocurrences.Class, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.Class;