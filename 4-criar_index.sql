-- Índice para a coluna 'NomeAluno' e 'SobrenomeAluno' e 'TelefoneAluno' na tabela 'Matricula'
CREATE INDEX idx_matricula_aluno ON Matrícula (NomeAluno, SobrenomeAluno, TelefoneAluno);

-- Índice para a coluna 'PeriodoLetivo' na tabela 'OfertaDisciplina'
CREATE INDEX idx_ofertadisciplina_periodo ON OfertaDisciplina (PeríodoLetivo, NomeDisciplina);

-- Índice para a coluna 'NomeProfessor', 'SobrenomeProfessor' e 'TelefoneProfessor' na tabela 'OfertaDisciplina'
CREATE INDEX idx_ofertadisciplina_professor ON OfertaDisciplina (NomeProfessor, SobrenomeProfessor, TelefoneProfessor);

-- Índice para a coluna 'NomeCurso' na tabela 'Curso'
CREATE INDEX idx_curso_nomecurso ON Curso (NomeCurso);

-- Índice para a coluna 'NomeDisciplina' e 'PeriodoLetivo' na tabela 'Matricula'
CREATE INDEX idx_matricula_disciplina_periodo ON Matrícula (NomeDisciplina, PeríodoLetivo);

-- Índice para a coluna 'CodigoCurso' na tabela 'Disciplina'
CREATE INDEX idx_disciplina_codigocurso ON Disciplina (CódigoCurso);