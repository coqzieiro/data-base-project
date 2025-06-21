# Data Base Project

Este projeto foi desenvolvido para a disciplina de Banco de Dados, com foco em modelagem, mapeamento e normalização de um sistema. O objetivo é fornecer uma base para criar, popular e interagir com um banco de dados utilizando PostgreSQL.

---

## Requisitos

### Dependências

#### 1. PostgreSQL

PostgreSQL é um sistema de gerenciamento de banco de dados relacional, utilizado para armazenar e consultar os dados.

- **Instalação no Windows**: Baixe o PostgreSQL em [PostgreSQL Downloads](https://www.postgresql.org/download/).
- **Instalação no Linux**: Use o gerenciador de pacotes para instalar o PostgreSQL.

  No Ubuntu, por exemplo:

  ```bash
  sudo apt update
  sudo apt install postgresql postgresql-contrib
````

Para outras distribuições Linux, consulte a documentação oficial do PostgreSQL.

#### 2. Visual Studio Code (VSCode)

O VSCode é uma IDE amplamente utilizada para editar código, incluindo SQL.

* Baixe o VSCode em [Visual Studio Code](https://code.visualstudio.com/).

#### 3. Extensão "PostgreSQL" para VSCode

1. Abra o VSCode.
2. Acesse a aba de **Extensões** no menu à esquerda.
3. Pesquise por **PostgreSQL** e instale a extensão "PostgreSQL Management".

---

## Como Usar o PostgreSQL no VSCode

### Passo 1: Instalar o PostgreSQL

Caso não tenha o PostgreSQL instalado, siga as instruções acima para instalar o PostgreSQL no seu sistema.

No **Linux**, após instalar, o serviço do PostgreSQL será iniciado automaticamente. Para verificar se o PostgreSQL está em funcionamento, use o seguinte comando:

```bash
sudo systemctl status postgresql
```

Se não estiver ativo, você pode iniciar o serviço com:

```bash
sudo systemctl start postgresql
```

### Passo 2: Configurar o PostgreSQL no VSCode

#### 1. Instalar a Extensão no VSCode

Abra o VSCode e acesse a aba de **Extensões**. Procure por **PostgreSQL** e instale a extensão **PostgreSQL Management**.

#### 2. Conectar ao PostgreSQL

1. Após a instalação da extensão, pressione **Ctrl+Shift+P** (ou **Cmd+Shift+P** no Mac) para abrir a paleta de comandos.
2. Digite `PostgreSQL: New Connection` e selecione.
3. Forneça as informações de conexão, como:

   * **Host**: `localhost`
   * **Usuário**: `postgres` (ou o nome de usuário configurado)
   * **Senha**: a senha do PostgreSQL
   * **Banco de dados**: o banco de dados que você deseja acessar (minha_escola).

---

## Usando o Arquivo `inserir_dados.sql`

O arquivo `inserir_dados.sql` contém os comandos **INSERT** que irão popular as tabelas no banco de dados com dados de exemplo. Esses dados de exemplo são importantes para testar consultas e interações no banco de dados.

### Como Usar o `inserir_dados.sql`

1. **Abra o arquivo `inserir_dados.sql` no VSCode**.
2. **Conecte-se ao banco de dados PostgreSQL** usando a extensão configurada no VSCode.
3. **Selecione o banco de dados** onde você deseja inserir os dados.
4. **Execute o script SQL** no VSCode:

   * Selecione o código dentro do arquivo e pressione **Ctrl + Enter** (ou **Cmd + Enter** no Mac) para executar.
   * Selecione **Executar** com o botão direito do mouse para rodar o script.

### Estrutura do Arquivo `inserir_dados.sql`

O arquivo insere dados nas tabelas do banco de dados, incluindo **Curso**, **Disciplina**, **Professor**, **Aluno**, **Matrícula** e outras. Isso garante que o banco de dados seja populado com registros de teste para facilitar o uso.

---

## Comandos Úteis no PostgreSQL

Aqui estão alguns comandos básicos para trabalhar com o PostgreSQL:

### Criar um Banco de Dados

```sql
CREATE DATABASE nome_do_banco;
```

### Conectar ao Banco de Dados

```sql
\c nome_do_banco;
```

### Listar Bancos de Dados

```sql
\l
```

### Criar uma Tabela

```sql
CREATE TABLE nome_da_tabela (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  idade INTEGER
);
```

### Inserir Dados

```sql
INSERT INTO nome_da_tabela (nome, idade) VALUES ('João', 25);
```

### Consultar Dados

```sql
SELECT * FROM nome_da_tabela;
```

### Atualizar Dados

```sql
UPDATE nome_da_tabela SET idade = 26 WHERE nome = 'João';
```

### Excluir Dados

```sql
DELETE FROM nome_da_tabela WHERE nome = 'João';
```

---

## Modelagem do Banco de Dados

O banco de dados contém várias tabelas representando um sistema educacional, incluindo dados sobre cursos, disciplinas, alunos, professores e departamentos. O modelo foi projetado para armazenar informações detalhadas sobre os cursos oferecidos, as disciplinas relacionadas e os alunos matriculados.

---

## Estrutura do Projeto

Aqui estão as principais tabelas e seus atributos:

* **Curso**: Contém informações sobre os cursos oferecidos.
* **Disciplina**: Representa as disciplinas que fazem parte de cada curso.
* **OfertaDisciplina**: Relaciona um professor com uma disciplina e o período de oferta.
* **Departamento**: Armazena os dados dos departamentos acadêmicos.
* **Usuário**: Contém informações sobre os usuários do sistema (alunos, professores e funcionários administrativos).
* **Professor**: Dados relacionados aos professores.
* **Aluno**: Dados relacionados aos alunos.
* **FuncionárioAdministrativo**: Dados sobre os funcionários administrativos.
* **InfraestruturaCurso**: Registra as demandas de infraestrutura para cada curso.

---

## Como Conectar e Interagir com o Banco de Dados

Para **Linux**:

1. Abra um terminal.

2. Inicie a sessão no PostgreSQL com o comando:

   ```bash
   sudo -u postgres psql
   ```

3. Conecte-se ao banco de dados que você deseja usar:

   ```sql
   \c nome_do_banco;
   ```

4. Execute os comandos SQL necessários para criar as tabelas, inserir dados ou consultar o banco de dados.

---

## Conclusão

Este projeto fornece uma base funcional para trabalhar com bancos de dados no PostgreSQL. Através do uso do **VSCode**, você pode facilmente editar, executar e testar comandos SQL, e com o script **inserir\_dados.sql**, populamos o banco de dados com dados de exemplo, permitindo que você interaja com ele e faça testes.

Com os dados inseridos e a estrutura do banco pronta, você pode começar a experimentar com consultas SQL, fazer ajustes no banco de dados e executar operações como inserção, atualização e exclusão de dados.

---

### Links Úteis:

* **PostgreSQL Downloads**: [https://www.postgresql.org/download/](https://www.postgresql.org/download/)
* **PostgreSQL Documentation**: [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
* **VSCode**: [https://code.visualstudio.com/](https://code.visualstudio.com/)
* **Extensão PostgreSQL para VSCode**: [https://marketplace.visualstudio.com/items?itemName=ms-postgresql.postgresql](https://marketplace.visualstudio.com/items?itemName=ms-postgresql.postgresql)

---