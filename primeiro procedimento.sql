CREATE TABLE usuarios (
  idusuarios INTEGER   NOT NULL ,
  usuarios VARCHAR(20)    ,
  senha VARCHAR(6)    ,
  tipousuarios VARCHAR(20)      ,
PRIMARY KEY(idusuarios));




CREATE TABLE produtos (
  idprodutos INTEGER   NOT NULL ,
  pdt_nome VARCHAR(20)    ,
  pdt_quantidade INTEGER    ,
  pdt_preco DECIMAL    ,
  pdt_movimento VARCHAR(10)    ,
  pdt_tipo VARCHAR(2)      ,
PRIMARY KEY(idprodutos));




CREATE TABLE p_juridica (
  idp_juridica INTEGER   NOT NULL ,
  usuarios_idusuarios INTEGER   NOT NULL ,
  pj_nome VARCHAR(45)    ,
  pj_cnpj INTEGER    ,
  pj_logradouro VARCHAR(20)    ,
  pj_numero INTEGER    ,
  pj_contato INTEGER      ,
PRIMARY KEY(idp_juridica)  ,
  FOREIGN KEY(usuarios_idusuarios)
    REFERENCES usuarios(idusuarios));


CREATE INDEX p_juridica_FKIndex1 ON p_juridica (usuarios_idusuarios);


CREATE INDEX IFK_Rel_07 ON p_juridica (usuarios_idusuarios);


CREATE TABLE p_fisica (
  idp_fisica INTEGER   NOT NULL ,
  usuarios_idusuarios INTEGER   NOT NULL ,
  pf_nome VARCHAR(45)    ,
  pf_cpf INTEGER    ,
  pf_idade INTEGER    ,
  pf_logradouro VARCHAR(20)    ,
  pf_numero INTEGER    ,
  contato INTEGER      ,
PRIMARY KEY(idp_fisica, usuarios_idusuarios)  ,
  FOREIGN KEY(usuarios_idusuarios)
    REFERENCES usuarios(idusuarios));


CREATE INDEX p_fisica_FKIndex1 ON p_fisica (usuarios_idusuarios);


CREATE INDEX IFK_Rel_08 ON p_fisica (usuarios_idusuarios);


CREATE TABLE p_juridica_has_produtos (
  p_juridica_idp_juridica INTEGER   NOT NULL ,
  produtos_idprodutos INTEGER   NOT NULL   ,
PRIMARY KEY(p_juridica_idp_juridica, produtos_idprodutos)    ,
  FOREIGN KEY(p_juridica_idp_juridica)
    REFERENCES p_juridica(idp_juridica),
  FOREIGN KEY(produtos_idprodutos)
    REFERENCES produtos(idprodutos));


CREATE INDEX p_juridica_has_produtos_FKIndex1 ON p_juridica_has_produtos (p_juridica_idp_juridica);
CREATE INDEX p_juridica_has_produtos_FKIndex2 ON p_juridica_has_produtos (produtos_idprodutos);


CREATE INDEX IFK_Rel_03 ON p_juridica_has_produtos (p_juridica_idp_juridica);
CREATE INDEX IFK_Rel_04 ON p_juridica_has_produtos (produtos_idprodutos);


CREATE TABLE p_fisica_has_produtos (
  p_fisica_idp_fisica INTEGER   NOT NULL ,
  produtos_idprodutos INTEGER   NOT NULL ,
  p_fisica_usuarios_idusuarios INTEGER   NOT NULL   ,
PRIMARY KEY(p_fisica_idp_fisica, produtos_idprodutos, p_fisica_usuarios_idusuarios)    ,
  FOREIGN KEY(p_fisica_idp_fisica, p_fisica_usuarios_idusuarios)
    REFERENCES p_fisica(idp_fisica, usuarios_idusuarios),
  FOREIGN KEY(produtos_idprodutos)
    REFERENCES produtos(idprodutos));


CREATE INDEX p_fisica_has_produtos_FKIndex1 ON p_fisica_has_produtos (p_fisica_idp_fisica, p_fisica_usuarios_idusuarios);
CREATE INDEX p_fisica_has_produtos_FKIndex2 ON p_fisica_has_produtos (produtos_idprodutos);


CREATE INDEX IFK_Rel_05 ON p_fisica_has_produtos (p_fisica_idp_fisica, p_fisica_usuarios_idusuarios);
CREATE INDEX IFK_Rel_06 ON p_fisica_has_produtos (produtos_idprodutos);


CREATE SEQUENCE PessoaIDSeq
    START WITH 1
    INCREMENT BY 1
    NO CYCLE;

