SELECT TO_CHAR(SUM(NVL(E.VALOR_REFEICAO,0)),'FM999G999G999D90') VALOR, P.NOME FROM 
EVENTOS_ACESSOS E JOIN PESSOAS P ON P.ID = PESSOA_ID GROUP BY P.NOME
