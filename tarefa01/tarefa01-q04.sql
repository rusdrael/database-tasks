SELECT f.nome, f.salario, d.descricao
FROM funcionario f 
LEFT JOIN departamento d ON f.cod_depto = d.codigo 
WHERE f.codigo NOT IN (SELECT cod_gerente FROM departamento WHERE cod_gerente IS NOT NULL) 
ORDER BY f.cod_depto;
