SELECT   
  id, 
  measurementID,
  measurementType, 
  measurementValue, 
  measurementAccuracy, 
  measurementUnit, 
  measurementDeterminedDate, 
  measurementDeterminedBy, 
  measurementMethod, 
  measurementRemarks
INTO MeasurementOrFact
FROM (
  SELECT 
    GBIF2014_C2.idGBIF AS id,
    (GBIF2014_C2.idGBIF & '-' & '1') AS measurementID,
    'flowering abundance' AS measurementType, 
    GBIF2014_C2.NUM_ESTRCT_FLORALES AS measurementValue, 
    '1' AS measurementAccuracy, 
    'number of flowering individuals by square meter' AS measurementUnit, 
    GBIF2014_C2.FECHA AS measurementDeterminedDate, 
    UTM_ELEV.Collector AS measurementDeterminedBy, 
    '' AS measurementRemarks, 
    'count of flowering individuals' AS measurementMethod
  FROM UTM_ELEV INNER JOIN GBIF2014_C2 ON UTM_ELEV.ID_PARCELA = GBIF2014_C2.ID_PARCELA
  WHERE (((GBIF2014_C2.NUM_ESTRCT_FLORALES) Is Not Null))

UNION ALL

  SELECT 
    GBIF2014_C2.idGBIF AS id,
    (GBIF2014_C2.idGBIF & '-' & '2') AS measurementID,
    'fruit abundance' AS measurementType, 
    GBIF2014_C2.NUM_FRUTOS AS measurementValue, 
    '1' AS measurementAccuracy, 
    'number of individuals in fruiting period by square meter' AS measurementUnit, 
    GBIF2014_C2.FECHA AS measurementDeterminedDate, 
    UTM_ELEV.Collector AS measurementDeterminedBy, 
    '' AS measurementRemarks, 
    'count of individuals in fruiting period' AS measurementMethod
  FROM UTM_ELEV INNER JOIN GBIF2014_C2 ON UTM_ELEV.ID_PARCELA = GBIF2014_C2.ID_PARCELA
  WHERE (((GBIF2014_C2.NUM_FRUTOS) Is Not Null))

UNION ALL

  SELECT 
    GBIF2014_C2.idGBIF AS id,
    (GBIF2014_C2.idGBIF & '-' & '3') AS measurementID,
    'cover' AS measurementType, 
    GBIF2014_C2.COBERTURA AS measurementValue, 
    '.01' AS measurementAccuracy, 
    'percentage' AS measurementUnit, 
    GBIF2014_C2.FECHA AS measurementDeterminedDate, 
    UTM_ELEV.Collector AS measurementDeterminedBy, 
    '' AS measurementRemarks, 
    'Braun-Blanquet (1946) transformation of Braun-Blanquet cover-abundance scale. More info: Van der Maarel (2007) DOI: 10.1111/j.1654-1103.2007.tb02592.x  and Van der Maarel (1979) DOI: 10.1007/BF00052021' AS measurementMethod
  FROM UTM_ELEV INNER JOIN GBIF2014_C2 ON UTM_ELEV.ID_PARCELA = GBIF2014_C2.ID_PARCELA
  WHERE (((GBIF2014_C2.COBERTURA) Is Not Null)));