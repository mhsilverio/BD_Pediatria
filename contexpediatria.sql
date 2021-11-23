DROP DATABASE IF EXISTS contexpediatria;

/* Milena Heloísa de Amorim Silvério */

create database contexpediatria;
use contexpediatria;

create table Responsavel(
	cod_resp int, 
	nome_resp varchar(100), 
	CPF_resp char(11),
	email_resp varchar(100),
	endereço_resp varchar(200),
	telefone_resp varchar(11),
    data_nasc_resp date,
	Primary key (cod_resp)
);
Insert into Responsavel values (1, 'Rene Silverio', '12478963254', 'rene-silverio@responsavel.com', 'Rua dos Girassois, 140', '329873935', '1967-05-22');
Insert into Responsavel values (2, 'Selma Silverio', '12563998745', 'selma-silverio@responsavel.com', 'Rua Jasmim, 2' , '412378965', '1969-02-05');
Insert into Responsavel values (3, 'Letícia Gabrielle', '14564987453', 'leticia-gabrielle@responsavel.com', 'Rua das Margaridas, 250', '987654321', '1994-09-02');
Insert into Responsavel values (4, 'Guilherme Gabriel', '14558996332', 'guilherme-gabriel@responsavel.com', 'Rua Rosas Brancas, 78', '741852963', '1998-02-03');
Insert into Responsavel values (5, 'Evaneza Muchon', '12345678989', 'evaneza-muchon@responsavel.com', 'Rua dos Cactos, 14', '951753862', '1987-04-06');
Insert into Responsavel values (6, 'Zelinda Amorim', '98765432112', 'zelinda-amorim@responsavel.com',  'Rua Amarilis, 1001', '951357486', '1975-12-01');

create table Pediatra(
	cod_pediatra int,
	nome_pediatra varchar(100),
	CPF_pediatra char(11),
	CRM char(10) not null, 
	email_pediatra varchar(100),
	telefone_pediatra varchar(11),
	Primary key (cod_pediatra)
);
Insert into Pediatra values (1, 'Milena Silvério', '12796325874', '1111111111', 'milenasilverio@pediatra.com', '11111111111');
Insert into Pediatra values (2, 'Jake Smith', '14569874523', '2222222222', 'jakesmith@pediatra.com', '11111111111');
Insert into Pediatra values (3, 'Ryan Gold', '12365478998', '3333333333', 'ryangold@pediatra.com', '11111111111');
Insert into Pediatra values (4, 'Zelinda Ferreira', '1789632545', '4444444444', 'zelinda@pediatra.com', '11111111111');
Insert into Pediatra values (5, 'Pedro Amorim', '12365478995', '5555555555', 'pedroamorim@pediatra.com', '11111111111');
Insert into Pediatra values (6, 'Thiago Andrade', '12336598745', '6666666666', 'thiagoandrade@pediatra.com', '11111111111');

CREATE TABLE Crianca(
	cod_paciente int,
	nome_crianca varchar(100),
	data_nasc date,
	Primary key (cod_paciente)
);
Insert into Crianca values (1, 'Mateus Ferro', '2009-05-02');
Insert into Crianca values (2, 'Ricardo Godoi', '2010-04-03');
Insert into Crianca values (3, 'Carlos Eduardo', '2016-07-09');
Insert into Crianca values (4, 'João Gabriel', '2018-01-06');
Insert into Crianca values (5, 'Henrique Maldonado', '2017-08-09');
Insert into Crianca values (6, 'João Pedro', '2017-12-08');

CREATE TABLE Resp_Crianca(
	cod_resp int,
    cod_paciente int,
    Primary key (cod_resp, cod_paciente),
    Foreign key (cod_resp) references Responsavel(cod_resp),
    Foreign key (cod_paciente) references Crianca(cod_paciente)
);
Insert into Resp_Crianca values (1, 1);
Insert into Resp_Crianca values (2, 2);
Insert into Resp_Crianca values (3, 3);
Insert into Resp_Crianca values (4, 4);
Insert into Resp_Crianca values (5, 5);
Insert into Resp_Crianca values (6, 6);

CREATE TABLE TipoConsulta(
	cod_tipo int,
    tipo_consulta varchar(100),
    Primary key (cod_tipo)
);
Insert into TipoConsulta values (1, 'Cosulta de emergência');
Insert into TipoConsulta values (2, 'Consulta anual');
Insert into TipoConsulta values (3, 'Consulta mensal');
Insert into TipoConsulta values (4, 'Consulta verificação de exames');

CREATE TABLE Consulta(
	cod_consulta int,
	data_consulta date, 
	cod_tipo int,
	cod_pediatra int,
	cod_paciente int,
	Primary key (cod_consulta),
    Foreign key (cod_tipo) references TipoConsulta(cod_tipo), 
	Foreign key (cod_pediatra) references Pediatra(cod_pediatra), 
	Foreign key (cod_paciente) references Crianca(cod_paciente)
);
Insert into Consulta values (1, '2021-09-13', 1, 1, 1);
Insert into Consulta values (2, '2021-09-08', 2, 2, 2);
Insert into Consulta values (3, '2021-09-14', 1, 1, 3);
Insert into Consulta values (4, '2021-09-02', 3, 4, 4);
Insert into Consulta values (5, '2021-09-07', 4, 5, 5);
Insert into Consulta values (6, '2021-09-08', 1, 6, 6);
 	 
CREATE TABLE Exame(
	cod_exame int,
	descricao_exame varchar (100),
	Primary key (cod_exame)
);
Insert into Exame values (1, 'exame de sangue');
Insert into Exame values (2, 'exame de urina');
Insert into Exame values (3, 'exame de ressonancia');
Insert into Exame values (4, 'exame raio-x');
Insert into Exame values (5, 'exame de sangue');
Insert into Exame values (6, 'exame cardiaco');

CREATE TABLE Convenio(  -- ATRIBUTO MULTIVALORADO
	cod_convenio int,
	nome_conv varchar(20),
	Primary key (cod_convenio)
);
Insert into Convenio values (1, 'Clinipam');
Insert into Convenio values (2, 'Amil');
Insert into Convenio values (3, 'Unimed');
Insert into Convenio values (4, 'SulAmerica'); 

CREATE TABLE Agenda(
	data_exame date,
	resultado varchar(200),
	cod_consulta int,
	cod_exame int,
	convenio int,
	Primary key (cod_consulta, cod_exame),
	Foreign key (cod_consulta) references Consulta(cod_consulta),
	Foreign key (cod_exame) references Exame(cod_exame),
	Foreign key (convenio) references Convenio(cod_convenio)
);
Insert into Agenda values ('2021-09-22', 'colesterol alto', 1, 1, 1);
Insert into Agenda values ('2021-09-23', 'tudo normal', 2, 2, 2);
Insert into Agenda values ('2021-09-19', 'tudo normal', 3, 3, 1);
Insert into Agenda values ('2021-09-18', 'tudo normal', 4, 4, 1);
Insert into Agenda values ('2021-09-17', 'colesteroal alto e vitaminas baixas', 5, 5, 3);
Insert into Agenda values ('2021-09-25', 'tudo normal', 6, 6, 4);

CREATE TABLE Medicamento(
	cod_m int,
	nome_m varchar (100),
	data_fabricacao date,
	data_validade date,
	dosagem varchar(10),
	Primary key (cod_m)
);
Insert into Medicamento values (1, 'dipirona', '2021-07-21', '2021-10-21', '1g');
Insert into Medicamento values (2, 'multigripe', '2021-05-13', '2022-06-13', '500mg');
Insert into Medicamento values (3, 'melhoral', '2021-01-01', '2021-12-12', '250mg');
Insert into Medicamento values (4, 'buscapan', '2021-01-05', '2021-12-01', '500mg');
Insert into Medicamento values (5, 'ferro e cálcio', '2021-09-07', '2021-12-05', '130mg');
Insert into Medicamento values (6, 'vitamina D', '2021-05-06', '2021-06-08', '8000UI');

CREATE TABLE Prescreve(
	receita varchar(100),
	qntidade_m int not null,
	cod_consulta int, 
	cod_m int,
	Primary key (cod_consulta, cod_m),
	Foreign key (cod_consulta) references Consulta(cod_consulta),
	Foreign key (cod_m) references Medicamento(cod_m)
);
Insert into Prescreve values ('tomar 1 vez por dia', 6, 1, 6);
Insert into Prescreve values ('tomar de 6 em 6h', 30, 2, 2);
Insert into Prescreve values ('tomar de 8 em 8 horas', 31, 3, 5);
Insert into Prescreve values ('tomar um dia sim e um dia não', 10, 4, 4);
Insert into Prescreve values ('tomar somente quando sentir dor', 30, 5, 1);
Insert into Prescreve values ('tomar em jejum no período da manhã', 60, 6, 6);

/* -------------------------------------------------------------------------------------- */
-- EXTRAÇÃO DE INFORMAÇÕES DO BANCO DE DADOS

-- 1) Nomes dos pacientes que foram consultados pela pediatra Milena Silvério
SELECT Pediatra.nome_pediatra, Crianca.nome_crianca
FROM Pediatra, Consulta, Crianca
WHERE Consulta.cod_paciente = Crianca.cod_paciente
AND Consulta.cod_pediatra = Pediatra.cod_pediatra
AND Pediatra.nome_pediatra = 'Milena Silvério'
ORDER BY Crianca.nome_crianca;

-- 2) Qual o nome do pediatra que irá fazer a consulta de cada paciente?
SELECT Crianca.nome_crianca, Pediatra.nome_pediatra
FROM Consulta
INNER JOIN Pediatra ON Consulta.cod_pediatra = Pediatra.cod_pediatra
INNER JOIN Crianca on Consulta.cod_paciente = Crianca.cod_paciente;

-- 3) Qual é o nome do responsável pelo paciente cujo nome é Henrique Maldonado?
SELECT Crianca.nome_crianca, Responsavel.nome_resp
FROM Resp_Crianca
INNER JOIN Crianca ON Crianca.cod_paciente = Resp_Crianca.cod_paciente
INNER JOIN Responsavel ON Responsavel.cod_resp = Resp_Crianca.cod_resp
WHERE Crianca.nome_crianca = 'Henrique Maldonado';

-- 4) Qual a data da consulta do paciente cujo nome é Carlos Eduardo?
SELECT Crianca.nome_crianca, Consulta.data_consulta
FROM Crianca, Consulta
WHERE Consulta.cod_paciente = Crianca.cod_paciente
AND Crianca.nome_crianca = 'Carlos Eduardo';

-- 5) Quais são os pacientes que obtiverem um resultado de exame diferente de 'tudo normal'?
SELECT Crianca.nome_crianca
FROM Crianca, Agenda, Consulta
WHERE Agenda.cod_consulta = Consulta.cod_consulta
AND Consulta.cod_paciente = Crianca.cod_paciente
AND Agenda.resultado <> 'tudo normal'
GROUP BY Crianca.nome_crianca;

-- 6) Quais são os exames que o convênio Clinipam está realizando nos pacientes?
SELECT Exame.descricao_exame
FROM Exame, Agenda, Convenio
WHERE Agenda.cod_exame = Exame.cod_exame
AND Agenda.convenio = Convenio.cod_convenio
AND Convenio.nome_conv = 'Clinipam';

-- 7) Que medicamento foi o mais prescrito entre os pacientes?
SELECT Medicamento.nome_m
FROM Medicamento
INNER JOIN Prescreve ON Medicamento.cod_m  = Prescreve.cod_m
GROUP BY Medicamento.nome_m
ORDER BY COUNT(Medicamento.nome_m) DESC
LIMIT 1;

-- 8) Qual é a prescrição dada pelos pediatras quando se é necessário tomar multigripe?
SELECT Prescreve.receita
FROM Prescreve
INNER JOIN Medicamento ON Medicamento.cod_m = Prescreve.cod_m
WHERE Medicamento.nome_m = 'multigripe';

-- 9) Quais são os tipos de consultas que ocorreram no mês 9 (setembro) e quem fez a consulta no hospital pediátrico?
SELECT TipoConsulta.tipo_consulta, Pediatra.nome_pediatra
FROM Consulta, Pediatra, TipoConsulta
WHERE Consulta.cod_pediatra = Pediatra.cod_pediatra
AND TipoConsulta.cod_tipo = Consulta.cod_tipo
AND MONTH(Consulta.data_consulta) = 09
ORDER BY TipoConsulta.tipo_consulta;

-- 10) Quantos meses aproximadamente cada medicamento tem até o seu prazo de validade?
SELECT Medicamento.nome_m, Medicamento.data_fabricacao, Medicamento.data_validade, MONTH(Medicamento.data_validade) - MONTH(Medicamento.data_fabricacao) as meses_ate_validade
FROM Medicamento;

-- 11) NOT IN - 3 TABELAS
-- Quais são exames e suas respectivas datas que não possuem convênio Clinipam?
SELECT Convenio.nome_conv, Exame.descricao_exame, Agenda.data_exame
FROM Agenda
INNER JOIN Convenio ON Agenda.convenio = Convenio.cod_convenio
INNER JOIN Exame ON Exame.cod_exame = Agenda.cod_exame
WHERE Convenio.nome_conv NOT IN (
		SELECT Convenio.nome_conv
        FROM Convenio
        WHERE Convenio.nome_conv = 'Clinipam')
GROUP BY Agenda.data_exame;

-- PRODUTO CARTESIANO - MAIS DE 3 TABELAS
-- 12) Que exame o paciente Mateus Ferro teve que realizar e o seu respectivo resultado?
SELECT Crianca.nome_crianca, Exame.descricao_exame, Agenda.resultado
FROM Exame, Agenda, Convenio, Crianca, Consulta
WHERE Agenda.cod_exame = Exame.cod_exame
AND Agenda.convenio = Convenio.cod_convenio
AND Agenda.cod_consulta = Consulta.cod_consulta
AND Consulta.cod_paciente = Crianca.cod_paciente
AND Crianca.nome_crianca= 'Mateus Ferro';

-- 13) JUNÇÃO (INNER JOIN) - MAIS DE 3 TABELAS
-- Qual o código do exame originada de cada receita prescrita?
SELECT Prescreve.receita, Agenda.cod_exame
FROM Prescreve
INNER JOIN Medicamento ON Medicamento.cod_m = Prescreve.cod_m
INNER JOIN Consulta ON Consulta.cod_consulta = Prescreve.cod_consulta
INNER JOIN Agenda ON Agenda.cod_consulta = Prescreve.cod_consulta;

-- 14) CLÁUSULA HAVING
-- Quais medicamentos em sua prescrição de receita deve-se tomar uma quantidade maior que 10 medicamentos ao total?
SELECT Medicamento.nome_m, Prescreve.qntidade_m
FROM Prescreve, Medicamento
WHERE Prescreve.cod_m = Medicamento.cod_m
HAVING Prescreve.qntidade_m > 10;

-- 15) VIEW 
-- Quantas consultas aconteceram com datas a partir do dia 01/09/2021 cpara crianças com data de aniversário menor que 01/10/2010?
DROP VIEW IF EXISTS CONSU_DELIMITADAS;

CREATE VIEW CONSU_DELIMITADAS AS
SELECT Consulta.cod_consulta, Consulta.cod_paciente
FROM Consulta
WHERE Consulta.data_consulta > '2021-09-08';

SELECT COUNT(*) 
FROM CONSU_DELIMITADAS, Crianca
WHERE CONSU_DELIMITADAS.cod_paciente = Crianca.cod_paciente
AND Crianca.data_nasc < '2010-10-01';
