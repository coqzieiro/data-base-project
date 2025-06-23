# Data Base Project

Este projeto foi desenvolvido para a disciplina de Banco de Dados, com foco em modelagem, mapeamento e normalização de um sistema escolar. O objetivo é fornecer uma base para criar, popular e interagir com um banco de dados utilizando PostgreSQL.

---

## Como Rodar os Scripts?

Entre no PostgreSQL com:

```sql
psql -h localhost -U nome_do_usuario -d nome_do_banco
```
Para verificar se existem tabelas criadas, use o comando `\dt` no `psql`. Ele listará todas as tabelas no banco de dados.

```sql
\dt
```

Para deletar as tabelas existentes, use:
```sql
\i 7-deletar-tabelas.sql
```

**1. `\i criar_tabelas.sql`:**

*   **O que faz:** Este script cria as tabelas no seu banco de dados. Ele não exibe resultados diretamente.

    Isso deve mostrar uma lista das suas tabelas: `Aluno`, `Avaliação`, `Avisos`, `Curso`, `Departamento`, etc.

**2. `\i inserir_dados.sql`:**

*   **O que faz:** Este script insere dados nas suas tabelas. Ele não exibe resultados diretamente.
*   **Como verificar:** Para verificar se os dados foram inseridos corretamente, use comandos `SELECT` para exibir os conteúdos das tabelas. Por exemplo:

    ```sql
    SELECT * FROM Aluno LIMIT 10;  -- Mostra os primeiros 10 alunos
    SELECT COUNT(*) FROM Aluno;       -- Mostra o número total de alunos
    SELECT * FROM Curso LIMIT 5;    -- Mostra os primeiros 5 cursos
    ```

    Substitua `Aluno` e `Curso` pelos nomes das outras tabelas para verificar seus conteúdos.

**3. `\i consultas_tabelas.sql`:**

*   **O que faz:** Este script executa consultas nas suas tabelas. Se as consultas estiverem escritas para exibir resultados (usando `SELECT`), os resultados *serão* exibidos na tela *imediatamente* após a execução do script.

    Se você já está vendo resultados após executar este script, então está tudo certo. Caso contrário, verifique se o arquivo `consultas_tabelas.sql` realmente contém comandos `SELECT`.

**4. `\i criar_index.sql`:**

*   **O que faz:** Este script cria índices nas suas tabelas. Ele não exibe resultados diretamente.
*   **Como verificar:** Para verificar se os índices foram criados corretamente, use o comando `\di` no `psql`. Ele listará todos os índices no banco de dados.

    ```sql
    \di
    ```

    Isso deve mostrar uma lista dos seus índices, incluindo aqueles que você criou com o script.

**5. `\i criar_views.sql`:**

*   **O que faz:** Este script cria views (visões) no seu banco de dados. Ele não exibe resultados diretamente.
*   **Como verificar:**
    *   **Verificar a criação:** Para verificar se as views foram criadas corretamente, use o comando `\dv` no `psql`. Ele listará todas as views no banco de dados.

        ```sql
        \dv
        ```

        Isso deve mostrar uma lista das suas views, como `vw_alunos_disciplinas`, `vw_media_notas`, etc.
    *   **Visualizar os resultados:** Para visualizar os resultados das views, use comandos `SELECT` para consultar as views. Por exemplo:

        ```sql
        SELECT * FROM vw_alunos_disciplinas LIMIT 10;  -- Mostra os primeiros 10 resultados da view
        SELECT * FROM vw_media_notas;                -- Mostra todos os resultados da view
        ```

**Em resumo:**

*   `\i` executa o script, mas não mostra os resultados diretamente (a menos que o script contenha comandos `SELECT`).
*   Use `\dt` para listar tabelas.
*   Use `\di` para listar índices.
*   Use `\dv` para listar views.
*   Use `SELECT * FROM nome_da_tabela` ou `SELECT * FROM nome_da_view` para exibir os dados.
*   Lembre-se de usar `LIMIT` para evitar exibir grandes quantidades de dados de uma vez.
