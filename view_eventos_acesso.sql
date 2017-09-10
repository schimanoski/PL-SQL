CREATE VIEW MINHA_VIEW
AS
SELECT P.NOME AS 'NOME DA PESSOA', PN.N_IDENTIFICADOR AS 'NÚMERO IDENTIFICADOR DA PESSOA', EM.NOME AS 'NOME DA EMPRESA', CL.DESCRICAO AS 'CLASSIFICAÇÃO', DATA AS 'DATA DO ACESSO', HORA_SEGUNDOS(HORA) AS 'HORA DO ACESSO'
FROM EVENTOS_ACESSOS EA
JOIN PESSOAS P ON P.ID = EA.PESSOA_ID
JOIN PESSOAS PN ON PN.N_IDENTIFICADOR = EA.PESSOA_ID
JOIN EMPRESAS EM ON EM.ID= P.EMPRESA_ID
JOIN CLASSIFICACOES CL ON CL.ID = P.CLASSIFICACAO_ID