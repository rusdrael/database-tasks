CREATE FUNCTION porcentagem_atividades_func_proj (codigo_membro INT, codigo_proj INT)
RETURNS DECIMAL(5,2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_atividades INT;
    atividades_membro INT;
    porcentagem DECIMAL(5,2);
BEGIN
    SELECT COUNT(*) INTO total_atividades
    FROM atividade_projeto
    WHERE codprojeto = codigo_proj;

    SELECT COUNT(*) INTO atividades_membro
    FROM atividade_membro am
    JOIN atividade_projeto ap ON am.codatividade = ap.codatividade AND ap.codprojeto = codigo_proj
    WHERE am.codmembro = codigo_membro;

    IF total_atividades > 0 THEN
        porcentagem := (atividades_membro::DECIMAL / total_atividades) * 100;
    ELSE
        porcentagem := 0;
    END IF;

    RETURN porcentagem;
END;
$$;
