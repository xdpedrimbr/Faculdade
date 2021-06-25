CREATE SCHEMA bd_sec;
SET search_path TO bd_sec;

CREATE TABLE empresa(
	idEmpresa integer not null,
	cnpj varchar(20) not null,
	NomeEmpresa varchar(255) not null,
	primary key(idEmpresa)
);

create type estadoLiberacaoEnum as ENUM ('P', 'L');

create table patrocinadora(
	valorPatrocinio varchar(10) not null,
	estadoLiberacao estadoLiberacaoEnum not null,
	dataLiberacao varchar(15) not null,
	idEmpresa integer references empresa(idEmpresa),
	primary key(idEmpresa)
);

create table responsavel(
	idResponsavel integer not null,
	primary key(idResponsavel)
);

create type tipoPessoaEnum as enum('ES','PR', 'EP');

create table pessoa(
    idPessoa integer not null,
    cpf varchar(11) not null,
    nomePessoa varchar(100) not null,
    dataPagamentoInscricao date not null,
    tipoPessoa tipoPessoaEnum not null,
    idEmpresa integer not null,
	idResponsavel integer references responsavel(idResponsavel),
    primary key(idPessoa)
);

create table organizadora(
	idEmpresa integer references empresa(idEmpresa),
	primary key(idEmpresa)
);

create table promotora(
	idEmpresa integer references empresa(idEmpresa),
	primary key(idEmpresa)
);

create table prestadora(
	idEmpresa integer references empresa(idEmpresa),
	idResponsavel integer references responsavel(idResponsavel),
	primary key(idEmpresa)
);

create type estadoServicoEnum as enum('P', 'C', 'E', 'G');

create table servico(
	idServico integer not null,
	descricaoServico varchar(255) not null,
	custoServico varchar(20) not null,
	estadoServico estadoServicoEnum not null,
	dataTerminoServico varchar(20) not null,
	idResponsavel integer references responsavel(idResponsavel),
	primary key(idServico)
);

create table tarefa(
    idTarefa integer not null,
    descricaoTarefa varchar(255) not null,
	idPessoa integer references pessoa(idPessoa),
	idSuperTarefa integer references tarefa(idTarefa),
    primary key(idTarefa)
);

CREATE TABLE inscricao(
    idPessoa integer references pessoa(idPessoa),
	idTarefa integer references tarefa(idTarefa),
	primary key(idPessoa)
);