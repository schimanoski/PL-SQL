--Use ampersand(&) substitution to restrict and sort output at runtime
select * from comida where id = &id

/*
FUNÇÕES DE UMA UNICA LINHA:
OPERAR SOBRE UMA UNICA LINHA POR VEZ E RETORNAR UMA LINHA DE SAIDA PARA CADA LINHA TRATADA
*/

--FUNÇÕES DE CARACTER--

--FUNÇÃO ASCII() RETORNAR O VALOR DA TABELA ASC PARA A COLUNA SELECIONADA 
--OUTPUT: 49
SELECT ASCII(ID) FROM COMIDA /

--FUNÇÃO CHAR() CONTRARIA A ANTERIOR, CONVERTE VALOR ACS PARA CARACTER
--OUTPUT: G
SELECT CHR(71) FROM DUAL /

--FUNÇÃO CONCAT() DE DOIS PARAMETROS QUE CONCATENA EM UMA NOVA STRING
--OUTPUT: DOUGLAS FELIPE SCHIMANOSKI
SELECT CONCAT(CONCAT('DOGULAS ', 'FELIPE'), ' SCHIMANOSKI') FROM DUAL /

--FUNÇÃO INITCAP() CONVERT A PRIMEIRA LETRA DE CADA PALAVRA EM MAIUSCULA
--OUTPUT: Douglas Felipe Schimanoski
SELECT INITCAP('douglas felipe schimanoski') from dual;

--FUNÇÃO INSTR(), QUE PROCURA UMA STRING OU CARACTER DENTRO DE UMA OUTRA STRING E RETORNA O PRIMEIRO INDICE DA STRING QUE ESTÁ BUSCANDO
--INSTR(X, LOCALIZAR_STRING, INICIO, OCORRENCIA)
--X: STRING DE CONTEXTO NA QUAL SERÁ FEITO A BUSCA
--LOCALIZA_STRING: STRING QUE VAI SER BUSCADA DENTRO DE X
--INICIO: OPÇÃO OPCIONAL QUE INDICA A PARTIR DE QUE INCIDE SERÁ FEITA A BUSCA
--OCORRENCIA: OPÇÃO OPCIONAL QUE INDICA EM QUAL OCORRENCIA(REPETIÇÃO) DEVE RETORNAR O INDICE
--OUTPUT: 19
SELECT INSTR('DOUGLAS FELIPE SCHIMANOSKI', 'I', 1, 2) FROM DUAL /

--FUNÇÃO REPLACE PROCURA VALOR E SUBSTITUI POR OUTRO
--REPLCAE(X, STRING_BUSCA, STRING_SUBSTITUTA)
--OUTPUT: DOUGLAS SCHIMANOSKI
SELECT REPLACE('DOUGLAS FELIPE SCHIMANOSKI', 'FELIPE ', '') FROM DUAL /

--FUNÇÃO SUBSTR() BUSCA UMA SUBSTRING(PEDAÇO DE STRING) DENTRO DE OUTRA, 
--PARA ISSO É PRECISO FORNECER O INICIO DA SUBSTRING E O FINAL
--SUBSTR(X, INDICE_INICIO, INDICE_FINAL(OPCIONAL))
--OUTPUT: FELIPE
SELECT SUBSTR('DOUGLAS FELIPE SCHIMANOSKI', 9, 6) FROM DUAL /

--FUNÇÃO LEMGHT() RETORNA O TAMANHO DA STRING
--OUTPUT: 26
SELECT LENGTH('DOUGLAS FELIPE SCHIMANOSKI') FROM DUAL /

--FUNÇÃO LOWER() CONVERTE CARACTERES PARA MINUSCULO
--OUTPUT: douglas felipe schimanoski
SELECT LOWER('DOUGLAS FELIPE SCHIMANOSKI') FROM DUAL /

--FUNÇÃO UPPER() CONVERTE CARACTERES PARA MAIUSCULO
--OUTPUT: DOUGLAS FELIPE SCHIMANOSKI
SELECT UPPER('douglas felipe schimanoski') FROM DUAL /

--FUNÇÃO RPAD() PREENCHE COM CARACTERES A DIRETA ATÉ O INDICE LIMITE DEFINIDO
--RPAD(VALOR, INDICE_LIMITE, VALOR_A_INSERIR)
--OUTPUT: DOUGLAS**##
SELECT RPAD('DOUGLAS', 11, '**#####') FROM DUAL /

--FUNÇÃO LPAD(), MESMA FUNÇÃO QUE RPAD, POREM PARA O LADO ESQUERDO
--OUTPUT: **##DOUGLAS
SELECT LPAD('DOUGLAS', 11, '**#####') FROM DUAL /

--FUNÇÕES LTRIM, RTRIM E TRIM, REMOVEM ESPAÇOS DA ESQUERDA, DIRETA, E AMBOS, RESPECTIVAMENTE 
--OUTPUT: DOUGLAS
--OUTPUT: DOUGLAS
--OUTPUT: DOUGLAS
--OUTPUT:    DOUGLAS    
SELECT LTRIM('   DOUGLAS'), RTRIM('DOUGLAS   '), TRIM('   DOUGLAS   '), '   DOUGLAS   ' FROM DUAL /

--FUNÇÃO NVL()
--VERIFICA SE EXISTE VALOR EM NOME, CASO EXISTIR RETORNA NOME , CASO CONTRARIO RETORNA O SEUNDO PARAMETRO, 
--NESSE CASO DE STRING 'SEM NOME'
SELECT NVL(NOME, 'SEM NOME') FROM COMIDA /

--FUNÇÃO NVL2(), SE O NOME EXISTIR RETORNA O SEUNDO PARAMETRO, SE FOR NULO RETORNA O TERCEIRO
SELECT NVL2(NOME, 'COMIDA EXISTE', 'SEM NOME') FROM COMIDA;



--FUNCOES DE NUMERICAS--

--FUNÇÃO SQRT() , RAIZ QUADRADA
--OUTPUT: 5
SELECT SQRT(25) FROM DUAL /

--FUNCAO TRUNC() DE TRUNCAMENTO DAS CASAS DECIAMAIS
--OUTPUT: 5
--OUTPUT: 5.5
--OUTPUT: 5.56
SELECT TRUNC(5.567) FROM DUAL /
SELECT TRUNC(5.567, 1) FROM DUAL /
SELECT TRUNC(5.567, 2) FROM DUAL /

--FUNÇÃO ROUD() DE ARREDONDAMENTO DE CASAS DECIMAIS, PARA CIMA OUT PARA BAIXO, O VALOR QUE ESTIVER MAIS PROXIMO
--OUTPUT: 6
--OUTPUT: 5.6
--OUTPUT: 5.57
SELECT ROUND(5.567) FROM DUAL /
SELECT ROUND(5.567, 1) FROM DUAL /
SELECT ROUND(5.567, 2) FROM DUAL /


--FUNÇÕES DE CONVERÇÃO--

--FUNÇÃO DECODE(X, BUSCA, IGUAL, DIFERENTE), COMPARA OS DOIS PRIMEIROS PARAMENTRO E 
--SE FOREM IGUAIS RETORNA O TERCEIRO PARAMETRO SENAO RETORNA O QUARTO
--OUTPUT: 1
SELECT DECODE('DOUGLAS', 'DOUGLAS', 1, 2) FROM DUAL /

--FUNÇÃO TO_CHAR
--OUTPUT:1234
SELECT TO_CHAR(1234, '9999') FROM DUAL /
--OUTPUT:   1234
SELECT TO_CHAR(1234, '9999999') FROM DUAL /
--OUTPUT:1234
SELECT TO_CHAR(1234, 'FM9999999') FROM DUAL /
--OUTPUT: 0001234
SELECT TO_CHAR(1234, '0999999') FROM DUAL /
--OUTPUT:123
SELECT TO_CHAR(123.4, '999') FROM DUAL /
--OUTPUT:123.40
SELECT TO_CHAR(123.4, '999.90') FROM DUAL /
--OUTPUT:00123.400
SELECT TO_CHAR(123.4, '09999.999') FROM DUAL /
--OUTPUT:1234.000
SELECT TO_CHAR(1234, '9999.999') FROM DUAL /
--OUTPUT:1,234.00
SELECT TO_CHAR(1234, '9,999.99') FROM DUAL /
--OUTPUT:$1,234.00
SELECT TO_CHAR(1234, '$9,999.99') FROM DUAL /
--OUTPUT:BRL1234
SELECT TO_CHAR(1234, 'C9999') FROM DUAL /
--OUTPUT:R$ 1.234,00
SELECT TO_CHAR(1234, 'L9G999D99') FROM DUAL /

--FUNÇÃO TO_NUMBER
--OUTPUT: 1234
SELECT TO_NUMBER('R$1.234,00', 'L9G999D99') FROM DUAL /
--OUTPUT:123,4
SELECT TO_NUMBER('123,4') FROM DUAL /

--FUNÇÃO CAST(x AS tipo)
--OUTPUT:123,4
SELECT CAST(123.4 AS VARCHAR(5)) FROM DUAL /
--OUTPUT:123,4
SELECT CAST(123.42 AS NUMBER(4,1) ) FROM DUAL /
--OUTPUT: 12/05/17
SELECT CAST('12-05-2017' AS DATE) FROM DUAL /


