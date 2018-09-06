CONNECT /var/sgbd/cep.gdb USER 'SYSDBA' PASSWORD 'masterkey';
SET STATS ON;
SELECT * FROM LOG_BAIRRO;
quit;
