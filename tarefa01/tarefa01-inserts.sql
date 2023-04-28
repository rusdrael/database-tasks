INSERT INTO departamento (descricao, cod_gerente) VALUES
  ('Financeiro', NULL),
  ('Marketing', NULL),
  ('Gestão', NULL),
  ('Comercial', NULL),
  ('Recursos Humanos', NULL);

INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
  ('Matheus', 'M', '1971-01-01', 3000.00, 1),
  ('Clara', 'F', '1975-05-05', 2900.00, 2),
  ('Victor', 'M', '1975-10-10', 3200.00, 3),
  ('Maria', 'F', '1973-03-15', 3500.00, 4),
  ('Marcos', 'M', '1975-06-06', 3000.00, 5);
  
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 3 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 4 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 5 WHERE codigo = 5;

INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
  ('Marcelo', 'M', '1990-01-01', 1000.00, 1),
  ('Ana', 'F', '1995-05-05', 1500.00, 1),
  ('João', 'M', '1985-10-10', 2000.00, 2),
  ('Rebeca', 'F', '1980-03-15', 2500.00, 2),
  ('Antônio', 'M', '1995-06-06', 3000.00, 3),
  ('Débora', 'F', '1987-05-10', 1000.00, 3),
  ('Roberto', 'M', '1992-09-23', 1500.00, 4),
  ('Fátima', 'F', '1985-01-29', 2000.00, 4),
  ('Gabriel', 'M', '1984-08-19', 2500.00, 5),
  ('Sandra', 'F', '1997-05-12', 3000.00, 5);

INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
  ('Aporte governamental', 'Este projeto pretende conseguir e administrar um aporte governamental', 1, 1, '2022-01-01', '2022-06-30'),
  ('Estratégia de marketing', 'Este projeto pretende desenvolver uma nova estrátegia de marketing', 2, 2, '2022-03-01', '2022-12-31'),
  ('Gerenciamento dos recursos', 'Este projeto pretende melhorar o gerenciamento de recursos', 3, 3, '2022-05-01', '2023-02-28'),
  ('Abertura de nova loja', 'Este projeto pretende planejar e concretizar a abertura de uma nova loja', 4, 4, '2022-07-01', '2023-06-30'),
  ('Contratação de novos talentos', 'Este projeto pretende conseguir contratar os melhores de talentos do mercado', 5, 5, '2023-06-01', '2023-12-31');

INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
  ('Planejamento', 'Esta atividade será o planejamento do projeto', 1, '2022-01-01', '2022-01-31'),
  ('Execução', 'Esta atividade será a execução do projeto', 2, '2022-02-01', '2022-02-28'),
  ('Review', 'Esta atividade será o review do projeto', 3, '2022-03-01', '2022-03-31'),
  ('Teste', 'Esta atividade será o teste do projeto', 4, '2022-04-01', '2022-04-30'),
  ('Conclusão', 'Esta atividade será a conclusão do projeto', 5, '2023-07-01', '2023-07-31');

INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (3, 1),
  (3, 2),
  (3, 4),
  (3, 5),
  (4, 1),
  (4, 2),
  (4, 3),
  (5, 1),
  (5, 2),
  (5, 3),
  (5, 4),
  (5, 5);
