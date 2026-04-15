-- 1. Gestão de Usuários (Acesso e Identidade)

-- Abaixo estão os comandos para criação e modificação de usuários, definindo quem pode acessar e de onde.

-- Criar um usuário com acesso restrito apenas à máquina local (localhost)
CREATE USER 'Usuario_Padrão'@'localhost' IDENTIFIED BY 'senhasegura123';

-- Criar um usuário administrador com acesso global (qualquer IP através do símbolo %)
CREATE USER 'admin_padra'@'%' IDENTIFIED BY 'senhaforte123';

-- Renomear um usuário existente ou alterar o host de conexão dele
RENAME USER 'nome_do_usuario'@'host_antigo' TO 'nome_do_usuario'@'localhost';
-- 2. Controle de Privilégios (Segurança)

-- Estes comandos definem o que cada usuário pode fazer dentro de bancos de dados específicos.
-- Conceder controle total sobre todas as tabelas do banco 'sakila' para o administrador
GRANT ALL privileges ON sakila.* TO 'admin_padra'@'%';

-- Conceder apenas permissão de leitura (SELECT) em uma tabela específica
GRANT SELECT ON sakila.inventory TO 'usuario_padrao'@'%';

-- Conceder permissões de manipulação de dados para um analista em um IP específico
GRANT INSERT, DELETE, UPDATE, SELECT ON sakila.* TO 'analista_dados'@'130.182.106.51';
-- 3. Tuning e Otimização de Performance

-- Aqui documentamos o processo de diagnóstico de lentidão e a aplicação da "cura" através de índices.
-- Passo A: Diagnóstico com EXPLAIN

-- Utilizado para verificar como o MySQL planeja executar a consulta e se ele está lendo a tabela inteira (Full Table Scan).
EXPLAIN SELECT * FROM actor WHERE last_name = 'Silva';
-- Após identificar que a busca por last_name está lenta ou sem índice, criamos o "atalho".
CREATE INDEX idx_lastname ON actor(last_name);

-- Verificando a otimização (Type: ref | Rows: 1)
EXPLAIN SELECT * FROM actor WHERE last_name = 'Silva';
