-- 1. Listar todos os alunos matriculados em uma disciplina específica em um determinado período
SELECT A.Nome, A.Sobrenome, A.Telefone
FROM Aluno A
JOIN Matricula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno
WHERE M.NomeDisciplina = 'Algoritmos I' AND M.PeriodoLetivo = '2025.1';

-- 2. Calcular a média de notas de um aluno
SELECT NomeAluno, SobrenomeAluno, AVG(Nota) AS MediaNotas
FROM Matricula
WHERE NomeAluno = 'João' AND SobrenomeAluno = 'Silva'
GROUP BY NomeAluno, SobrenomeAluno;

-- 3. Listar os professores de um departamento com suas respectivas disciplinas
SELECT P.Nome, P.Sobrenome, D.NomeDisciplina
FROM Professor P
JOIN OfertaDisciplina O ON P.Nome = O.NomeProfessor AND P.Sobrenome = O.SobrenomeProfessor
JOIN Disciplina D ON O.NomeDisciplina = D.NomeDisciplina
WHERE D.NomeDepartamento = 'Departamento de Computação';

-- 4. Encontrar cursos que não tiveram alunos matriculados no último período letivo
SELECT C.NomeCurso
FROM Curso C
LEFT JOIN Matricula M ON C.CodigoCurso = M.CodigoCurso AND M.PeriodoLetivo = '2025.1'
WHERE M.CodigoCurso IS NULL;

-- 5. Listar todos os departamentos e o número de cursos oferecidos por cada um
SELECT D.NomeDepartamento, COUNT(C.CodigoCurso) AS NumeroCursos
FROM Departamento D
JOIN Curso C ON D.NomeDepartamento = C.NomeDepartamento
GROUP BY D.NomeDepartamento;

-- 6. Listar os alunos que possuem notas acima de 8.0 em alguma disciplina
SELECT M.NomeAluno, M.SobrenomeAluno, M.NomeDisciplina, M.Notas
FROM Matricula M
WHERE M.Notas > 8.0;

-- 7. Listar todos os professores e suas respectivas salas de aula no período letivo
SELECT O.NomeProfessor, O.SobrenomeProfessor, O.Sala, O.PeriodoLetivo
FROM OfertaDisciplina O;
