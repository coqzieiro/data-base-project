-- Unidade
CREATE TABLE Unidade (
    NomeUnidade VARCHAR(100),
    Localidade VARCHAR(100),
    PRIMARY KEY (NomeUnidade, Localidade)
);

-- Usuário
CREATE TABLE Usuário (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    DataNascimento DATE,
    Endereço VARCHAR(200),
    Sexo CHAR(1),
    Email VARCHAR(100) UNIQUE,
    Senha VARCHAR(64),
    NomeUnidade VARCHAR(100),
    Localidade VARCHAR(100),
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (NomeUnidade, Localidade) 
        REFERENCES Unidade(NomeUnidade, Localidade)
);

-- Professor
CREATE TABLE Professor (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    ÁreaEspecialização VARCHAR(100),
    Titulação VARCHAR(50),
    PRIMARY KEY (Nome, Sobrenome, Telefone)
);

-- Departamento
CREATE TABLE Departamento (
    CódigoDepartamento INTEGER PRIMARY KEY,
    NomeDepartamento VARCHAR(100) NOT NULL UNIQUE, 
    NomeProfessorChefe VARCHAR(50),
    SobrenomeProfessorChefe VARCHAR(50),
    TelefoneProfessorChefe VARCHAR(20),
    FOREIGN KEY (NomeProfessorChefe, SobrenomeProfessorChefe, TelefoneProfessorChefe) 
        REFERENCES Professor(Nome, Sobrenome, Telefone)
);

-- Curso
CREATE TABLE Curso (
    CódigoCurso INTEGER PRIMARY KEY,
    NomeCurso VARCHAR(100) NOT NULL,
    NomeDepartamento VARCHAR(100),
    NívelEnsino VARCHAR(20),
    CargaHoráriaTotal INTEGER,
    NúmeroVagas INTEGER,
    Ementa TEXT,
    PréRequisitos VARCHAR(100),
    SalaPadrão VARCHAR(20),
    RegraCurso VARCHAR(100),
    FOREIGN KEY (NomeDepartamento) REFERENCES Departamento(NomeDepartamento)
);

-- Disciplina
CREATE TABLE Disciplina (
    NomeDisciplina VARCHAR(100) PRIMARY KEY,
    CódigoCurso INTEGER,
    AulasSemanais INTEGER,
    MaterialDidático TEXT,
    FOREIGN KEY (CódigoCurso) REFERENCES Curso(CódigoCurso)
);

-- OfertaDisciplina
CREATE TABLE OfertaDisciplina (
    NomeDisciplina VARCHAR(100),
    NomeProfessor VARCHAR(50),
    SobrenomeProfessor VARCHAR(50),
    TelefoneProfessor VARCHAR(20),
    PeríodoLetivo VARCHAR(20),
    Sala VARCHAR(20),
    Capacidade INTEGER,
    PRIMARY KEY (NomeDisciplina, NomeProfessor, SobrenomeProfessor, TelefoneProfessor, PeríodoLetivo),
    FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina),
    FOREIGN KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor) 
        REFERENCES Professor(Nome, Sobrenome, Telefone)
);

-- InfraestruturaCurso
CREATE TABLE InfraestruturaCurso (
    CódigoCurso INTEGER,
    Demandas VARCHAR(100),
    PRIMARY KEY (CódigoCurso, Demandas),
    FOREIGN KEY (CódigoCurso) REFERENCES Curso(CódigoCurso)
);

-- ProfessorDisciplina
CREATE TABLE ProfessorDisciplina (
    NomeProfessor VARCHAR(50),
    SobrenomeProfessor VARCHAR(50),
    TelefoneProfessor VARCHAR(20),
    NomeDisciplina VARCHAR(100),
    PRIMARY KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor, NomeDisciplina),
    FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina),
    FOREIGN KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor) 
        REFERENCES Professor(Nome, Sobrenome, Telefone)
);

-- Aluno
CREATE TABLE Aluno (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    PRIMARY KEY (Nome, Sobrenome, Telefone)
);

-- Matrícula
CREATE TABLE Matrícula (
    NomeAluno VARCHAR(50),
    SobrenomeAluno VARCHAR(50),
    TelefoneAluno VARCHAR(20),
    NomeDisciplina VARCHAR(100),
    NomeProfessor VARCHAR(50),
    SobrenomeProfessor VARCHAR(50),
    TelefoneProfessor VARCHAR(20),
    PeríodoLetivo VARCHAR(20),
    DataMatrícula DATE,
    Estado VARCHAR(20),
    Notas TEXT,
    BolsaOuDesconto TEXT,
    Confirmação BOOLEAN,
    DataLimiteConfirmação DATE,
    Taxas DECIMAL(10,2),
    PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno, NomeDisciplina, NomeProfessor, SobrenomeProfessor, TelefoneProfessor, PeríodoLetivo),
    FOREIGN KEY (NomeAluno, SobrenomeAluno, TelefoneAluno) 
        REFERENCES Aluno(Nome, Sobrenome, Telefone),
    FOREIGN KEY (NomeDisciplina) 
        REFERENCES Disciplina(NomeDisciplina),
    FOREIGN KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor) 
        REFERENCES Professor(Nome, Sobrenome, Telefone)
);

-- Mensagens
CREATE TABLE Mensagens (
    Remetente_Nome VARCHAR(50),
    Remetente_Sobrenome VARCHAR(50),
    Remetente_Telefone VARCHAR(20),
    Destinatario_Nome VARCHAR(50),
    Destinatario_Sobrenome VARCHAR(50),
    Destinatario_Telefone VARCHAR(20),
    Timestampe TIMESTAMP,
    Texto TEXT,
    PRIMARY KEY (Remetente_Nome, Remetente_Sobrenome, Remetente_Telefone, Destinatario_Nome, Destinatario_Sobrenome, Destinatario_Telefone, Timestampe)
);

-- Avisos
CREATE TABLE Avisos (
    Remetente_Nome VARCHAR(50),
    Remetente_Sobrenome VARCHAR(50),
    Remetente_Telefone VARCHAR(20),
    Destinatario_Nome VARCHAR(50),
    Destinatario_Sobrenome VARCHAR(50),
    Destinatario_Telefone VARCHAR(20),
    Timestampe TIMESTAMP,
    Texto TEXT,
    PRIMARY KEY (Remetente_Nome, Remetente_Sobrenome, Remetente_Telefone, Destinatario_Nome, Destinatario_Sobrenome, Destinatario_Telefone, Timestampe)
);

-- Avaliação
CREATE TABLE Avaliação (
    NomeAluno VARCHAR(50),
    SobrenomeAluno VARCHAR(50),
    TelefoneAluno VARCHAR(20),
    NomeDisciplina VARCHAR(100),
    NomeProfessor VARCHAR(50),
    SobrenomeProfessor VARCHAR(50),
    TelefoneProfessor VARCHAR(20),
    PeríodoLetivo VARCHAR(20),
    Comentário TEXT,
    NotaDidática INTEGER,
    NotaMaterial INTEGER,
    NotaConteúdo INTEGER,
    NotaInfraestrutura INTEGER,
    PRIMARY KEY (NomeAluno, SobrenomeAluno, TelefoneAluno, NomeDisciplina, NomeProfessor, SobrenomeProfessor, TelefoneProfessor, PeríodoLetivo),
    FOREIGN KEY (NomeAluno, SobrenomeAluno, TelefoneAluno) 
        REFERENCES Aluno(Nome, Sobrenome, Telefone),
    FOREIGN KEY (NomeDisciplina) 
        REFERENCES Disciplina(NomeDisciplina),
    FOREIGN KEY (NomeProfessor, SobrenomeProfessor, TelefoneProfessor) 
        REFERENCES Professor(Nome, Sobrenome, Telefone)
);
