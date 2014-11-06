SELECT 
  Ocurrences.Phylum, 
  Count(Ocurrences.DateLastModified) AS CuentaDeDateLastModified
FROM 
  Ocurrences
GROUP BY 
  Ocurrences.Phylum;

