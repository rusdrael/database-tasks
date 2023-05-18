CREATE FUNCTION atraso_projeto_dias (codigo_projeto int)
RETURNS int
LANGUAGE plpgsql
AS $$
DECLARE
	  dias integer;
BEGIN
	  SELECT CASE
	  	WHEN dataconclusao IS NULL THEN 
			datafim - CURRENT_DATE
	  	ELSE 
			datafim - dataconclusao
	  END INTO dias
	  FROM projeto
	  WHERE codigo = codigo_projeto;
	
	  RETURN dias;
END;
$$;
