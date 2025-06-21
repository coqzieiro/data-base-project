CREATE TABLE Departamento (
  CodigoDepartamento SERIAL PRIMARY KEY,
  NomeDepartamento VARCHAR(100) NOT NULL,
  NomeProfessorChefe VARCHAR(50),
  SobrenomeProfessorChefe VARCHAR(50),
  TelefoneProfessorChefe VARCHAR(20)
);

CREATE TABLE Curso (
  CodigoCurso SERIAL PRIMARY KEY,
  NomeCurso VARCHAR(100) NOT NULL,
  CodigoDepartamento INTEGER NOT NULL,  -- Referência ao Departamento
  NivelEnsino VARCHAR(20),
  CargaHorariaTotal INTEGER,
  NumeroVagas INTEGER,
  Ementa TEXT,
  SalaPadrao VARCHAR(20),
  FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(CodigoDepartamento)
);

CREATE TABLE Disciplina (
  NomeDisciplina VARCHAR(100) PRIMARY KEY,
  CodigoCurso INTEGER NOT NULL,  -- Referência ao Curso
  AulasSemanais INTEGER,
  MaterialDidatico TEXT,
  FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso)
);

CREATE TABLE PreRequisitos (
  CodigoCurso INTEGER NOT NULL,
  CodigoDisciplina VARCHAR(100) NOT NULL,
  PRIMARY KEY (CodigoCurso, CodigoDisciplina),
  FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso),
  FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

CREATE TABLE RegrasCurso (
  CodigoCurso INTEGER NOT NULL,
  FrequenciaMinima DECIMAL(5,2),
  CritériosAprovacao TEXT,
  PRIMARY KEY (CodigoCurso),
  FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso)
);

-- Tabela OfertaDisciplina
CREATE TABLE OfertaDisciplina (
  NomeDisciplina VARCHAR(100),
  NomeProfessor VARCHAR(50),
  SobrenomeProfessor VARCHAR(50),
  TelefoneProfessor VARCHAR(20),
  PeriodoLetivo VARCHAR(20),
  Sala VARCHAR(20),
  Capacidade INTEGER,
  PRIMARY KEY (NomeDisciplina, NomeProfessor, SobrenomeProfessor, TelefoneProfessor, PeriodoLetivo),
  FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

-- Tabela Usuário
CREATE TABLE Usuario (
  Nome VARCHAR(50),
  Sobrenome VARCHAR(50),
  Telefone VARCHAR(20),
  DataNascimento DATE,
  Sexo CHAR(1),
  Email VARCHAR(100) UNIQUE,
  Senha VARCHAR(64),
  NomeUnidade VARCHAR(100),
  Localidade VARCHAR(100),
  PRIMARY KEY (Nome, Sobrenome, Telefone)
);

CREATE TABLE EnderecoUsuario (
  NomeUsuario VARCHAR(50),
  SobrenomeUsuario VARCHAR(50),
  TelefoneUsuario VARCHAR(20),
  Rua VARCHAR(100),
  Cidade VARCHAR(100),
  CEP VARCHAR(20),
  PRIMARY KEY (NomeUsuario, SobrenomeUsuario, TelefoneUsuario),
  FOREIGN KEY (NomeUsuario, SobrenomeUsuario, TelefoneUsuario) REFERENCES Usuario(Nome, Sobrenome, Telefone)
);

CREATE TABLE Professor (
  Nome VARCHAR(50),
  Sobrenome VARCHAR(50),
  Telefone VARCHAR(20),
  AreaEspecializacao VARCHAR(100),
  Titulacao VARCHAR(50),
  PRIMARY KEY (Nome, Sobrenome, Telefone)
);

CREATE TABLE Aluno (
  NomeAluno VARCHAR(50),
  SobrenomeAluno VARCHAR(50),
  TelefoneAluno VARCHAR(20),
  PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno)
);

CREATE TABLE FuncionarioAdministrativo (
  Nome VARCHAR(50),
  Sobrenome VARCHAR(50),
  Telefone VARCHAR(20),
  PRIMARY KEY (Nome, Sobrenome, Telefone)
);

CREATE TABLE Unidade (
  NomeUnidade VARCHAR(100) PRIMARY KEY
);

CREATE TABLE LocalidadeUnidade (
  NomeUnidade VARCHAR(100),
  Cidade VARCHAR(100),
  Estado VARCHAR(100),
  Pais VARCHAR(100),
  PredioOuBloco VARCHAR(100),
  PRIMARY KEY (NomeUnidade, Cidade, Estado),
  FOREIGN KEY (NomeUnidade) REFERENCES Unidade(NomeUnidade)
);

CREATE TABLE InfraestruturaCurso (
  CodigoCurso INTEGER,
  PRIMARY KEY (CodigoCurso),
  FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso)
);

CREATE TABLE DemandaCurso (
  CodigoCurso INTEGER,
  LaboratorioInformatica BOOLEAN,
  Projeto BOOLEAN,
  LousaDigital BOOLEAN,
  PRIMARY KEY (CodigoCurso),
  FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso)
);

CREATE TABLE ProfessorDisciplina (
  NomeProfessor VARCHAR(50),
  SobrenomeProfessor VARCHAR(50),
  TelefoneProfessor VARCHAR(20),
  NomeDisciplina VARCHAR(100),
  PRIMARY KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor, NomeDisciplina),
  FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

CREATE TABLE Mensagens (
  Remetente_Nome VARCHAR(50),
  Remetente_Sobrenome VARCHAR(50),
  Remetente_Telefone VARCHAR(20),
  Destinatario_Nome VARCHAR(50),
  Destinatario_Sobrenome VARCHAR(50),
  Destinatario_Telefone VARCHAR(20),
  Timestamp TIMESTAMP,
  Texto TEXT,
  PRIMARY KEY (Remetente_Nome, Remetente_Sobrenome, Remetente_Telefone, Destinatario_Nome, Destinatario_Sobrenome, Destinatario_Telefone, Timestamp)
);

CREATE TABLE Avisos (
  Remetente_Nome VARCHAR(50),
  Remetente_Sobrenome VARCHAR(50),
  Remetente_Telefone VARCHAR(20),
  Destinatario_Nome VARCHAR(50),
  Destinatario_Sobrenome VARCHAR(50),
  Destinatario_Telefone VARCHAR(20),
  Timestamp TIMESTAMP,
  Texto TEXT,
  PRIMARY KEY (Remetente_Nome, Remetente_Sobrenome, Remetente_Telefone, Destinatario_Nome, Destinatario_Sobrenome, Destinatario_Telefone, Timestamp)
);

CREATE TABLE Matricula (
  NomeAluno VARCHAR(50),
  SobrenomeAluno VARCHAR(50),
  TelefoneAluno VARCHAR(20),
  NomeDisciplina VARCHAR(100),
  PeriodoLetivo VARCHAR(20),
  DataMatricula DATE,
  Status VARCHAR(20),
  Notas TEXT,
  BolsaOuDesconto TEXT,
  Confirmacao BOOLEAN,
  DataLimiteConfirmacao DATE,
  Taxas DECIMAL(10, 2),
  PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno, NomeDisciplina, PeriodoLetivo),
  FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

CREATE TABLE Avaliacao (
  NomeAluno VARCHAR(50),
  SobrenomeAluno VARCHAR(50),
  TelefoneAluno VARCHAR(20),
  NomeDisciplina VARCHAR(100),
  NomeProfessor VARCHAR(50),
  SobrenomeProfessor VARCHAR(50),
  TelefoneProfessor VARCHAR(20),
  PeriodoLetivo VARCHAR(20),
  Comentario TEXT,
  PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno, NomeDisciplina, NomeProfessor, SobrenomeProfessor, TelefoneProfessor, PeriodoLetivo)
);

CREATE TABLE NotasAvaliacao (
  NomeAluno VARCHAR(50),
  SobrenomeAluno VARCHAR(50),
  TelefoneAluno VARCHAR(20),
  NomeDisciplina VARCHAR(100),
  PeriodoLetivo VARCHAR(20),
  TipoNota VARCHAR(50),
  Nota INTEGER,
  PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno, NomeDisciplina, PeriodoLetivo, TipoNota),
  FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);