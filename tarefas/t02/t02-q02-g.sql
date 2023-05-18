CREATE FUNCTION quantidade_atividades_func_proj (codigo_membro INT, codigo_proj INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    quantidade INT;
BEGIN
    SELECT COUNT(*) INTO quantidade
    FROM atividade_membro am
    JOIN atividade_projeto ap ON am.codatividade = ap.codatividade AND ap.codprojeto = codigo_proj
    WHERE am.codmembro = codigo_membro;

    RETURN quantidade;
END;
$$;
