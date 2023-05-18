CREATE FUNCTION atraso_atividade_dias (codigo_atividade int)
RETURNS int
LANGUAGE plpgsql
AS $$
DECLARE
	  dias integer;
BEGIN
    SELECT datafim - dataconclusao
    INTO dias
	  FROM atividade
    WHERE codigo = codigo_atividade;
	
	  RETURN dias;
END;
$$;
