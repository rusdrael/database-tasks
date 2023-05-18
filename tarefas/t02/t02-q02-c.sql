CREATE FUNCTION idade_funcionario (codigo_funcionario int)
RETURNS int
LANGUAGE plpgsql
AS $$
DECLARE
      idade integer;
BEGIN
      SELECT EXTRACT(YEAR FROM AGE(dataNasc))
      INTO idade
      FROM funcionario
      WHERE codigo = codigo_funcionario;

      RETURN idade;
END;
$$;

CREATE FUNCTION media_idade_depto (codigo_departamento int)
RETURNS float
LANGUAGE plpgsql
AS $$
DECLARE
      media_idade_depto float;
BEGIN
      SELECT AVG(idade_funcionario(funcionario.codigo))
      INTO media_idade_depto
      FROM funcionario
      WHERE funcionario.depto = codigo_departamento;

      RETURN media_idade_depto;
END;
$$;

CREATE PROCEDURE exibir_funcionarios_acima_media_idade (depto_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    avg_idade DECIMAL(10, 2);
    rec RECORD;
BEGIN
    avg_idade := media_idade_depto(depto_id);

    RAISE NOTICE 'Média de idade do departamento: %', avg_idade;

    FOR rec IN
        SELECT nome, idade_funcionario(codigo) AS idade
        FROM funcionario
        WHERE depto = depto_id
        AND idade_funcionario(codigo) > avg_idade
    LOOP
        RAISE NOTICE 'Funcionário: %, Idade: %', rec.nome, rec.idade;
    END LOOP;
END;
$$;
