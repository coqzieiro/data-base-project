-- 1. Índice para a coluna 'NomeAluno' na tabela 'Matricula'
CREATE INDEX idx_nomealuno ON Matricula(NomeAluno);

-- 2. Índice para a coluna 'PeriodoLetivo' na tabela 'OfertaDisciplina'
CREATE INDEX idx_periodoletivo ON OfertaDisciplina(PeriodoLetivo);

-- 3. Índice para a coluna 'NomeProfessor' na tabela 'OfertaDisciplina'
CREATE INDEX idx_nomeprofessor ON OfertaDisciplina(NomeProfessor);

-- 4. Índice para a coluna 'NomeCurso' na tabela 'Curso'
CREATE INDEX idx_nomecurso ON Curso(NomeCurso);

-- 5. Índice para a coluna 'NomeDisciplina' na tabela 'Matricula'
CREATE INDEX idx_nomedisciplina ON Matricula(NomeDisciplina);

-- 6. Índice para a coluna 'CodigoCurso' na tabela 'Disciplina'
CREATE INDEX idx_codigocurso ON Disciplina(CodigoCurso);