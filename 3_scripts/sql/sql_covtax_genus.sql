SELECT 
  Ocurrences.Genus, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified, 
  Ocurrences.Class, 
  Ocurrences.Orde, 
  Ocurrences.Family
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.Genus, 
  Ocurrences.Class, 
  Ocurrences.Orde, 
  Ocurrences.Family;