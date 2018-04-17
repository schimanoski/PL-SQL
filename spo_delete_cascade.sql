CREATE GLOBAL TEMPORARY TABLE TABELAS_DEPENDENCIAS_OK
          (	NOME_TABELA VARCHAR2(100)) ON COMMIT PRESERVE ROWS;
/
CREATE OR REPLACE PROCEDURE SPO_DELETE_CASCADE
(v_tabela IN VARCHAR DEFAULT 'dual') AS
v_nome_pk VARCHAR(100);
v_tabela_dependente VARCHAR(100);
v_tabela_ok VARCHAR(100);
CURSOR c_dependencias IS SELECT table_name FROM user_constraints WHERE constraint_type = 'R' AND r_constraint_name = v_nome_pk AND table_name NOT IN UPPER(v_tabela); 
CURSOR c_dependencias_ok IS SELECT nome_tabela FROM tabelas_dependencias_ok;
BEGIN
   INSERT INTO tabelas_dependencias_ok VALUES(v_tabela);
   SELECT UPPER(constraint_name) INTO v_nome_pk FROM user_constraints WHERE table_name = UPPER(v_tabela) AND constraint_type = 'P';
   dbms_output.put_line('ANALISA TABELA : ' || UPPER(v_tabela));
   OPEN c_dependencias;
      LOOP
         FETCH c_dependencias INTO v_tabela_dependente;
         IF c_dependencias%NOTFOUND THEN
            dbms_output.put_line('nao tem dependencia');
            EXIT;
         ELSE
            OPEN c_dependencias_ok;
            LOOP
               FETCH c_dependencias_ok INTO v_tabela_ok;
               IF c_dependencias_ok%NOTFOUND THEN               
                  dbms_output.put_line('tabela dependente: ' || v_tabela_dependente);
                  SPO_DELETE_CASCADE(v_tabela_dependente);
                  EXIT;
               END IF;
               IF UPPER(v_tabela_ok) = UPPER(v_tabela_dependente) THEN
                  dbms_output.put_line('tabela ja analisada!!!: ' || v_tabela_dependente);
                  EXIT;
               END IF;
            END LOOP;
            CLOSE c_dependencias_ok;
         END IF;
      END LOOP;
   CLOSE c_dependencias;
   execute immediate 'delete from ' || v_tabela;
   dbms_output.put_line('deleta: ' || v_tabela);
EXCEPTION WHEN OTHERS THEN
   dbms_output.put_line(SQLERRM);
END SPO_DELETE_CASCADE;
/ 
