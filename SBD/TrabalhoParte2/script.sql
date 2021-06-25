create schema parte2;

set search_path to parte2;

create table turma(
	tipoturma integer,
	ano integer not null,
	localturma varchar(30),
	semestre integer not null,
	primary key (tipoturma)
);

create table faculdade(
	siglafac varchar(10),
	blocofac varchar(10) not null,
	nprofessores integer,
	nalunos integer,
	orcamento integer,
	idprof integer,
	sigladisciplina varchar(30),
	primary key (siglafac)
);

create table professores(
	idprof integer,
	salario numeric(2) not null,
	nomeprof varchar(50) not null,
	dataprof date not null,
	siglafac varchar(10),
	primary key (idprof)
);

create table disciplina(
	sigladisciplina varchar(30),
	nomedisciplina varchar(30) not null,
	ncreditos integer not null,
	tipoturma integer,
	primary key (sigladisciplina)
);

alter table faculdade add foreign key (idprof) references professores (idprof);
alter table faculdade add foreign key (sigladisciplina) references disciplina(sigladisciplina);
alter table professores add foreign key (siglafac) references faculdade(siglafac);
alter table disciplina add foreign key (tipoturma) references turma(tipoturma);

create table alunos(
	idaluno integer,
	nomealuno varchar(50) not null,
	datanascimento date not null,
	cra numeric(2),
	telefone varchar(30),
	siglafac varchar(10),
	primary key (idaluno),
	foreign key (siglafac) references faculdade(siglafac)
);

create table turmaprofs(
	idprof integer,
	sigladisciplina varchar(30),
	foreign key (idprof) references professores(idprof),
	foreign key (siglaDisciplina) references disciplina(siglaDisciplina)
);

create table turmaaluno(
	idaluno integer,
	tipoturma integer,
	foreign key (idaluno) references alunos(idaluno),
	foreign key (tipoturma) references turma(tipoturma)
);

create table prereqdisciplina(
	sigladisciplina varchar(30),
	sigladisciplinaprereq varchar(30),
	foreign key (sigladisciplina) references disciplina(sigladisciplina),
	foreign key (sigladisciplinaprereq) references disciplina(sigladisciplina)
);

create table salasdeaula(
	nomebloco varchar(30),
	numerosala integer,
	capacidadesala integer,
	siglafac varchar(10),
	primary key (numerosala),
	foreign key (siglafac) references faculdade(siglafac)
);

create table notafalta(
	sigladisciplina varchar(30),
	idaluno integer,
	notaaluno numeric(2),
	faltaaluno integer,
	foreign key (sigladisciplina) references disciplina(sigladisciplina),
	foreign key (idaluno) references alunos(idaluno)
);

create table iniciacaocientifica(
	idaluno integer,
	idprof integer,
	foreign key (idaluno) references alunos(idaluno),
	foreign key (idprof) references professores(idprof)
);

create table universidade(
	numerosala integer,
	siglafac varchar(10),
	foreign key (numerosala) references salasdeaula(numerosala),
	foreign key (siglafac) references faculdade(siglafac)
);
