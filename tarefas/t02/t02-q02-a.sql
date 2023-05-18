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
