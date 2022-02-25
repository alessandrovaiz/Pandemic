CREATE TABLE USERS (ID_USR SERIAL NOT NULL, EMA_USR varchar(80) NOT NULL UNIQUE, PAS_USR varchar(100) NOT NULL, PER_USR char(1) DEFAULT 'P' NOT NULL, ID_PER int4 NOT NULL, PRIMARY KEY (ID_USR));
COMMENT ON TABLE USERS IS 'TABELA DE USUÁRIOS DO SISTEMA';
COMMENT ON COLUMN USERS.ID_USR IS 'ID USUARIO - pk';
COMMENT ON COLUMN USERS.EMA_USR IS 'E-MAIL DO USUÁRIO';
COMMENT ON COLUMN USERS.PAS_USR IS 'SENHA DO USUARIO';
COMMENT ON COLUMN USERS.PER_USR IS 'PERMISSÃO DO USUÁRIO';
ALTER TABLE USERS ADD CONSTRAINT FKUSERS41986 FOREIGN KEY (ID_PER) REFERENCES PERSON (ID_PER);