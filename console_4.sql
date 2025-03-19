CREATE DATABASE BIBLIOTECADIG;
USE BIBLIOTECADIG;

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT NOT NULL
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    genero VARCHAR(100),
    año_publicacion INT CHECK (año_publicacion > 0),
    cantidad_disponible INT NOT NULL CHECK (cantidad_disponible >= 0)
);

CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('Activo', 'Devuelto', 'Retrasado') DEFAULT 'Activo',
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE
);
INSERT INTO Usuario (nombre, apellido, email, telefono, direccion) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '5551234567', 'Calle 123, Ciudad'),
('Maria', 'Gomez', 'maria.gomez@email.com', '5559876543', 'Avenida 456, Ciudad'),
('Carlos', 'Ramirez', 'carlos.ramirez@email.com', '5553216547', 'Calle 789, Ciudad'),
('Ana', 'Torres', 'ana.torres@email.com', '5558765432', 'Boulevard 555, Ciudad'),
('Pedro', 'Lopez', 'pedro.lopez@email.com', '5556547890', 'Calle 321, Ciudad'),
('Lucia', 'Martinez', 'lucia.martinez@email.com', '5551472583', 'Avenida 888, Ciudad'),
('Fernando', 'Vega', 'fernando.vega@email.com', '5553698521', 'Calle 963, Ciudad'),
('Sofia', 'Jimenez', 'sofia.jimenez@email.com', '5557412589', 'Pasaje 741, Ciudad'),
('Miguel', 'Hernandez', 'miguel.hernandez@email.com', '5558521479', 'Calle 654, Ciudad'),
('Laura', 'Ortega', 'laura.ortega@email.com', '5559637412', 'Avenida 159, Ciudad'),
('Hugo', 'Garcia', 'hugo.garcia@email.com', '5553571598', 'Calle 852, Ciudad'),
('Clara', 'Navarro', 'clara.navarro@email.com', '5559517536', 'Avenida 357, Ciudad'),
('Andres', 'Castro', 'andres.castro@email.com', '5558529631', 'Pasaje 456, Ciudad'),
('Elena', 'Suarez', 'elena.suarez@email.com', '5551593574', 'Calle 777, Ciudad'),
('Javier', 'Mendoza', 'javier.mendoza@email.com', '5557539516', 'Boulevard 159, Ciudad'),
('Paula', 'Diaz', 'paula.diaz@email.com', '5552587413', 'Calle 963, Ciudad'),
('Raul', 'Santos', 'raul.santos@email.com', '5559514562', 'Avenida 741, Ciudad'),
('Daniela', 'Morales', 'daniela.morales@email.com', '5554562587', 'Pasaje 369, Ciudad'),
('Esteban', 'Rojas', 'esteban.rojas@email.com', '5558521597', 'Calle 258, Ciudad'),
('Camila', 'Fernandez', 'camila.fernandez@email.com', '5551598524', 'Boulevard 963, Ciudad');
INSERT INTO Libro (titulo, autor, genero, año_publicacion, cantidad_disponible) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967, 5),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela', 1605, 3),
('El Principito', 'Antoine de Saint-Exupéry', 'Fábula', 1943, 7),
('1984', 'George Orwell', 'Ciencia ficción', 1949, 4),
('Moby Dick', 'Herman Melville', 'Aventura', 1851, 6),
('La Odisea', 'Homero', 'Épico', 1000, 5),
('Orgullo y Prejuicio', 'Jane Austen', 'Romance', 1813, 8),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', 1997, 10),
('Crimen y castigo', 'Fiódor Dostoievski', 'Drama', 1866, 4),
('Los juegos del hambre', 'Suzanne Collins', 'Ciencia ficción', 2008, 7),
('El gran Gatsby', 'F. Scott Fitzgerald', 'Drama', 1925, 5),
('Fahrenheit 451', 'Ray Bradbury', 'Ciencia ficción', 1953, 8),
('En busca del tiempo perdido', 'Marcel Proust', 'Literatura clásica', 1913, 4),
('Cumbres borrascosas', 'Emily Brontë', 'Romántico', 1847, 6),
('Ulises', 'James Joyce', 'Moderno', 1922, 3),
('El retrato de Dorian Gray', 'Oscar Wilde', 'Filosofía', 1890, 6),
('La casa de los espíritus', 'Isabel Allende', 'Fantasía', 1982, 5),
('Drácula', 'Bram Stoker', 'Terror', 1897, 4),
('La Iliada', 'Homero', 'Épico', 1000, 5), -- Modificado año
('Los hermanos Karamazov', 'Fiódor Dostoievski', 'Drama', 1880, 4);
INSERT INTO Prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 41, '2025-03-01', '2025-03-15', 'Devuelto'),
(2, 42, '2025-03-02', NULL, 'Activo'),
(3, 43, '2025-03-03', '2025-03-17', 'Devuelto'),
(4, 44, '2025-03-04', NULL, 'Retrasado'),
(5, 45, '2025-03-05', NULL, 'Activo'),
(6, 46, '2025-03-06', '2025-03-20', 'Devuelto'),
(7, 47, '2025-03-07', NULL, 'Activo'),
(8, 48, '2025-03-08', '2025-03-22', 'Devuelto'),
(9, 49, '2025-03-09', NULL, 'Retrasado'),
(10, 50, '2025-03-10', NULL, 'Activo'),
(11, 51, '2025-03-11', '2025-03-25', 'Devuelto'),
(12, 52, '2025-03-12', NULL, 'Activo'),
(13, 53, '2025-03-13', '2025-03-27', 'Devuelto'),
(14, 54, '2025-03-14', NULL, 'Retrasado'),
(15, 55, '2025-03-15', NULL, 'Activo'),
(16, 56, '2025-03-16', '2025-03-30', 'Devuelto'),
(17, 57, '2025-03-17', NULL, 'Activo'),
(18, 58, '2025-03-18', '2025-04-01', 'Devuelto'),
(19, 59, '2025-03-19', NULL, 'Retrasado'),
(20, 60, '2025-03-20', '2025-04-03', 'Devuelto');

SELECT U.nombre AS usuario, U.apellido,
       L.titulo AS libro, P.fecha_prestamo, P.fecha_devolucion, P.estado
FROM Prestamo P
JOIN Usuario U ON P.id_usuario = U.id_usuario
JOIN Libro L ON P.id_libro = L.id_libro
WHERE P.estado = 'Activo' AND U.id_usuario = 2;