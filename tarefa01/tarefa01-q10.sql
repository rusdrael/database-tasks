SELECT p.nome AS nome_projeto, dp.descricao AS nome_dept_projeto, 
	f.nome AS nome_resp_projeto, d.descricao AS nome_dept_func_resp
FROM projeto p
INNER JOIN Departamento dp ON dp.codigo = p.cod_depto
INNER JOIN Funcionario f ON f.codigo = p.cod_responsavel
INNER JOIN Departamento d ON d.codigo = f.cod_depto;
