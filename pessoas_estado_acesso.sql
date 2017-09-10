SELECT P.NOME, P.N_IDENTIFICADOR, 
CASE
   WHEN P.ESTADO = 0 THEN 'ATIVO'
   WHEN P.ESTADO = 1 THEN 'BLOQUEADO'
   WHEN P.ESTADO = 2 THEN 'LIVRE'
   WHEN P.ESTADO = 3 THEN 'DESLIGADO'
   END ESTADO
   , E.NOME, C.DESCRICAO FROM PESSOAS P JOIN EMPRESAS E ON P.EMPRESA_ID = E.ID JOIN CLASSIFICACOES C ON C.ID = P.CLASSIFICACAO_ID