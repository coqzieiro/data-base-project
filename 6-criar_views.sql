-- 1. Visão para listar todos os alunos e suas respectivas disciplinas
CREATE VIEW vw_alunos_disciplinas AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, M.NomeDisciplina
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = A.Telefone;

-- 2. Visão para calcular a média das notas de cada aluno (CORRIGIDA para usar A.Telefone)
CREATE VIEW vw_media_notas AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, AVG(CAST(M.Notas AS DECIMAL(10,2))) AS MediaNotas
FROM Matrícula M
JOIN Aluno A ON M.NomeAluno = A.Nome AND M.SobrenomeAluno = A.Sobrenome AND A.Telefone = A.Telefone
GROUP BY A.Nome, A.Sobrenome;

-- 3. Visão para listar os professores e suas disciplinas no período letivo
CREATE VIEW vw_professores_disciplinas AS
SELECT O.NomeProfessor, O.SobrenomeProfessor, O.PeríodoLetivo, D.NomeDisciplina
FROM OfertaDisciplina O
JOIN Disciplina D ON O.NomeDisciplina = D.NomeDisciplina;

-- 4. Visão para listar os alunos com suas respectivas disciplinas e notas
CREATE VIEW vw_alunos_notas AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, M.NomeDisciplina, M.Notas
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = A.Telefone;

-- 5. Visão para listar todos os cursos e os respectivos departamentos
CREATE VIEW vw_cursos_departamentos AS
SELECT C.NomeCurso, D.NomeDepartamento
FROM Curso C
JOIN Departamento D ON C.NomeDepartamento = D.NomeDepartamento;

-- 6. Visão para listar os professores e suas especializações (CORRIGIDA para usar A.Telefone)
CREATE VIEW vw_professores_especializacoes AS
SELECT P.Nome, P.Sobrenome, P.ÁreaEspecialização AS AreaEspecializacao, D.NomeDisciplina
FROM Professor P
JOIN ProfessorDisciplina PD ON P.Nome = PD.NomeProfessor AND P.Sobrenome = PD.SobrenomeProfessor AND P.Telefone = PD.TelefoneProfessor
JOIN Disciplina D ON PD.NomeDisciplina = D.NomeDisciplina;

-- 7. Visão para listar os alunos com matrícula pendente (CORRIGIDA para usar A.Telefone)
CREATE VIEW vw_alunos_matricula_pendente AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, M.Estado AS Status
FROM Matrícula M
JOIN Aluno A ON M.NomeAluno = A.Nome AND M.SobrenomeAluno = A.Sobrenome AND A.Telefone = A.Telefone
WHERE M.Estado = 'Pendente';