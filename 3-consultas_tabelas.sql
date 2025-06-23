-- Consulta 1: Listar todos os alunos matriculados em uma disciplina específica em um determinado período
SELECT 
    A.Nome AS NomeAluno, 
    A.Sobrenome AS SobrenomeAluno, 
    A.Telefone AS TelefoneAluno
FROM Aluno A
JOIN Matrícula M 
    ON A.Nome = M.NomeAluno 
    AND A.Sobrenome = M.SobrenomeAluno 
    AND A.Telefone = M.TelefoneAluno
WHERE M.NomeDisciplina = 'Algoritmos I' 
  AND M.PeríodoLetivo = '2025.1';

-- Consulta 2: Calcular a média de notas de um aluno
SELECT 
    M.NomeAluno, 
    M.SobrenomeAluno, 
    AVG(CAST(M.Notas AS DECIMAL(10,2))) AS MediaNotas
FROM Matrícula M
WHERE M.NomeAluno = 'João' 
  AND M.SobrenomeAluno = 'Silva'
GROUP BY M.NomeAluno, M.SobrenomeAluno;

-- Consulta 3: Listar os professores de um departamento com suas respectivas disciplinas
SELECT 
    P.Nome AS NomeProfessor, 
    P.Sobrenome AS SobrenomeProfessor, 
    D.NomeDisciplina
FROM Professor P
JOIN ProfessorDisciplina PD 
    ON P.Nome = PD.NomeProfessor 
    AND P.Sobrenome = PD.SobrenomeProfessor 
    AND P.Telefone = PD.TelefoneProfessor
JOIN Disciplina D 
    ON PD.NomeDisciplina = D.NomeDisciplina
JOIN Curso C 
    ON D.CódigoCurso = C.CódigoCurso
WHERE C.NomeDepartamento = 'Departamento de Computação';

-- Consulta 4: Encontrar a média das notas dos alunos para cada professor (< 8)
SELECT 
    P.Nome AS NomeProfessor,
    P.Sobrenome AS SobrenomeProfessor,
    AVG(A.NotaDidática) AS MediaNotas
FROM Professor P
JOIN OfertaDisciplina O ON O.NomeProfessor = P.Nome 
    AND O.SobrenomeProfessor = P.Sobrenome 
    AND O.TelefoneProfessor = P.Telefone
JOIN Disciplina D ON D.NomeDisciplina = O.NomeDisciplina
JOIN Avaliação A ON A.NomeDisciplina = D.NomeDisciplina 
    AND A.NomeProfessor = P.Nome
    AND A.SobrenomeProfessor = P.Sobrenome
    AND A.TelefoneProfessor = P.Telefone
GROUP BY P.Nome, P.Sobrenome
HAVING AVG(A.NotaDidática) < 8 
ORDER BY MediaNotas DESC;

-- Consulta 5: Listar todos os alunos com Bolsas ou Descontos
SELECT 
    A.Nome AS NomeAluno, 
    A.Sobrenome AS SobrenomeAluno, 
    A.Telefone AS TelefoneAluno, 
    M.BolsaOuDesconto
FROM Aluno A
JOIN Matrícula M 
    ON A.Nome = M.NomeAluno 
    AND A.Sobrenome = M.SobrenomeAluno 
    AND A.Telefone = M.TelefoneAluno
WHERE M.BolsaOuDesconto IS NOT NULL 
  AND M.BolsaOuDesconto <> 'Nenhuma';

-- Consulta 6: Listar os alunos que possuem notas > 8 em alguma disciplina
SELECT 
    M.NomeAluno, 
    M.SobrenomeAluno, 
    M.NomeDisciplina, 
    M.Notas
FROM Matrícula M
WHERE CAST(M.Notas AS DECIMAL(10,2)) > 8.0;

-- Consulta 7: Listar avaliações com notas < 7 em Didática
SELECT 
    A.Nome AS NomeAluno, 
    A.Sobrenome AS SobrenomeAluno, 
    AV.NomeDisciplina, 
    AV.NotaDidática, 
    P.Nome AS NomeProfessor, 
    P.Sobrenome AS SobrenomeProfessor
FROM Aluno A
JOIN Avaliação AV 
    ON A.Nome = AV.NomeAluno 
    AND A.Sobrenome = AV.SobrenomeAluno 
    AND A.Telefone = AV.TelefoneAluno
JOIN Professor P 
    ON AV.NomeProfessor = P.Nome 
    AND AV.SobrenomeProfessor = P.Sobrenome 
    AND AV.TelefoneProfessor = P.Telefone
WHERE AV.NotaDidática < 7;