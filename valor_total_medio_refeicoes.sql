SELECT P.NOME, TO_CHAR(NVL(AVG(E.VALOR_REFEICAO),0), 'FML999G999G990D90') "VALOR TOTAL" FROM
EVENTOS_ACESSOS E JOIN PESSOAS P ON P.ID = E.PESSOA_ID WHERE DATA BETWEEN TO_DATE('24/02/2017') AND TO_DATE(SYSDATE) GROUP BY P.NOME ORDER BY P.NOME;
