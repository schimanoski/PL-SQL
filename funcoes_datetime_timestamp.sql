
--FUNÇÕES DATA E HORÁRIO

--ALTERA O FORMATO PADRÃO DA DATA, O QUAL ESTÁ SETADO NO INIT.ORA OU SPFILE.ORA
--ALTER SYSTEM ALTERA O VALOR DO BANCO DE DADOS
--ALTER SESSION ALTERA APENAS O VALOR NA SESSAO, OU SEJA, QUANDO RECONECTAR A SESSAO DO USUARIO O VALOR PADRÃO IRÁ VOLTAR
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY' /

--VISUALIZA TODOS OS PARAMETROS DE NATION LANGUAGE SUPPORT(NLS)
SELECT * FROM V$NLS_PARAMETERS /

--FORMATO RR PARA ANO, SETA O ANO PARA O SECULO ANTERIOR QUANDO INCLUIR APENAS O FINAL DO ANO E FOR ACIMA DE 50, SE FOR ABAIXO MANTEM O MESMO SECULLUM 
SELECT TO_DATE('10/10/97', 'DD/MM/RR') FROM DUAL /
--OUTPUT: 10/10/1997
SELECT TO_DATE('10/10/97', 'DD/MM/YY') FROM DUAL /
--OUTPUT: 10/10/2097

--EXXIBE DATA E HORARIO ATUAL DO SERVIDOR DE BANCO DE DADOS
SELECT SYSDATE FROM DUAL /

--ROUND()
--ARREDONDA PARA O ANO MAIS PROXIMO
SELECT ROUND(SYSDATE, 'YYYY') FROM DUAL /
--OUTPUT: 01/01/2018

--ARREDONDA PARA O MES MAIS PROXIMO
SELECT ROUND(SYSDATE, 'MM') FROM DUAL /
--OUTPUT: 01/11/2017

--ARREDONDA PARA A HORA MAIS PROXIMO
SELECT TO_CHAR(ROUND(TO_DATE('21:45:00', 'HH24:MI:SS'), 'HH24'), 'HH24') FROM DUAL /
--OUTPUT: 22

--TRUNC()
--"RESETA" O ANO
SELECT TRUNC(SYSDATE, 'YYYY') FROM DUAL /
--OUTPUT: 01/01/2017

--"RESETA" O MES
SELECT TRUNC(SYSDATE, 'MM') FROM DUAL /
--OUTPUT: 01/10/2017

SELECT TO_CHAR(TRUNC(SYSDATE, 'HH'), 'HH:MI') FROM DUAL /
--OUTPUT: 09:00
    
--FUSO HORÁRIO
--RETORNA A DATA DO FUSO HORARIO LOCAL DEFINIDO NA SESSAO
SELECT CURRENT_DATE FROM DUAL /
--OUTPUT:24/10/2017

--RETORNAR O FUSO HORARIO DO BANCO DE DADOS
SELECT DBTIMEZONE FROM DUAL /
--OUTPUT: +00:00 , SIGNIFICA QUE ESTÁ USANDO O FUSO DO PC
--PODE SER ALTERADO PELO COMANDO :
ALTER DATABASE SET TIME_ZONE = '-08:00'	/

--ALTERA O FUSO LOCAL DA SESSAO:
ALTER SESSION SET TIME_ZONE = '-08:00' /

--EXIBE O FUSO DA SESSAO LOCAL
SELECT SESSIONTIMEZONE FROM DUAL /
--OUTPUT: -08:00	
	
--RETORNAR A DIFERENÇA ENTRE O FUSO PASSADO E O FUSO UTC
SELECT TZ_OFFSET('EUROPE/PARIS') FROM DUAL /
--OUTPUT: +02:00	

--RETORNAR TODOS OS FUSOS(TIME_ZONES)
SELECT * FROM V$TIMEZONE_NAMES /
	
--CONVERTER DATA E HORARIO PARA OUTRO FUSO, OBS: NAO FUSIONA TODOS OS FUSOS
SELECT TO_CHAR(NEW_TIME(TO_DATE('10/10/2017 10:10:10', 'DD/MM/YYYY HH:MI:SS'), 'PST', 'EST'), 'DD/MM/YYYY HH:MI:SS') FROM DUAL /

--TIMESTAMP
 --TIMESTAMP, TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH LOCAL TIME ZONE
--INSERE UM TIMESTAMP	
INSERT INTO COMIDA(TEMPO_ZONA) VALUES(TIMESTAMP '2017-10-10 23:37:10.123456789 PST') /

--SELECIONA O TIMESTAMP E FUSO LOCAL DA SESSAO
SELECT CURRENT_TIMESTAMP FROM DUAL /

--SELECIONA O TIMESTAMP LOCAL DA SESSAO
SELECT LOCALTIMESTAMP FROM DUAL /

--RETORNA DATA, HORA E FUSO DO BANCO DE DADOS
SELECT SYSTIMESTAMP FROM DUAL /

--ADICIONA TIME ZONE(FUSO) NO TIMESTAMP
SELECT FROM_TZ(LOCALTIMESTAMP, '-07:00') FROM DUAL /
--OUTPUT ANTES:  24/10/17 23:49:33,785000000
--OUTPUT DEPOIS: 24/10/17 23:49:33,785000000 -07:00

--EXTRAI QUALQUER PARTE DE UM TIMESTAMP WITH ZONE
--PODE SER USADO:
--YEAR FROM, MONTH FROM, DAY FROM, HOUR FROM, MINUTE FROM, SECOND FROM, TIMEZONE_HOUR, ETC
SELECT 
    EXTRACT( MONTH FROM SYSDATE)
    FROM DUAL /
--OUTPUT: 10

--SYS_EXTRACT_UTC: CONVERTE O TIMESTAMP PARA UTC

--TO_TIMESTAMP: CONVERTE STRING PARA TIMESTAMP
SELECT TO_CHAR(TO_TIMESTAMP('10:10:11.123456789', 'HH:MI:SS.FF'), 'DD/MM/RRRR HH:MI:SS.FF') FROM DUAL /
--OUTPUT: 01/10/2017 10:10:11.123456789

--TO_TIMESTAMP_TZ: CONVERTE STRING PARA TIMESTAMP WITH TIME ZONE
--VARIAÇÕES: TZR(TIMEZONE REGIAO), TZH(TIMEZONE HORAS), TZM(TIMEZONE MINUTOS)
SELECT TO_CHAR(TO_TIMESTAMP_TZ('10:10:11.123456789 AMERICA/SAO_PAULO', 'HH:MI:SS.FF TZR'), 'DD/MM/RRRR HH:MI:SS.FF TZR') FROM DUAL /
--OUTPUT: 01/10/2017 10:10:11.123456789 AMERICA/SAO_PAULO

--INTERVAL:
--INSERE 3 ANOS E 5 MESES
INSERT INTO COMIDA(INTERVALO) VALUES(INTERVAL '3-5' YEAR TO MONTH ) /
SELECT INTERVALO FROM COMIDA /
--OUTPUT: +03-05

--NUMTODSINTERVAL: CONVERTE NUMERO PARA DIAS, HORAS, MINUTOS, SEGUNDOS E FRAÇÕES DE SEGUNDO
SELECT NUMTODSINTERVAL(30.5, 'DAY') FROM DUAL /
--OUTPUT: +30 12:00:00.000000
SELECT NUMTODSINTERVAL(30, 'SECOND') FROM DUAL /
--OUTPUT: +00 00:00:30.000000

--NUMTOYMINTERVAL: CONVERTE NUMERO PARA ANO OU MES
SELECT NUMTOYMINTERVAL(30.5, 'YEAR') FROM DUAL /
--OUTPUT: +30-06
SELECT NUMTOYMINTERVAL(30, 'MONTH') FROM DUAL /
--OUTPUT: +02-06

SELECT TO_YMINTERVAL('30-06') FROM DUAL /
--OUTPUT: +30-06	
SELECT TO_DSINTERVAL('+30 12:00:00') FROM DUAL /
--OUTPUT: +30 12:00:00.000000	
	
	
	
	
	
