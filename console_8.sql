CREATE DATABASE CURSOSONLINE;
USE CURSOSONLINE;

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE
);
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    duracion_horas INT
);
CREATE TABLE Inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_curso INT,
    fecha_inscripcion DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
INSERT INTO Usuario (nombre, apellido, email, fecha_registro) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '2025-03-01'),
('Ana', 'Gómez', 'ana.gomez@example.com', '2025-03-02'),
('Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', '2025-03-03'),
('Lucía', 'Martínez', 'lucia.martinez@example.com', '2025-03-04'),
('Pedro', 'Sánchez', 'pedro.sanchez@example.com', '2025-03-05'),
('Marta', 'López', 'marta.lopez@example.com', '2025-03-06'),
('David', 'Hernández', 'david.hernandez@example.com', '2025-03-07'),
('Isabel', 'Jiménez', 'isabel.jimenez@example.com', '2025-03-08'),
('Juan Carlos', 'Fernández', 'juancarlos.fernandez@example.com', '2025-03-09'),
('Laura', 'González', 'laura.gonzalez@example.com', '2025-03-10');
INSERT INTO Curso (nombre_curso, descripcion, fecha_inicio, fecha_fin, duracion_horas) VALUES
('Desarrollo Web', 'Curso de introducción al desarrollo web con HTML, CSS y JavaScript.', '2025-03-15', '2025-04-15', 40),
('Marketing Digital', 'Curso sobre estrategias de marketing digital para negocios en línea.', '2025-03-18', '2025-04-18', 30),
('Python para Principiantes', 'Curso para aprender a programar en Python desde cero.', '2025-03-20', '2025-04-20', 50),
('Data Science', 'Introducción a la ciencia de datos y análisis de datos con Python y R.', '2025-03-25', '2025-04-25', 60),
('Gestión de Proyectos', 'Curso para aprender a gestionar proyectos de forma eficiente y efectiva.', '2025-03-30', '2025-04-30', 35);
INSERT INTO Inscripcion (id_usuario, id_curso, fecha_inscripcion, estado) VALUES
(1, 1, '2025-03-01', 'Activo'),
(2, 2, '2025-03-02', 'Activo'),
(3, 3, '2025-03-03', 'Activo'),
(4, 4, '2025-03-04', 'Activo'),
(5, 5, '2025-03-05', 'Activo'),
(6, 1, '2025-03-06', 'Activo'),
(7, 3, '2025-03-07', 'Activo'),
(8, 2, '2025-03-08', 'Activo'),
(9, 4, '2025-03-09', 'Activo'),
(10, 5, '2025-03-10', 'Activo');
SELECT U.nombre, U.apellido, C.nombre_curso, C.descripcion,
I.fecha_inscripcion, I.estado
FROM Inscripcion I
JOIN Usuario U ON I.id_usuario = U.id_usuario
JOIN Curso C ON I.id_curso = C.id_curso
WHERE U.id_usuario = 1;
