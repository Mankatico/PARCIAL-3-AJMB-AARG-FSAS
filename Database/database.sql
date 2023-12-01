create table users (
	user_id serial primary key,
	user_name varchar(40),
	user_puntos numeric(5)
);

select * from users;

insert into public.users (user_name, user_puntos) 
values ('Joe',25);
insert into users (user_name, user_puntos) 
values ('Miguel',30);
insert into users (user_name, user_puntos) 
values ('Saul',18);
insert into users (user_name, user_puntos) 
values ('Pepe',10);
insert into users (user_name, user_puntos) 
values ('Julian',29);

create table banco_palabras(
	bapa_id serial primary key,
	bapa_palabra varchar(15),
	bapa_nivel numeric(2),
	bapa_puntos numeric (2),
	bapa_tamanopalabra numeric(2)
);


-- Insertar 30 palabras de muestra en el banco_palabras
INSERT INTO banco_palabras (bapa_palabra, bapa_nivel, bapa_puntos, bapa_tamanopalabra)
VALUES
    ('sol', 1, 5, 3),
    ('gato', 2, 8, 4),
    ('elefante', 3, 12, 8),
    ('flor', 1, 6, 4),
    ('casa', 2, 9, 4),
    ('computadora', 3, 15, 12),
    ('perro', 2, 7, 5),
    ('ratón', 1, 5, 5),
    ('libro', 2, 8, 5),
    ('jirafa', 3, 11, 6),
    ('lápiz', 1, 5, 5),
    ('montaña', 3, 10, 8),
    ('hoja', 1, 4, 4),
    ('árbol', 2, 7, 5),
    ('tigre', 2, 9, 5),
    ('avión', 3, 13, 5),
    ('isla', 1, 6, 4),
    ('elefante', 3, 12, 8),
    ('círculo', 3, 14, 7),
    ('mariposa', 3, 16, 8),
    ('conejo', 1, 6, 5),
    ('caballo', 2, 10, 7),
    ('nube', 1, 5, 4),
    ('rayo', 1, 4, 4),
    ('espada', 2, 8, 6),
    ('rana', 1, 4, 4),
    ('escalera', 3, 11, 8),
    ('camión', 2, 9, 6),
    ('naranja', 3, 13, 7);
