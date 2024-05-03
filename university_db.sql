-- # UNIVERSITY MANAGMENT

-- Criação da tabela unidade acadêmica
create table if not exists academic_unity(
	unit_code UUID primary key,
	unit_name VARCHAR(50) not null,
	start_date DATE not null
);

-- Inserção de dados na tabela unidade acadêmica
insert into academic_unity (unit_code, unit_name, start_date) 
values
    ('00000000-0000-0000-0000-000000000001', 'Universidade A', '2024-01-01'),
    ('00000000-0000-0000-0000-000000000002', 'Universidade B', '2024-01-02'),
    ('00000000-0000-0000-0000-000000000003', 'Universidade C', '2024-01-03'),
    ('00000000-0000-0000-0000-000000000004', 'Universidade D', '2024-01-04'),
    ('00000000-0000-0000-0000-000000000005', 'Universidade E', '2024-01-05');
 

-- Criação da tabela de alunos
create table if not exists students(
	student_id UUID primary key,
	name VARCHAR(30) not null,
	email VARCHAR(255) not null,
	tuition_fee DECIMAL(10, 2) not null
);

-- Inserção de dados na tabela alunos
insert into students (student_id, name, email, tuition_fee) 
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'João', 'joao@example.com', 1000.00),
    ('6ba7b811-9dad-11d1-80b4-00c04fd430b3', 'Maria', 'maria@example.com', 1200.00),
    ('6ba7b812-9dad-11d1-80b4-00c04fd430d0', 'Pedro', 'pedro@example.com', 1100.00),
    ('6ba7b813-9dad-11d1-80b4-00c04fd430f1', 'Ana', 'ana@example.com', 1050.00),
    ('6ba7b814-9dad-11d1-80b4-00c04fd430f2', 'Luiza', 'luiza@example.com', 1300.00);


-- Criação da tabela cursos
create table courses(
	course_code INT primary key,
	course_name VARCHAR(50) not null,
	description VARCHAR(100)
);

-- Inserção de dados na tabela disciplinas
insert into courses(course_code, course_name, description) values
    (1, 'Introdução à Programação', 'Curso introdutório sobre programação.'),
    (2, 'Desenvolvimento Web', 'Aprenda a criar sites dinâmicos e responsivos.'),
    (3, 'Banco de Dados', 'Curso abrangente sobre bancos de dados relacionais.'),
    (4, 'Inteligência Artificial', 'Explore os fundamentos da inteligência artificial.'),
    (5, 'Análise de Dados', 'Aprenda técnicas avançadas de análise de dados.');

   
-- Criação da tabela turmas
create table classes(
	class_id UUID primary key,
	schedule TIME not null,
	course_code INT,
	constraint fk_course_code foreign key(course_code) references courses(course_code)
);

-- Inserção de dados na tabela turmas
insert into classes (class_id, schedule, course_code) 
values 
  ('d12e43ab-56f3-4ef5-a15c-fc10bd9af67a', '08:00:00', 1),
  ('8c8c52df-4b14-4b43-9d5d-2b0e86d21cf5', '10:00:00', 2),
  ('316b90ec-54e5-4928-b8d1-3ff7bfb24f5d', '13:30:00', 3),
  ('c1f4b13a-1de9-4ae5-92e1-04d6d79f1f8d', '15:30:00', 4),
  ('ae44296d-1f53-4991-98ae-3423b6d36c7c', '18:00:00', 5);


-- Criação da tabela matrícula
create table registration(
	student_id_class_id VARCHAR(80)
	student_id UUID,
	class_id UUID,
	constraint fk_student_id foreign key(student_id) references students(student_id),
	constraint fk_class_id foreign key(class_id) references classes(class_id)
);

-- Inserção de dados na tabela matrícula
insert into registration (student_id, class_id) 
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'd12e43ab-56f3-4ef5-a15c-fc10bd9af67a'),
    ('6ba7b811-9dad-11d1-80b4-00c04fd430b3', '8c8c52df-4b14-4b43-9d5d-2b0e86d21cf5'),
    ('6ba7b812-9dad-11d1-80b4-00c04fd430d0', '316b90ec-54e5-4928-b8d1-3ff7bfb24f5d'),
    ('6ba7b813-9dad-11d1-80b4-00c04fd430f1', 'c1f4b13a-1de9-4ae5-92e1-04d6d79f1f8d'),
    ('6ba7b814-9dad-11d1-80b4-00c04fd430f2', 'ae44296d-1f53-4991-98ae-3423b6d36c7c');
   

-- Criação da tabela contratados
create table contractors(
	contractor_id UUID primary key,
	name VARCHAR(30) not null,
	email VARCHAR(255) not null,
	salary DECIMAL(10, 2) not null,
	unit_code UUID,
	constraint fk_unit_code foreign key(unit_code) references academic_unity(unit_code)
);

-- Inserção de dados na tabela contratados
insert into contractors (contractor_id, name, email, salary, unit_code) 
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c1', 'Carlos', 'carlos@example.com', 2500.00, '00000000-0000-0000-0000-000000000001'),
    ('6ba7b811-9dad-11d1-80b4-00c04fd430c2', 'Juliana', 'juliana@example.com', 2800.00, '00000000-0000-0000-0000-000000000002'),
    ('6ba7b812-9dad-11d1-80b4-00c04fd430c3', 'Rafael', 'rafael@example.com', 2700.00, '00000000-0000-0000-0000-000000000003'),
    ('6ba7b813-9dad-11d1-80b4-00c04fd430c4', 'Mariana', 'mariana@example.com', 2600.00, '00000000-0000-0000-0000-000000000004'),
    ('6ba7b814-9dad-11d1-80b4-00c04fd430c5', 'Lucas', 'lucas@example.com', 3000.00, '00000000-0000-0000-0000-000000000005');


-- Criação da tabela funcionários
create table employees(
	contractor_id UUID primary key,
	role VARCHAR(30) not null,
	constraint fk_contractor_id foreign key(contractor_id) references contractors(contractor_id)
);

-- Inserção na tabela de funcionários
insert into employees (contractor_id, role)
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c1', 'Desenvolvedor'),
    ('6ba7b811-9dad-11d1-80b4-00c04fd430c2', 'Designer'),
    ('6ba7b812-9dad-11d1-80b4-00c04fd430c3', 'Analista de Sistemas'),
    ('6ba7b813-9dad-11d1-80b4-00c04fd430c4', 'Gerente de Projetos'),
    ('6ba7b814-9dad-11d1-80b4-00c04fd430c5', 'Arquiteto de Software');


-- Criação da tabela professores
create table teachers(
	contractor_id UUID primary key,
	role VARCHAR(30) default('Professor'),
	education VARCHAR(100) not null,
	constraint fk_contractor_id foreign key(contractor_id) references contractors(contractor_id)
);

-- Inserção de dados na tabela de professores
insert into teachers (contractor_id, education)
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c1', 'Língua Inglesa');


-- Criação da tabela dependentes
create table dependents(
	dependent_id UUID primary key,
	name VARCHAR(30) not null,
	contractor_id UUID,
	relationship VARCHAR(10) not null,
	constraint fk_contractor_id foreign key(contractor_id) references contractors(contractor_id)
);

-- Inserção de dados na tabela de dependentes
insert into dependents (dependent_id, name, contractor_id, relationship)
values
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c6', 'Ana', '6ba7b810-9dad-11d1-80b4-00c04fd430c1', 'Filha'),
    ('6ba7b811-9dad-11d1-80b4-00c04fd430c7', 'Paulo', '6ba7b811-9dad-11d1-80b4-00c04fd430c2', 'Filho'),
    ('6ba7b812-9dad-11d1-80b4-00c04fd430c8', 'Marta', '6ba7b812-9dad-11d1-80b4-00c04fd430c3', 'Esposa'),
    ('6ba7b813-9dad-11d1-80b4-00c04fd430c9', 'Carlos', '6ba7b813-9dad-11d1-80b4-00c04fd430c4', 'Filho'),
    ('6ba7b814-9dad-11d1-80b4-00c04fd430d0', 'Luisa', '6ba7b814-9dad-11d1-80b4-00c04fd430c5', 'Filha');


