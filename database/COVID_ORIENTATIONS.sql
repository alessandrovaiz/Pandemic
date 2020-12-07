CREATE TABLE COVID_ORIENTATIONS (ID_ORI SERIAL NOT NULL, DES_ORI varchar(1000) NOT NULL, DAT_ORI date NOT NULL, PRIMARY KEY (ID_ORI));
COMMENT ON COLUMN COVID_ORIENTATIONS.ID_ORI IS 'ID DA ORIENTAÇÃO';
COMMENT ON COLUMN COVID_ORIENTATIONS.DES_ORI IS 'DESCRIÇÃO DA ORIENTAÇÃO';
COMMENT ON COLUMN COVID_ORIENTATIONS.DAT_ORI IS 'data de inserção da orientação';