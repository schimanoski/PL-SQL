SELECT COUNT(1) ACESSOS, P.NOME, EQ.DESCRICAO FROM EVENTOS_ACESSOS E JOIN PESSOAS P ON P.ID = E.PESSOA_ID JOIN
EQUIPAMENTOS EQ ON E.EQUIPAMENTO_ID = EQ.ID GROUP BY EQ.ID,EQ.DESCRICAO, P.NOME