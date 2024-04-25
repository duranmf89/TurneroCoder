
-- Crear usuarios
CREATE USER 'read_user'@'localhost' IDENTIFIED BY '!QAZxsw2';
CREATE USER 'edit_user'@'localhost' IDENTIFIED BY '!QAZxsw2';

-- Se conceden permisos de lectura al usuario read_user
GRANT SELECT ON turnero.* TO 'read_user'@'localhost';

-- Se conceden permisos de lectura y edición limitada al usuario edit_user
GRANT SELECT, INSERT, UPDATE ON turnero.* TO 'edit_user'@'localhost';
