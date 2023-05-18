CREATE PROCEDURE exibir_equipe_projeto(codigo_proj INT)
LANGUAGE plpgsql
AS $$
DECLARE
    rec record;
BEGIN
    RAISE NOTICE 'Equipe do Projeto %:', codigo_proj;
    
    FOR rec IN
        SELECT funcionario.nome, departamento.sigla
        FROM projeto, membro, funcionario, departamento
        WHERE projeto.equipe = membro.codequipe
            AND membro.codfuncionario = funcionario.codigo
            AND funcionario.depto = departamento.codigo
            AND projeto.codigo = codigo_proj
    LOOP
        RAISE NOTICE 'Funcionário: %, Departamento: %', rec.nome, rec.sigla;
    END LOOP;
END;
$$;
