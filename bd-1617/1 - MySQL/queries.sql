----- QUERY 1
-- Apresentar a lista dos lugares reservados por um determinado cliente.

USE reserva_bilhetes;

DELIMITER $$
CREATE PROCEDURE lugaresReservados(IN cliente VARCHAR(9))
BEGIN
	SELECT R.Username, Nome, id_Reserva, Origem, Destino, Hora_Partida
		FROM reserva AS R INNER JOIN cliente AS C
			ON C.Username = R.Username
            INNER JOIN Viagem AS V
				ON V.id_Viagem = R.id_Viagem
            
    WHERE R.Username=cliente;
END $$

CALL lugaresReservados('usr9');


---- QUERY 2
-- Identificar o preço de uma reserva efetuada por um determinado cliente.

DELIMITER $$
CREATE PROCEDURE precoReserva(IN clt VARCHAR(9), IN rsv VARCHAR(9))
BEGIN
SELECT Preço
	FROM reserva 
		WHERE Username = clt AND id_Reserva = rsv;
END $$

CALL precoReserva('usr9','res2');

---- QUERY 3
-- Apresentar a lista dos destinos para uma origem.

DELIMITER $$
CREATE PROCEDURE listaDestinos(IN o VARCHAR(50))
BEGIN
	SELECT Origem, Destino
		FROM viagem 
    WHERE origem = o;
END $$

CALL listaDestinos('Porto');


---- QUERY 4
-- Identificar o numero total de lugares livres num comboio para uma viagem. 

USE reserva_bilhetes;

DELIMITER $$
CREATE PROCEDURE lugaresLivres(IN viagem VARCHAR(9))
BEGIN
	SELECT Lotação - 
		(SELECT COUNT(VI.id_Viagem) 
			FROM lugar_reserva AS LR INNER JOIN reserva AS R
	        ON R.id_Reserva = LR.id_Reserva
	        INNER JOIN viagem AS VI
	            ON VI.id_Viagem = R.id_Viagem
		WHERE VI.id_Viagem = viagem)
        
		 FROM viagem AS V INNER JOIN comboio AS C
			ON V.id_Comboio = C.id_Comboio
	 WHERE V.id_Viagem = viagem;
END

CALL lugaresLivres('viagem1');

-- QUERY 5

USE reserva_bilhetes;

DELIMITER $$
CREATE PROCEDURE efectuaReserva (IN idReserva VARCHAR(9), IN idViagem VARCHAR(9), IN Userx VARCHAR(12), IN DataRes DATETIME, IN preco DECIMAL(5,2), IN num INT, IN carr INT, IN class INT)
BEGIN
  DECLARE ErroTransacao BOOL DEFAULT 0;
  DECLARE idComboio VARCHAR(9);
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;

  START TRANSACTION;
  SET idComboio = (SELECT id_Comboio FROM viagem AS V
                   WHERE V.id_Viagem = idViagem);

  IF NOT EXISTS 
    (SELECT * FROM reserva
      WHERE reserva.id_Reserva = idReserva)
  THEN
    INSERT INTO reserva(id_Reserva,id_Viagem,Username,Data_Reserva,Preço)
           VALUES (idReserva,idViagem,Userx,DataRes,preco);
    INSERT INTO lugar_reserva(Numero,Carruagem,Classe,id_Comboio,id_Reserva)
           VALUES (num,carr,class,idComboio,idReserva);
  ELSE
    INSERT INTO lugar_reserva(Numero,Carruagem,Classe,id_Comboio,id_Reserva)
           VALUES (num,carr,class,idComboio,idReserva);
  END IF;

  IF ErroTransacao THEN
    ROLLBACK;
  ELSE
    COMMIT;
  END IF;
  
END$$

CALL efectuaReserva('res9','viagem1','usr4','2016-01-02 16:34:27',30,5,1,1);

-- QUERY 6

USE reserva_bilhetes;
 
--Criação de um cliente
 
DELIMITER $$
CREATE PROCEDURE insere_cliente
    (IN USER VARCHAR(12), Pass VARCHAR(15), Name VARCHAR(50), Email VARCHAR(50), Nfiscal INT, Adress VARCHAR(50))
BEGIN
    -- Declaraçãoo de um handler para tratamento de erros.
    DECLARE ErroTransacao BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;
    -- Início da transação
    START TRANSACTION;
    -- 1ª Operação - INSERT
    INSERT INTO cliente
        (Username, Password, Nome, E-mail, NIF, Morada)
        VALUES(USER,Pass,Name,Email,Nfiscal,Adress);
    IF ErroTransacao THEN
        -- Desfazer as operações realizadas.
        ROLLBACK;
    ELSE
        -- Confirmar as operações realizadas.
        COMMIT;
    END IF;
END $$
