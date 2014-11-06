SELECT 
  Ocurrences.ScientificName, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified, 
  Ocurrences.Family
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.ScientificName, 
  Ocurrences.Family;