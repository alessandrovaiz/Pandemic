CREATE TABLE STATE (ID_STA SERIAL NOT NULL, NAM_STA varchar(255) NOT NULL UNIQUE, INI_STA varchar(2) NOT NULL UNIQUE, COU_STA varchar(100) NOT NULL, ID_REG int4 NOT NULL, PRIMARY KEY (ID_STA));
COMMENT ON COLUMN STATE.ID_STA IS 'id do estado';
COMMENT ON COLUMN STATE.INI_STA IS 'sigla do estado';
COMMENT ON COLUMN STATE.COU_STA IS 'País do estado';
ALTER TABLE STATE ADD CONSTRAINT FKSTATE938164 FOREIGN KEY (ID_REG) REFERENCES REGION (ID_REG);