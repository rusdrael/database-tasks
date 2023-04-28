CREATE VIEW num_funcionarios_por_departamento AS
SELECT COUNT(*) AS qtd, cod_depto
FROM funcionario
GROUP BY cod_depto;

SELECT d.descricao AS departamento, g.nome AS gerente, COALESCE(nf.qtd, 0) AS num_funcionarios
FROM departamento d
LEFT JOIN num_funcionarios_por_departamento nf ON nf.cod_depto = d.codigo
LEFT JOIN funcionario g ON d.cod_gerente = g.codigo;
