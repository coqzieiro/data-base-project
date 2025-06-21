-- 1. Listar todos os alunos matriculados em uma disciplina específica em um determinado período
SELECT A.Nome, A.Sobrenome, A.Telefone
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = M.TelefoneAluno
WHERE M.NomeDisciplina = 'Algoritmos I' AND M.PeríodoLetivo = '2025.1';

-- 2. Calcular a média de notas de um aluno
SELECT M.NomeAluno, M.SobrenomeAluno, AVG(CAST(M.Notas AS DECIMAL(10,2))) AS MediaNotas
FROM Matrícula M
WHERE M.NomeAluno = 'João' AND M.SobrenomeAluno = 'Silva'
GROUP BY M.NomeAluno, M.SobrenomeAluno;

-- 3. Listar os professores de um departamento com suas respectivas disciplinas
SELECT P.Nome, P.Sobrenome, D.NomeDisciplina
FROM Professor P
JOIN ProfessorDisciplina PD ON P.Nome = PD.NomeProfessor AND P.Sobrenome = PD.SobrenomeProfessor AND P.Telefone = PD.TelefoneProfessor
JOIN Disciplina D ON PD.NomeDisciplina = D.NomeDisciplina
JOIN Curso C ON D.CódigoCurso = C.CódigoCurso
WHERE C.NomeDepartamento = 'Departamento de Computação';

-- 4. Encontrar cursos que não tiveram alunos matriculados no último período letivo
SELECT C.NomeCurso
FROM Curso C
WHERE NOT EXISTS (
    SELECT 1
    FROM Disciplina D
    JOIN Matrícula M ON D.NomeDisciplina = M.NomeDisciplina
    WHERE D.CódigoCurso = C.CódigoCurso AND M.PeríodoLetivo = '2025.1'
);

-- 5. Listar todos os alunos com Bolsas ou Descontos:
SELECT A.Nome, A.Sobrenome, A.Telefone, M.BolsaOuDesconto
FROM Aluno A
JOIN Matrícula M ON A.Nome = M.NomeAluno AND A.Sobrenome = M.SobrenomeAluno AND A.Telefone = M.TelefoneAluno
WHERE M.BolsaOuDesconto IS NOT NULL AND M.BolsaOuDesconto <> 'Nenhuma';

-- 6. Listar os alunos que possuem notas acima de 8.0 em alguma disciplina
SELECT M.NomeAluno, M.SobrenomeAluno, M.NomeDisciplina, M.Notas
FROM Matrícula M
WHERE CAST(M.Notas AS DECIMAL(10,2)) > 8.0;

-- 7. Listar avaliações com notas menores que 7 em Didática
SELECT A.Nome AS NomeAluno, A.Sobrenome AS SobrenomeAluno, AV.NomeDisciplina, AV.NotaDidática, P.Nome AS NomeProfessor, P.Sobrenome AS SobrenomeProfessor
FROM Aluno A
JOIN Avaliação AV ON A.Nome = AV.NomeAluno AND A.Sobrenome = AV.SobrenomeAluno AND A.Telefone = AV.TelefoneAluno
JOIN Professor P ON AV.NomeProfessor = P.Nome AND AV.SobrenomeProfessor = P.Sobrenome AND AV.TelefoneProfessor = P.Telefone
WHERE AV.NotaDidática < 7;