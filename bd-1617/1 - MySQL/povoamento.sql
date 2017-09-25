USE reserva_bilhetes;

-- Gerador de clientes para a base de dados
INSERT INTO cliente
			(Username,Password,Nome,`E-mail`,NIF,Morada) 
			VALUES
				('usr1','aaa1','Antonio Abel','antonioabelgmail.com',1111,'Rua numero 1 1-A'),
				('usr2','aaa2','Andre Alberto','andrealberto@gmail.com',1112,'Rua numero 2 1-B'),
				('usr3','aaa3','Bruno Baiao','brunobaiao@gmail.com',1113,'Rua numero 3 1-C'),
				('usr4','aaa4','Carlos Costa','carloscosta@gmail.com',1114,'Rua numero 4 1-D'),
				('usr5','aaa5','Bruno Carvalho','brunoCarvalho@gmail.com',1115,'Rua numero 5 1-E'),
				('usr6','aaa6','Adrien Silva','adriensilva@gmail.com',1116,'Rua numero 6 1-F'),
				('usr7','aaa7','Wiliam Carvalho','wiliamCarvalho14@gmail.com',1117,'Rua numero 7 1-G'),
				('usr8','aaa8','Andre Andre','andreandre20@gmail.com',1118,'Rua numero 8 1-H'),
				('usr9','aaa9','Ruben Neves','rubenneves6@gmail.com',1119,'Rua numero 9 1-I'),
				('usr10','aaa10','Andre Silva','craque10@gmail.com',11110,'Rua numero 10 1-J');

-- Geração de Comboios

INSERT INTO comboio 
			(id_Comboio,Lotação,Nome) 
			VALUES
				('FASTX1',10,'Supersónico'),
				('FASTX2',15,'Veloz'),
				('FASTX3',20,'Xpress'),
				('RtrainX1',20,'Amália'),
				('RtrainX2',10,'Camões');
                
-- Geração de Viagens

INSERT INTO reserva_bilhetes.viagem 
			(id_Viagem,id_Comboio,Hora_Partida,Hora_Chegada,Origem,Destino) 
            VALUES
				('viagem1','FASTX1','2016-03-28 11:00:00','2016-03-28 13:00:00','Porto','Lisboa'),
				('viagem2','FASTX1','2016-03-28 14:00:00','2016-03-28 15:00:00','Lisboa','Coimbra'),
				('viagem3','FASTX2','2016-03-28 09:00:00','2016-03-28 12:00:00','Vila Real','Braga'),
				('viagem4','FASTX2','2016-03-28 14:00:00','2016-03-28 18:00:00','Braga','Lisboa'),
				('viagem5','FASTX3','2016-03-29 10:00:00','2016-03-29 11:00:00','Viana do Castelo','Porto'),
				('viagem6','FASTX3','2016-03-29 11:30:00','2016-03-29 12:30:00','Porto','Braga'),
				('viagem7','RtrainX1','2016-03-30 10:00:00','2016-03-30 15:00:00','Porto','Faro'),
				('viagem8','RtrainX1','2016-03-30 15:40:00','2016-03-30 18:00:00','Faro','Beja'),
				('viagem9','RtrainX2','2016-03-30 10:00:00','2016-03-30 14:00:00','Faro','Lisboa'),
				('viagem10','RtrainX2','2016-03-30 14:15:00','2016-03-30 16:00:00','Lisboa','Porto');

-- Gerador de Reservas

INSERT INTO reserva_bilhetes.reserva 
			(id_Reserva,id_Viagem,Username,Data_Reserva,Preço) 
            VALUES
				('res1','viagem1','usr10','2016-01-02 16:34:27',20),
				('res2','viagem1','usr9','2016-01-02 17:03:54',20),
				('res3','viagem3','usr6','2016-01-02 11:23:50',10),
				('res4','viagem3','usr7','2016-01-04 22:14:09',10); 



INSERT INTO reserva_bilhetes.lugar_comboio 
			(Numero,Carruagem,Classe,id_Comboio) 
            VALUES
-- COMBOIO 1, CAPACIDADE:10, CLASSE 1 = 5L, CLASSE 2 = 5L, 1 CARRUAGEM
				(1,1,1,'FASTX1'),
				(2,1,1,'FASTX1'),
				(3,1,1,'FASTX1'),
				(4,1,1,'FASTX1'),
				(5,1,1,'FASTX1'),
				(6,1,2,'FASTX1'),
				(7,1,2,'FASTX1'),
				(8,1,2,'FASTX1'),
				(9,1,2,'FASTX1'),
				(10,1,2,'FASTX1'),

-- COMBOIO 2, CAPACIDADE:16, CLASSE 1 = 8L, CLASSE 2 = 8L, 2 CARRUAGENS
				(1,1,1,'FASTX2'),
				(2,1,1,'FASTX2'),
				(3,1,1,'FASTX2'),
				(4,1,1,'FASTX2'),
				(5,1,1,'FASTX2'),
				(6,1,1,'FASTX2'),
				(7,1,1,'FASTX2'),
				(8,1,1,'FASTX2'),
				(9,2,2,'FASTX2'),
				(10,2,2,'FASTX2'),
				(11,2,2,'FASTX2'),
				(12,2,2,'FASTX2'),
				(13,2,2,'FASTX2'),
				(14,2,2,'FASTX2'),
				(15,2,2,'FASTX2'),
				(16,2,2,'FASTX2'),
-- COMBOIO 3, CAPACIDADE:20, CLASSE 1 = 10L, CLASSE 2 = 10L, 2 CARRUAGENS
				(1,1,1,'FASTX3'),
				(2,1,1,'FASTX3'),
				(3,1,1,'FASTX3'),
				(4,1,1,'FASTX3'),
				(5,1,1,'FASTX3'),
				(6,1,1,'FASTX3'),
				(7,1,1,'FASTX3'),
				(8,1,1,'FASTX3'),
				(9,1,1,'FASTX3'),
				(10,1,1,'FASTX3'),
				(11,2,2,'FASTX3'),
				(12,2,2,'FASTX3'),
				(13,2,2,'FASTX3'),
				(14,2,2,'FASTX3'),
				(15,2,2,'FASTX3'),
				(16,2,2,'FASTX3'),
				(17,2,2,'FASTX3'),
				(18,2,2,'FASTX3'),
				(19,2,2,'FASTX3'),
				(20,2,2,'FASTX3'),

-- COMBOIO 4, CAPACIDADE:20, CLASSE 1 = 10L, CLASSE 2 = 10L, 2 CARRUAGENS
				(1,1,1,'RtrainX1'),
				(2,1,1,'RtrainX1'),
				(3,1,1,'RtrainX1'),
				(4,1,1,'RtrainX1'),
				(5,1,1,'RtrainX1'),
				(6,1,1,'RtrainX1'),
				(7,1,1,'RtrainX1'),
				(8,1,1,'RtrainX1'),
				(9,1,1,'RtrainX1'),
				(10,1,1,'RtrainX1'),
				(11,2,2,'RtrainX1'),
				(12,2,2,'RtrainX1'),
				(13,2,2,'RtrainX1'),
				(14,2,2,'RtrainX1'),
				(15,2,2,'RtrainX1'),
				(16,2,2,'RtrainX1'),
				(17,2,2,'RtrainX1'),
				(18,2,2,'RtrainX1'),
				(19,2,2,'RtrainX1'),
				(20,2,2,'RtrainX1'),

-- COMBOIO 5, CAPACIDADE:10, CLASSE 1 = 5L, CLASSE 2 = 5L, 1 CARRUAGEM
				(1,1,1,'RtrainX2'),
				(2,1,1,'RtrainX2'),
				(3,1,1,'RtrainX2'),
				(4,1,1,'RtrainX2'),
				(5,1,1,'RtrainX2'),
				(6,1,2,'RtrainX2'),
				(7,1,2,'RtrainX2'),
				(8,1,2,'RtrainX2'),
				(9,1,2,'RtrainX2'),
				(10,1,2,'RtrainX2');
                
 INSERT INTO reserva_bilhetes.lugar_reserva 
			(Numero,Carruagem,Classe,id_Comboio,id_Reserva) 
            VALUES
				(1,1,1,'FASTX1','res1'),
				(2,1,1,'FASTX1','res1'),
				(4,1,1,'FASTX1','res2'),
				(5,1,1,'FASTX1','res2'),
				(1,1,1,'FASTX2','res3'),
				(2,1,1,'FASTX2','res4');
                
