-- 1. Visão para listar todos os alunos e suas respectivas disciplinas
CREATE VIEW vw_alunos_disciplinas AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, M.NomeDisciplina
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = M.TelefoneAluno;

-- 2. Visão para calcular a média das notas de cada aluno
CREATE VIEW vw_media_notas AS
SELECT M.NomeAluno, M.SobrenomeAluno, AVG(CAST(M.Notas AS DECIMAL(10,2))) AS MediaNotas
FROM Matrícula M
GROUP BY M.NomeAluno, M.SobrenomeAluno;

-- 3. Visão para listar os professores e suas disciplinas no período letivo
CREATE VIEW vw_professores_disciplinas AS
SELECT O.NomeProfessor, O.SobrenomeProfessor, O.PeríodoLetivo, D.NomeDisciplina
FROM OfertaDisciplina O
JOIN Disciplina D ON O.NomeDisciplina = D.NomeDisciplina;

-- 4. Visão para listar os alunos com suas respectivas disciplinas e notas
CREATE VIEW vw_alunos_notas AS
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, M.NomeDisciplina, M.Notas
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = M.TelefoneAluno;

-- 5. Visão para listar todos os cursos e os respectivos departamentos
CREATE VIEW vw_cursos_departamentos AS
SELECT C.NomeCurso, D.NomeDepartamento
FROM Curso C
JOIN Departamento D ON C.NomeDepartamento = D.NomeDepartamento;

-- 6. Visão para listar os professores e suas especializações
CREATE VIEW vw_professores_especializacoes AS
SELECT P.Nome, P.Sobrenome, P.ÁreaEspecialização AS AreaEspecializacao 
FROM Professor P;

-- 7. Visão para listar os alunos com matrícula pendente
CREATE VIEW vw_alunos_matricula_pendente AS
SELECT M.NomeAluno, M.SobrenomeAluno, M.Estado AS Status
FROM Matrícula M
WHERE M.Estado = 'Pendente';