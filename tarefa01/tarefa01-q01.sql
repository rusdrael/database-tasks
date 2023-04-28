CREATE VIEW funcionario_salario_depto AS
SELECT f.nome, d.codigo, f.salario
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.codigo;

SELECT nome
FROM funcionario_salario_depto
WHERE salario > (SELECT MAX(salario) FROM funcionario_salario_depto WHERE Codigo = 2);
