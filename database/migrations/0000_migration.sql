CREATE TABLE PERSON (ID_PER SERIAL NOT NULL, NAM_PER varchar(255) NOT NULL, CPF_PER varchar(255) NOT NULL UNIQUE, EMA_PER varchar(80), DAT_BIR date, TEL1_PER varchar(30), TEL2_PER varchar(30), COV_SIT varchar(1) DEFAULT 'N', WEI_PER float4, HEI_PER float8, PRIMARY KEY (ID_PER));
COMMENT ON COLUMN PERSON.ID_PER IS 'ID DA PESSOA PK';
COMMENT ON COLUMN PERSON.NAM_PER IS 'NOME DA PESSOA';
COMMENT ON COLUMN PERSON.CPF_PER IS 'CPF DA PESSOA';
COMMENT ON COLUMN PERSON.EMA_PER IS 'EMAIL DA PESSOA';
COMMENT ON COLUMN PERSON.DAT_BIR IS 'DATA DE NASCIMENTO DA PESSOA';
COMMENT ON COLUMN PERSON.TEL1_PER IS 'TELEFONE 1 DA PESSOA';
COMMENT ON COLUMN PERSON.TEL2_PER IS 'TELEFONE 2 DA PESSOA';
COMMENT ON COLUMN PERSON.COV_SIT IS 'SITUAÇÃO DE COVID';
COMMENT ON COLUMN PERSON.WEI_PER IS 'PESO DA PESSOA';
COMMENT ON COLUMN PERSON.HEI_PER IS 'ALTURA DA PESSOA';

CREATE TABLE SYMPTOMS (ID_SYM SERIAL NOT NULL, DES_SYM varchar(255) NOT NULL, INT_SYM char(1) NOT NULL, PRIMARY KEY (ID_SYM));
COMMENT ON TABLE SYMPTOMS IS 'TABELA DE SINTOMAS DO PACIENTE';
COMMENT ON COLUMN SYMPTOMS.DES_SYM IS 'DESCRIÇÃO DO SINTOMA';
COMMENT ON COLUMN SYMPTOMS.INT_SYM IS 'INTENSIDADE DO SINTOMA';

CREATE TABLE USERS (ID_USR SERIAL NOT NULL, EMA_USR varchar(80) NOT NULL UNIQUE, PAS_USR varchar(100) NOT NULL, PER_USR char(1) DEFAULT 'P' NOT NULL, ID_PER int4 NOT NULL, PRIMARY KEY (ID_USR));
COMMENT ON TABLE USERS IS 'TABELA DE USUÁRIOS DO SISTEMA';
COMMENT ON COLUMN USERS.ID_USR IS 'ID USUARIO - pk';
COMMENT ON COLUMN USERS.EMA_USR IS 'E-MAIL DO USUÁRIO';
COMMENT ON COLUMN USERS.PAS_USR IS 'SENHA DO USUARIO';
COMMENT ON COLUMN USERS.PER_USR IS 'PERMISSÃO DO USUÁRIO';
ALTER TABLE USERS ADD CONSTRAINT FKUSERS41986 FOREIGN KEY (ID_PER) REFERENCES PERSON (ID_PER);

CREATE TABLE PERSON_SYMPTOMS (ID_PER int4 NOT NULL, ID_SYM int4 NOT NULL, DAT_SYM date NOT NULL, DAT_CUR date, PRIMARY KEY (ID_PER, ID_SYM));
COMMENT ON COLUMN PERSON_SYMPTOMS.DAT_CUR IS 'DATA DA CURA';
ALTER TABLE PERSON_SYMPTOMS ADD CONSTRAINT FKPERSON_SYM805810 FOREIGN KEY (ID_SYM) REFERENCES SYMPTOMS (ID_SYM);
ALTER TABLE PERSON_SYMPTOMS ADD CONSTRAINT FKPERSON_SYM685606 FOREIGN KEY (ID_PER) REFERENCES PERSON (ID_PER);

CREATE TABLE REGION (ID_REG SERIAL NOT NULL, NAM_REG varchar(255) NOT NULL, PRIMARY KEY (ID_REG));
COMMENT ON COLUMN REGION.ID_REG IS 'id da região';

CREATE TABLE STATE (ID_STA SERIAL NOT NULL, NAM_STA varchar(255) NOT NULL UNIQUE, INI_STA varchar(2) NOT NULL UNIQUE, COU_STA varchar(100) NOT NULL, ID_REG int4 NOT NULL, PRIMARY KEY (ID_STA));

COMMENT ON COLUMN STATE.ID_STA IS 'id do estado';
COMMENT ON COLUMN STATE.INI_STA IS 'sigla do estado';
COMMENT ON COLUMN STATE.COU_STA IS 'País do estado';
ALTER TABLE STATE ADD CONSTRAINT FKSTATE938164 FOREIGN KEY (ID_REG) REFERENCES REGION (ID_REG);

CREATE TABLE ADRESS (ADD_LOC varchar(255) NOT NULL, ID_ADD SERIAL NOT NULL, DIS_ADD varchar(255) NOT NULL, NUM_ADD varchar(20) NOT NULL, ID_STA int4 NOT NULL, ID_PER int4 NOT NULL, PRIMARY KEY (ID_ADD));
COMMENT ON TABLE ADRESS IS 'Endereço da pessoa';
COMMENT ON COLUMN ADRESS.ADD_LOC IS 'RUA';
COMMENT ON COLUMN ADRESS.ID_ADD IS 'PRIMARY KEY DOS ENDEREÇOS';
COMMENT ON COLUMN ADRESS.DIS_ADD IS 'BAIRRO';
COMMENT ON COLUMN ADRESS.NUM_ADD IS 'NUMERO RESIDENCIAL';
ALTER TABLE ADRESS ADD CONSTRAINT FKADRESS125057 FOREIGN KEY (ID_PER) REFERENCES PERSON (ID_PER);
ALTER TABLE ADRESS ADD CONSTRAINT FKADRESS740676 FOREIGN KEY (ID_STA) REFERENCES STATE (ID_STA);

CREATE TABLE CITY (ID_CIT SERIAL NOT NULL, NAM_CIT varchar(150) NOT NULL UNIQUE, ID_STA int4 NOT NULL, PRIMARY KEY (ID_CIT));
CREATE TABLE COVID_ORIENTATIONS (ID_ORI SERIAL NOT NULL, DES_ORI varchar(1000) NOT NULL, DAT_ORI date NOT NULL, PRIMARY KEY (ID_ORI));
COMMENT ON COLUMN COVID_ORIENTATIONS.ID_ORI IS 'ID DA ORIENTAÇÃO';
COMMENT ON COLUMN COVID_ORIENTATIONS.DES_ORI IS 'DESCRIÇÃO DA ORIENTAÇÃO';
COMMENT ON COLUMN COVID_ORIENTATIONS.DAT_ORI IS 'data de inserção da orientação';
ALTER TABLE CITY ADD CONSTRAINT FKCITY601525 FOREIGN KEY (ID_STA) REFERENCES STATE (ID_STA);

INSERT INTO person (id_per, nam_per, cpf_per, ema_per, dat_bir, tel1_per, tel2_per, cov_sit, wei_per, hei_per) VALUES(1, 'Admin', '0', NULL, NULL, NULL, NULL, 'N', NULL, NULL);
INSERT INTO users (id_usr, ema_usr, pas_usr, per_usr, id_per) VALUES(1, 'admin', 'admin', '0', 1);