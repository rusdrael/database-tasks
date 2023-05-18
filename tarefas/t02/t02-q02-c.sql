CREATE PROCEDURE exibir_funcionarios_acima_media_idade(depto_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    avg_idade DECIMAL(10, 2);
    rec RECORD;
BEGIN
    SELECT AVG(EXTRACT(YEAR FROM age(dataNasc)))
    INTO avg_idade
    FROM funcionario
    WHERE depto = depto_id;

    RAISE NOTICE 'Média de idade do departamento: %.2f', avg_idade;

    FOR rec IN
        SELECT nome, EXTRACT(YEAR FROM age(dataNasc)) AS idade
        FROM funcionario
        WHERE depto = depto_id
        AND EXTRACT(YEAR FROM age(dataNasc)) > avg_idade
    LOOP
        RAISE NOTICE 'Funcionário: %, Idade: %', rec.nome, rec.idade;
    END LOOP;
END;
$$;
