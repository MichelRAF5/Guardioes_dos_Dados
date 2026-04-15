use sakila;

-- Verificando se o Log Bin está ativo
show variables like 'log_bin';

-- Identificando o Log atual
show master status;