CREATE TABLESPACE  TS_recepcao_ubs_2019
DATAFILE  'C:\BD\recepcao_ubs_2019.dbf' SIZE 2M
AUTOEXTEND ON;

CREATE USER atendente
IDENTIFIED BY atendente
DEFAULT TABLESPACE recepcao_ubs_2019
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_recepcao_ubs_2019;

GRANT DBA TO atendente WITH ADMIN OPTION;

CREATE TABLE paciente (
	cartao_sus NUMBER(15) CONSTRAINT PK_cartao_sus PRIMARY KEY,
	data_de_nascimento DATE,
	tipo_sangue CHAR(3) CONSTRAINT CK_tipo_sangue CHECK (
		tipo_sangue IN ('A+', 'B+', 'AB+', 'O+','A-','B-','AB-','O-')
	),
	sexo CHAR(1) CONSTRAINT CK_sexo CHECK ( sexo IN ('M','F') ),
	nome VARCHAR(30),
	endereco VARCHAR(30),
	CONSTRAINT UK_cartao_sus UNIQUE (cartao_sus)
);

CREATE TABLE medico (
	medico_id NUMBER(10) CONSTRAINT PK_medico_id PRIMARY KEY,
	nome VARCHAR(30),
	especialidade VARCHAR(30)
);

CREATE TABLE agenda (
	agenda_id NUMBER(10) CONSTRAINT PK_agenda_id PRIMARY KEY,
	data_hora SMALLDATETIME,
	medico_id NUMBER(10) CONSTRAINT FK_medico_id REFERENCES medico (medico_id),
	cartao_sus NUMBER(15) CONSTRAINT FK_cartao_sus REFERENCES paciente (cartao_sus)
);

CREATE TABLE consulta (
	consulta_id NUMBER(10) CONSTRAINT PK_consulta_id PRIMARY KEY,
	agenda_id NUMBER(10) CONSTRAINT FK_agenda_id REFERENCES agenda (agenda_id),
	anamnese VARCHAR(300),
	status VARCHAR(100),
	descricao VARCHAR(300)
);

CREATE TABLE receita (
	receita_id NUMBER(10) CONSTRAINT PK_receita_id PRIMARY KEY,
	consulta_id NUMBER(10) CONSTRAINT FK_consulta_id REFERENCES consulta (consulta_id),
	descricao VARCHAR(30),
	medicamento VARCHAR(30)
);

INSERT INTO paciente VALUES (198517168585923, '06/06/1996', 'AB+', 'M', 'Cleyton Elivelton Rodrigues', 'Rua Felicidade, 152 - Perfeito');
INSERT INTO paciente VALUES (181159416545178, '07/07/1997', 'A+', 'M', 'Anakin Skywalker', 'Rua Tatooine, 45 - Dagoba');
INSERT INTO paciente VALUES (854712846177183, '10/02/1980', 'B+', 'F', 'Leia Organa', 'Rua Dantoine, 12 - DeathStar');
INSERT INTO paciente VALUES (766522852297989, '20/08/1985', 'O+', 'M', 'John Snow', 'Rua Winterfel, 7 - Westeros');
INSERT INTO paciente VALUES (827819483589489, '11/06/1955', 'A-', 'M', 'Tyrion Lannister', 'Rua Kings Landing, 3 - Westeros');
INSERT INTO paciente VALUES (587617226638912, '30/07/2000', 'B-', 'F', 'Edna Mode', 'Rua Incrivel, 1502 - Familia');
INSERT INTO paciente VALUES (957997554249155, '01/01/1950', 'AB+', 'M', 'Optmus Prime', 'Rua Terra, 852 - Senior');
INSERT INTO paciente VALUES (749746627677471, '25/08/1990', 'A+', 'M', 'Normam Bates', 'Rua Hoteleira, 657 - Murder');
INSERT INTO paciente VALUES (724247747215675, '03/11/1994', 'B+', 'F', 'Vandinha Addams', 'Rua Estranha, 666 - Fear');
INSERT INTO paciente VALUES (757423826961176, '15/05/1975', 'A-', 'M', 'Ethan Hunt', 'Rua do mundo, 753 - Impossible');
INSERT INTO paciente VALUES (841128369635315, '27/12/1940', 'B-', 'M', 'Samwise Gamgee', 'Rua do Condado, 10 - Terra Media');
INSERT INTO paciente VALUES (726849344135721, '02/03/1920', 'AB+', 'M', 'Steve Rogers', 'Rua Stark, 459 - Brooklyn');
INSERT INTO paciente VALUES (737796369586791, '08/01/1984', 'O+', 'F', 'Natascha Avenger', 'Rua Stark, 987 - Brooklyn');
INSERT INTO paciente VALUES (883792415855788, '22/03/1945', 'B+', 'M', 'Tony Montana', 'Rua Scarface, 555 - Las Vegas');
INSERT INTO paciente VALUES (266321923883935, '25/09/1994', 'AB+', 'M', 'Harry Potter', 'Rua Alferneiros, 888 - Londres');
INSERT INTO paciente VALUES (742422663163335, '16/07/1996', 'B+', 'F', 'Hermione Granger', 'Rua Hogwarts, 444 - Londres');
INSERT INTO paciente VALUES (494821591554327, '26/04/1999', 'A-', 'F', 'Sarah Connor', 'Rua Exterminador do Futuro, 95 - Machine');
INSERT INTO paciente VALUES (925641385132192, '10/10/1930', 'AB+', 'M', 'Dom Corleone', 'Rua Big Boss, 887 - Little Italy');
INSERT INTO paciente VALUES (127991993725584, '07/07/1935', 'B-', 'M', 'Obi-Wan Kenobi', 'Rua da Força, 147 - Yoda');
INSERT INTO paciente VALUES (392933341518293, '18/08/1988', 'AB+', 'M', 'Ferris Bueller', 'Rua Vida, 152 - Nova York');
INSERT INTO paciente VALUES (154494957743589, '06/07/1955', 'AB+', 'F', 'Pepper Pots', 'Rua Stark, 654 - Brooklyn');
INSERT INTO paciente VALUES (524992421926776, '10/12/1950', 'A-', 'M', 'Tony Stark', 'Rua Stark, 654 - Brooklyn');
INSERT INTO paciente VALUES (661797772751194, '13/12/1980', 'B+', 'M', 'Clark Kent', 'Rua Felicidade, 152 - Smallvile');
INSERT INTO paciente VALUES (755665351279323, '06/06/1996', 'AB+', 'M', 'Cleyton Elivelton Rodrigues', 'Rua Felicidade, 152 - Perfeito');
INSERT INTO paciente VALUES (629495147113562, '02/04/1940', 'A+', 'F', 'Scarlet OHara', 'Rua doa Ventos, 223 - Georgia');
INSERT INTO paciente VALUES (914246311589237, '01/01/1951', 'AB-', 'F', 'Diana Wonder', 'Rua Hipolita, 555 - Wonder Woman');
INSERT INTO paciente VALUES (634552692824295, '28/07/1950', 'O+', 'M', 'Sherlock Holmes', 'Rua Baker Street, 221B - Londres');
INSERT INTO paciente VALUES (356178868769718, '22/01/1980', 'O+', 'F', 'Hellen Ripley', 'Rua extraterrestre, 456 - Alien');
INSERT INTO paciente VALUES (668949745996882, '24/10/1930', 'A+', 'F', 'Elisabeth Bennet', 'Rua do Orgulho, 777 - Meryton');
INSERT INTO paciente VALUES (921626444788487, '06/08/1925', 'AB+', 'M', 'Fitzwilliam Darcy', 'Rua Preconceito, 1152 - Londres');

INSERT INTO medico VALUES (2124785966,'Dr. Gregory House','Infectologista');
INSERT INTO medico VALUES (1231735482,'Dra. Meredith Gray','Clinica Geral');
INSERT INTO medico VALUES (7443437648,'Dr. Doug Ross','Cardiologista');
INSERT INTO medico VALUES (8434168364,'Dr. Patch Adams','Oncologista');
INSERT INTO medico VALUES (4948252143,'Dr. Shaun Murphy','Cirurgiao');
INSERT INTO medico VALUES (4263236949,'Dr. William Halstead','Clinico Geral');
INSERT INTO medico VALUES (8936334332,'Dra. Natalie Manning','Pediatra');
INSERT INTO medico VALUES (9399688874,'Dr. Jasmes Wilson','Oncologista');
INSERT INTO medico VALUES (6579541248,'Dr. Robert Chase','Ortopedista');
INSERT INTO medico VALUES (9838128485,'Dr. Eric Forman','Neurologista');
INSERT INTO medico VALUES (8645786271,'Dr. Mario Game','Dentista');
INSERT INTO medico VALUES (4743223273,'Dra. Miranda Bailey','Cirurgia');
INSERT INTO medico VALUES (9731536185,'Dr. Owen Hunt','Clinico Geral');
INSERT INTO medico VALUES (9812956238,'Dr. Alex Karev','Ginecologista');
INSERT INTO medico VALUES (1959368899,'Dr. Derek Shepard','Clinico Geral');
INSERT INTO medico VALUES (1777187758,'Dra. Arizona Robberts','Pediatra');
INSERT INTO medico VALUES (2483744889,'Dra. Amelia Shepard','Clinica Geral');
INSERT INTO medico VALUES (7361896197,'Dra. Callie Torres','Ortopedista');
INSERT INTO medico VALUES (2219158622,'Dra. Cristina Yang','Cardiologista');
INSERT INTO medico VALUES (8838791164,'Dra. Lucy Fields','Ginecologista / Obstetra');
INSERT INTO medico VALUES (4436273627,'Dra. Nicole Hermann','Ginecologista / Obstetra');
INSERT INTO medico VALUES (7471469661,'Dr. Raj Seem','Psiquiatra');
INSERT INTO medico VALUES (6162837483,'Dra. Lisa Cudy','Endocrinologista');
INSERT INTO medico VALUES (6982992173,'Dra. Alisson Cameron','Imunologista');
INSERT INTO medico VALUES (1525342166,'Dr. Cristopher Taub','Clinico Geral');
INSERT INTO medico VALUES (6619586424,'Dra. Suely Rocha','Fonoaudiologia');
INSERT INTO medico VALUES (8347231692,'Dr. Allan Kardec','Terapia Ocupacional');
INSERT INTO medico VALUES (2315418343,'Dr. Allan Moore','Fisioterapia');
INSERT INTO medico VALUES (4351994117,'Dra. Cristina Cairo','Nutricionista');
INSERT INTO medico VALUES (1733155758,'Dr. Bruce Wayne','Clinico Geral');

INSERT INTO agenda VALUES (0,'12/10/2018 16:42:00',1733155758,841128369635315);
INSERT INTO agenda VALUES (1,'13/12/2018 17:40:00',6162837483,198517168585923);
INSERT INTO agenda VALUES (2,'29/11/2018 13:20:00',7361896197,524992421926776);
INSERT INTO agenda VALUES (3,'20/10/2018 14:32:00',9812956238,766522852297989);
INSERT INTO agenda VALUES (4,'11/11/2018 17:49:00',1777187758,356178868769718);
INSERT INTO agenda VALUES (5,'20/11/2018 14:34:00',2483744889,854712846177183);
INSERT INTO agenda VALUES (6,'15/12/2018 16:24:00',9812956238,524992421926776);
INSERT INTO agenda VALUES (7,'26/10/2018 16:48:00',8645786271,356178868769718);
INSERT INTO agenda VALUES (8,'26/10/2018 14:46:00',2483744889,749746627677471);
INSERT INTO agenda VALUES (9,'24/11/2018 12:18:00',2315418343,921626444788487);
INSERT INTO agenda VALUES (10,'26/10/2018 17:47:00',6162837483,925641385132192);
INSERT INTO agenda VALUES (11,'10/11/2018 12:53:00',1525342166,587617226638912);
INSERT INTO agenda VALUES (12,'13/10/2018 12:18:00',1231735482,914246311589237);
INSERT INTO agenda VALUES (13,'27/12/2018 14:47:00',7361896197,724247747215675);
INSERT INTO agenda VALUES (14,'23/11/2018 13:26:00',4436273627,957997554249155);
INSERT INTO agenda VALUES (15,'29/12/2018 14:44:00',6982992173,957997554249155);
INSERT INTO agenda VALUES (16,'29/12/2018 10:14:00',8838791164,181159416545178);
INSERT INTO agenda VALUES (17,'25/10/2018 11:40:00',2483744889,827819483589489);
INSERT INTO agenda VALUES (18,'10/11/2018 11:40:00',4263236949,914246311589237);
INSERT INTO agenda VALUES (19,'20/12/2018 16:46:00',6982992173,726849344135721);
INSERT INTO agenda VALUES (20,'16/11/2018 11:28:00',6162837483,742422663163335);
INSERT INTO agenda VALUES (21,'17/11/2018 15:29:00',6162837483,737796369586791);
INSERT INTO agenda VALUES (22,'26/11/2018 11:40:00',1231735482,854712846177183);
INSERT INTO agenda VALUES (23,'15/12/2018 10:28:00',1525342166,661797772751194);
INSERT INTO agenda VALUES (24,'21/11/2018 12:25:00',2315418343,921626444788487);
INSERT INTO agenda VALUES (25,'14/12/2018 13:40:00',6162837483,356178868769718);
INSERT INTO agenda VALUES (26,'11/10/2018 14:20:00',6982992173,661797772751194);
INSERT INTO agenda VALUES (27,'30/11/2018 14:30:00',8347231692,755665351279323);
INSERT INTO agenda VALUES (28,'20/10/2018 13:59:00',8936334332,766522852297989);
INSERT INTO agenda VALUES (29,'14/11/2018 15:57:00',9838128485,668949745996882);

INSERT INTO consulta VALUES (1,1,
	'Nao possui alergias a nenhum tipo de medicamento e recentemente tomou uma capsula de resfenol para gripe',
	'Em consulta',
	'Paciente reclamou de dores pelo corpo, garganta inflamada e febre alta'
);
INSERT INTO consulta VALUES (2,2,
	'Possui dificuldades para dormir e apresenta quadro psicotico',
	'Em consulta',
	'Paciente reclama de dores de cabe�a severas.'
);
INSERT INTO consulta VALUES (3,3,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente encontra-se em estado febril'
);
INSERT INTO consulta VALUES (4,4,
	'Nao possui alergias e recentemente fez uma cirurgia cadiaca',
	'Em consulta',
	'Paciente est� com dores no peito.'
);
INSERT INTO consulta VALUES (5,5,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em espera',
	'Paciente reclama de fraqueza e dores de cabe�a'
);
INSERT INTO consulta VALUES (6,6,
	'Possui alergia a pnicilina',
	'Em espera',
	'Paciente est� passando por consulta de rotina'
);
INSERT INTO consulta VALUES (7,7,
	'N�o possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente reclama de dores no ciatico.'
);
INSERT INTO consulta VALUES (8,8,
	'Não possui alergias a nenhum tipo de medicamento, passou por uma cirurgia para corre��o do f�mur ap�s um acidente',
	'Em espera',
	'Paciente reclama de muitas dores pelo corpo'
);
INSERT INTO consulta VALUES (9,9,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente reclamou de garganta inflamada.'
);
INSERT INTO consulta VALUES (10,10,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em espera',
	'Paciente quebrou o pe e sera encaminhado ao ortopedista'
);
INSERT INTO consulta VALUES (11,11,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Aguardando chamada',
	'Paciente reclamou de dores fortes na barriga'
);
INSERT INTO consulta VALUES (12,12,
	'Paciente toma medicamentos continuos para pressao e coracao',
	'Em consulta',
	'Paciente esta em retorno de cirurgia'
);
INSERT INTO consulta VALUES (13,13,
	'Paciente tem press�o alta e faz uso de remedio continuo',
	'Em espera',
	'Paciente reclamou de dores de cabe�a'
);
INSERT INTO consulta VALUES (14,14,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Aguardando camada',
	'Paciente precisa de cirurgia para extra�ao do dente do siso'
);
INSERT INTO consulta VALUES (15,15,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em espera',
	'Paciente reclama de fortes dores no estomago e azia'
);
INSERT INTO consulta VALUES (16,16,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente est� com sinusite e um leve resfriado'
);
INSERT INTO consulta VALUES (17,17,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente reclamou de dores pelo corpo, garganta inflamada e febre alta'
);
INSERT INTO consulta VALUES (18,18,
	'Possui alergia a penicilina',
	'Em consulta',
	'Paciente reclamou de dores pelo corpo, garganta inflamada'
);
INSERT INTO consulta VALUES (19,19,
	'Possui leve alergia a anti-inflamatorio',
	'Em espera',
	'Paciente reclamou de garganta inflamada'
);
INSERT INTO consulta VALUES (20,20,
	'Recentemente tomou uma capsula de dipirona com uma leve reacao alegica',
	'Em consulta',
	'Paciente reclamou de febre alta'
);
INSERT INTO consulta VALUES (21,21,
	'Nao possui alergias a nenhum tipo de medicamento e recentemente tomou uma capsula de resfenol para gripe',
	'Aguardando chamada',
	'Paciente reclamou de dores pelo corpo, garganta inflamada e febre alta'
);
INSERT INTO consulta VALUES (22,22,
	'Nao possui alergias a nenhum tipo de medicamento e recentemente tomou uma capsula de resfenol para gripe',
	'Em consulta',
	'Paciente reclamou de dores pelo corpo, garganta inflamada e febre alta'
);
INSERT INTO consulta VALUES (23,23,
	'Alergia a penicilina e dipirona',
	'Em espera',
	'Paciente reclamou de dores pelo corpo e manchas vermelhas'
);
INSERT INTO consulta VALUES (24,24,
	'Nao possui alergias a nenhum tipo de medicamento e recentemente tomou uma capsula de resfenol para gripe',
	'Em consulta',
	'Paciente reclamou de febre alta'
);
INSERT INTO consulta VALUES (25,25,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente reclamou de dores pelo corpo e sangramento pelos olhos'
);
INSERT INTO consulta VALUES (26,26,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em espera',
	'Paciente reclamou de dores no intestino'
);
INSERT INTO consulta VALUES (27,27,
	'Nao possui alergias a nenhum tipo de medicamento e recentemente tomou uma capsula de resfenol para gripe',
	'Em consulta',
	'Reclamou de hemorroida'
);
INSERT INTO consulta VALUES (28,28,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em espera',
	'Paciente reclamou de pequenas protuberancias nas mucosas'
);
INSERT INTO consulta VALUES (29,29,
	'Possui alergia a homeprazol',
	'Em consulta',
	'Paciente reclamou de dor no estomago'
);
INSERT INTO consulta VALUES (30,30,
	'Nao possui alergias a nenhum tipo de medicamento',
	'Em consulta',
	'Paciente reclamou de estar feliz'
);

INSERT INTO receita VALUES (1,1,'Via oral, 10ml a cada oito horas','diclofenaco');
INSERT INTO receita VALUES (2,2,'Via oral, 1L ao dia','Risperidona');
INSERT INTO receita VALUES (3,3,'Via oral, 10ml ao dia','Dipirona');
INSERT INTO receita VALUES (4,4,'Via oral, 5ml duas vezes ao dia','Rivotril');
INSERT INTO receita VALUES (5,5,'Via oral, 8ml','Profenid');
INSERT INTO receita VALUES (6,6,'Via oral, 10ml','Nimesulida 100 mg');
INSERT INTO receita VALUES (7,7,'Via oral, 10ml uma vez por semana na UBS','Olanzapina');
INSERT INTO receita VALUES (8,8,'Via oral, 5ml generico duas vezes ao dia','Aristab');
INSERT INTO receita VALUES (9,9,'Via oral, 5ml duas vezes ao dia','Rivotril');
INSERT INTO receita VALUES (10,10,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (11,11,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (12,12,'Via oral, 10ml ao dia','Dipirona');
INSERT INTO receita VALUES (13,13,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (14,14,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (15,15,'Via oral, 1L ao dia','Risperidona');
INSERT INTO receita VALUES (16,16,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (17,17,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (18,18,'Via oral, 10ml ao dia','Dipirona');
INSERT INTO receita VALUES (19,19,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (20,20,'Via oral, 5ml duas vezes ao dia','Rivotril');
INSERT INTO receita VALUES (21,21,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (22,22,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (23,23,'Via oral, 10ml','Nimesulida 100 mg');
INSERT INTO receita VALUES (24,24,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (25,25,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (26,26,'Via oral, 10ml','Nimesulida 100 mg');
INSERT INTO receita VALUES (27,27,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (28,28,'Via oral, 10ml uma vez por semana na UBS','Olanzapina');
INSERT INTO receita VALUES (29,29,'Via oral, 5ml duas vezes ao dia','Metamizol');
INSERT INTO receita VALUES (30,30,'Via oral, 10ml uma vez por semana na UBS','Olanzapina');