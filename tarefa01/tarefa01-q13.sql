SELECT p.nome AS nome_projeto, p.data_inicio AS inicio_projeto, p.data_fim AS fim_projeto, 
	a.nome AS nome_atividade, a.data_inicio AS inicio_atividade, a.data_fim AS fim_atividade
FROM projeto p
INNER JOIN atividade_projeto ap ON ap.cod_projeto = p.codigo
INNER JOIN atividade a on ap.cod_atividade = a.codigo
WHERE a.data_inicio < p.data_inicio OR a.data_fim > p.data_fim;
