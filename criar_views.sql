-- 1. Visão para listar todos os alunos e suas respectivas disciplinas
CREATE VIEW vw_alunos_disciplinas AS
SELECT A.NomeAluno, A.SobrenomeAluno, M.NomeDisciplina
FROM Aluno A
JOIN Matricula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno;

-- 2. Visão para calcular a média das notas de cada aluno
CREATE VIEW vw_media_notas AS
SELECT NomeAluno, SobrenomeAluno, AVG(Nota) AS MediaNotas
FROM Matricula
GROUP BY NomeAluno, SobrenomeAluno;

-- 3. Visão para listar os professores e suas disciplinas no período letivo
CREATE VIEW vw_professores_disciplinas AS
SELECT O.NomeProfessor, O.SobrenomeProfessor, O.PeriodoLetivo, D.NomeDisciplina
FROM OfertaDisciplina O
JOIN Disciplina D ON O.NomeDisciplina = D.NomeDisciplina;

-- 4. Visão para listar os alunos com suas respectivas disciplinas e notas
CREATE VIEW vw_alunos_notas AS
SELECT A.NomeAluno, A.SobrenomeAluno, M.NomeDisciplina, M.Notas
FROM Aluno A
JOIN Matricula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno;

-- 5. Visão para listar todos os cursos e os respectivos departamentos
CREATE VIEW vw_cursos_departamentos AS
SELECT C.NomeCurso, D.NomeDepartamento
FROM Curso C
JOIN Departamento D ON C.NomeDepartamento = D.NomeDepartamento;

-- 6. Visão para listar os professores e suas especializações
CREATE VIEW vw_professores_especializacoes AS
SELECT P.Nome, P.Sobrenome, P.AreaEspecializacao
FROM Professor P;

-- 7. Visão para listar os alunos com matrícula pendente
CREATE VIEW vw_alunos_matricula_pendente AS
SELECT M.NomeAluno, M.SobrenomeAluno, M.Status
FROM Matricula M
WHERE M.Status = 'Pendente';