CREATE TABLE produtos (
  idprodutos INTEGER   NOT NULL ,
  pdt_nome VARCHAR(20)    ,
  pdt_quantidade INTEGER    ,
  pdt_preco DECIMAL      ,
PRIMARY KEY(idprodutos));




CREATE TABLE pessoa (
  idpessoa INTEGER   NOT NULL ,
  nome VARCHAR(100)    ,
  logradouro VARCHAR(100)    ,
  cidade VARCHAR(50)    ,
  estado VARCHAR(50)    ,
  telefone VARCHAR(20)    ,
  email VARCHAR(60)      ,
PRIMARY KEY(idpessoa));




CREATE TABLE usuarios (
  idusuarios INTEGER   NOT NULL ,
  usuarios VARCHAR(20)    ,
  senha VARCHAR(6)      ,
PRIMARY KEY(idusuarios));




CREATE TABLE pessoa_juridica (
  pessoa_idpessoa INTEGER   NOT NULL ,
  cnpj VARCHAR(20)      ,
PRIMARY KEY(pessoa_idpessoa)  ,
  FOREIGN KEY(pessoa_idpessoa)
    REFERENCES pessoa(idpessoa));


CREATE INDEX pessoa_juridica_FKIndex1 ON pessoa_juridica (pessoa_idpessoa);


CREATE INDEX IFK_Rel_08 ON pessoa_juridica (pessoa_idpessoa);


CREATE TABLE pessoa_fisica (
  pessoa_idpessoa INTEGER   NOT NULL ,
  cpf VARCHAR(20)      ,
PRIMARY KEY(pessoa_idpessoa)  ,
  FOREIGN KEY(pessoa_idpessoa)
    REFERENCES pessoa(idpessoa));


CREATE INDEX pessoa_fisica_FKIndex1 ON pessoa_fisica (pessoa_idpessoa);


CREATE INDEX IFK_Rel_09 ON pessoa_fisica (pessoa_idpessoa);


CREATE TABLE movimento (
  idmovimento INTEGER   NOT NULL ,
  usuarios_idusuarios INTEGER   NOT NULL ,
  pessoa_idpessoa INTEGER   NOT NULL ,
  produtos_idprodutos INTEGER   NOT NULL ,
  quantidade INTEGER    ,
  tipo VARCHAR(20)    ,
  valorUnitario DECIMAL      ,
PRIMARY KEY(idmovimento)      ,
  FOREIGN KEY(usuarios_idusuarios)
    REFERENCES usuarios(idusuarios),
  FOREIGN KEY(pessoa_idpessoa)
    REFERENCES pessoa(idpessoa),
  FOREIGN KEY(produtos_idprodutos)
    REFERENCES produtos(idprodutos));


CREATE INDEX movimento_FKIndex1 ON movimento (usuarios_idusuarios);
CREATE INDEX movimento_FKIndex2 ON movimento (pessoa_idpessoa);
CREATE INDEX movimento_FKIndex3 ON movimento (produtos_idprodutos);


CREATE INDEX IFK_Rel_07 ON movimento (usuarios_idusuarios);
CREATE INDEX IFK_Rel_08 ON movimento (pessoa_idpessoa);
CREATE INDEX IFK_Rel_09 ON movimento (produtos_idprodutos);



