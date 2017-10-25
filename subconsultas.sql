--SUBCONSULTA

--subconsulta escalar(uma linha e uma coluna)
SELECT * FROM DOUGLAS WHERE ID = 
(SELECT ID FROM DOUGLAS WHERE ID = 4)  /

--subconsulta com várias linhas
--operadores: in, any, all
SELECT * FROM DOUGLAS WHERE ID IN(4,5,6) /
SELECT * FROM DOUGLAS WHERE ID > ANY(4,5,6) /
SELECT * FROM DOUGLAS WHERE ID > ALL(4,5,6) /

--consulta de várias linhas e colunas: apenas com o operador in, os 2 valores correspondentes devem ser verdadeiros para retornar a consulta
SELECT * FROM DOUGLAS WHERE (ID, NOME) IN (SELECT 4, 'douglas' FROM DUAL) /


--consulta correlacionada passa os valores da consulta externa para cada linha da consulta interna e retorna todas as linha de uma vez 
SELECT EXT.NOME, EXT.ID FROM DOUGLAS EXT WHERE EXISTS (
    SELECT 1 FROM OUTRA INR WHERE INR.NOME_MEIO = EXT.NOME
) /

--subconsultas aninhadas
SELECT * FROM DOUGLAS WHERE ID IN (
    SELECT ID FROM DOUGLAS WHERE ID IN(
        SELECT ID FROM DOUGLAS
    )
) /


