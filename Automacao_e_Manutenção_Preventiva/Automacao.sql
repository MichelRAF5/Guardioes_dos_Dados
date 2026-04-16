use sakila;

-- Ativando o agendamento de eventos
SET GLOBAL event_scheduler = ON;

-- Criando a automação
delimiter //

create event limpeza_mensal
on schedule every 1 day starts current_timestamp
do
begin
	delete from logs_sistema
    where data_evento < now() - interval 30 day;
end //

delimiter ;