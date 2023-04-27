CREATE TABLE funcionario (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(255),
  sexo CHAR(1),
  dt_nasc DATE,
  salario DECIMAL(10,2),
  cod_depto INT
);

CREATE TABLE departamento (
  codigo SERIAL PRIMARY KEY,
  descricao VARCHAR(255),
  cod_gerente INT,
  FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo) on delete set null on update cascade
);

ALTER TABLE funcionario ADD CONSTRAINT fk_depto FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) on delete set null on update cascade;

CREATE TABLE projeto (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  cod_depto INT,
  cod_responsavel INT,
  data_inicio DATE,
  data_fim DATE,
  FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) on delete set null on update cascade,
  FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) on delete set null on update cascade
);

CREATE TABLE atividade (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  cod_responsavel INT,
  data_inicio DATE,
  data_fim DATE,
  FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) on delete set null on update cascade
);

CREATE TABLE atividade_projeto (
  cod_projeto INT not null,
  cod_atividade INT not null,
  FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) on delete set null on update cascade,
  FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo) on delete set null on update cascade,
  PRIMARY KEY (cod_projeto, cod_atividade)
);
