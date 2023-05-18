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
