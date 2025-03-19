CREATE DATABASE RH;
USE RH;

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100),
    ubicacion VARCHAR(100),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    fecha_ingreso DATE,
    salario DECIMAL(10, 2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

INSERT INTO Empresa (nombre_empresa, direccion, telefono) VALUES
('Tech Solutions', 'Calle Ficticia 123, Ciudad', '555-1234'),
('Global Innovations', 'Avenida del Futuro 456, Ciudad', '555-5678'),
('Creative Minds', 'Calle Imaginaria 789, Ciudad', '555-9876'),
('Green Tech', 'Paseo Ecológico 234, Ciudad', '555-4321'),
('Future Enterprises', 'Avenida del Progreso 101, Ciudad', '555-8765'),
('Digital Horizons', 'Calle Digital 202, Ciudad', '555-2345'),
('World Innovations', 'Avenida Global 303, Ciudad', '555-6789'),
('Smart Solutions', 'Calle Inteligente 404, Ciudad', '555-3456'),
('Blue Ocean Technologies', 'Calle Azul 505, Ciudad', '555-6543'),
('Solar Energy Corp', 'Avenida Solar 606, Ciudad', '555-9870');

INSERT INTO Departamento (nombre_departamento, ubicacion, id_empresa) VALUES
('Desarrollo', 'Piso 2', 1),
('Recursos Humanos', 'Piso 1', 2),
('Marketing', 'Piso 3', 1),
('Finanzas', 'Piso 4', 3),
('Atención al Cliente', 'Piso 5', 2),
('Investigación y Desarrollo', 'Piso 6', 4),
('Ventas', 'Piso 7', 5),
('Sistemas', 'Piso 8', 6),
('Operaciones', 'Piso 9', 7),
('Producción', 'Piso 10', 8);

INSERT INTO Empleado (nombre, apellido, fecha_nacimiento, fecha_ingreso, salario, id_departamento) VALUES
('Juan', 'Pérez', '1990-05-15', '2020-01-10', 45000.00, 1),
('Ana', 'Gómez', '1985-02-22', '2018-03-18', 50000.00, 2),
('Carlos', 'Rodríguez', '1980-11-10', '2019-07-12', 55000.00, 3),
('Lucía', 'Martínez', '1992-08-30', '2021-09-25', 40000.00, 4),
('Pedro', 'Sánchez', '1988-12-01', '2017-06-15', 60000.00, 1),
('Marta', 'López', '1995-03-04', '2022-01-05', 42000.00, 5),
('David', 'Hernández', '1990-09-18', '2019-10-20', 48000.00, 2),
('Isabel', 'Jiménez', '1993-05-12', '2020-05-17', 46000.00, 4),
('Juan Carlos', 'Fernández', '1987-02-25', '2018-09-10', 54000.00, 3),
('Laura', 'González', '1994-07-30', '2021-06-15', 47000.00, 5);
SELECT E.nombre, E.apellido, E.fecha_nacimiento, E.fecha_ingreso, E.salario, D.nombre_departamento
FROM Empleado E
JOIN Departamento D ON E.id_departamento = D.id_departamento
WHERE D.nombre_departamento = 'Desarrollo';
