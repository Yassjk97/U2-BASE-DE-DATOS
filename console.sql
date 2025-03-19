CREATE DATABASE IF NOT EXISTS gestiondehospital;
USE gestiondehospital;

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    direccion VARCHAR(100),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE Cita (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT,
    id_medico INT,
    fecha DATE,
    hora TIME,
    motivo VARCHAR(100),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico) ON DELETE CASCADE
);

CREATE TABLE Tratamiento (
    id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT,
    diagnostico VARCHAR(100),
    medicamento VARCHAR(100),
    duracion VARCHAR(50),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON DELETE CASCADE
);
INSERT INTO Paciente (nombre, apellido, fecha_nacimiento, telefono, direccion, email) VALUES
('Juan', 'Pérez', '1985-04-12', '5551234567', 'Calle 123, Ciudad', 'juan.perez@email.com'),
('Maria', 'Gomez', '1990-08-22', '5559876543', 'Avenida 456, Ciudad', 'maria.gomez@email.com'),
('Carlos', 'Ramirez', '1978-06-15', '5553216547', 'Calle 789, Ciudad', 'carlos.ramirez@email.com'),
('Ana', 'Torres', '2001-11-03', '5558765432', 'Boulevard 555, Ciudad', 'ana.torres@email.com'),
('Pedro', 'Lopez', '1995-09-27', '5556547890', 'Calle 321, Ciudad', 'pedro.lopez@email.com'),
('Lucia', 'Martinez', '1982-03-05', '5551472583', 'Avenida 888, Ciudad', 'lucia.martinez@email.com'),
('Fernando', 'Vega', '1973-12-22', '5553698521', 'Calle 963, Ciudad', 'fernando.vega@email.com'),
('Sofia', 'Jimenez', '2000-07-18', '5557412589', 'Pasaje 741, Ciudad', 'sofia.jimenez@email.com'),
('Miguel', 'Hernandez', '1989-05-30', '5558521479', 'Calle 654, Ciudad', 'miguel.hernandez@email.com'),
('Laura', 'Ortega', '1993-10-25', '5559637412', 'Avenida 159, Ciudad', 'laura.ortega@email.com'),
('Hugo', 'Garcia', '1980-08-14', '5553571598', 'Calle 852, Ciudad', 'hugo.garcia@email.com'),
('Clara', 'Navarro', '1998-04-08', '5559517536', 'Avenida 357, Ciudad', 'clara.navarro@email.com'),
('Andres', 'Castro', '2003-02-12', '5558529631', 'Pasaje 456, Ciudad', 'andres.castro@email.com'),
('Elena', 'Suarez', '1977-06-19', '5551593574', 'Calle 777, Ciudad', 'elena.suarez@email.com'),
('Javier', 'Mendoza', '1991-09-03', '5557539516', 'Boulevard 159, Ciudad', 'javier.mendoza@email.com'),
('Paula', 'Diaz', '1986-12-29', '5552587413', 'Calle 963, Ciudad', 'paula.diaz@email.com'),
('Raul', 'Santos', '1996-07-05', '5559514562', 'Avenida 741, Ciudad', 'raul.santos@email.com'),
('Daniela', 'Morales', '1994-11-09', '5554562587', 'Pasaje 369, Ciudad', 'daniela.morales@email.com'),
('Esteban', 'Rojas', '1974-03-21', '5558521597', 'Calle 258, Ciudad', 'esteban.rojas@email.com'),
('Camila', 'Fernandez', '2002-05-17', '5551598524', 'Boulevard 963, Ciudad', 'camila.fernandez@email.com');
INSERT INTO Medico (nombre, apellido, especialidad, telefono, email) VALUES
('Carlos', 'Martinez', 'Cardiología', '5550001111', 'carlos.martinez@hospital.com'),
('Ana', 'Lopez', 'Pediatría', '5552223333', 'ana.lopez@hospital.com'),
('Ricardo', 'Gomez', 'Neurología', '5554445555', 'ricardo.gomez@hospital.com'),
('Marta', 'Perez', 'Ginecología', '5556667777', 'marta.perez@hospital.com'),
('Jorge', 'Ramirez', 'Dermatología', '5558889999', 'jorge.ramirez@hospital.com'),
('Sofia', 'Hernandez', 'Oncología', '5551231234', 'sofia.hernandez@hospital.com'),
('Diego', 'Fernandez', 'Ortopedia', '5554567890', 'diego.fernandez@hospital.com'),
('Laura', 'Santos', 'Endocrinología', '5551473698', 'laura.santos@hospital.com'),
('Pedro', 'Diaz', 'Neumología', '5552581473', 'pedro.diaz@hospital.com'),
('Lucia', 'Mendoza', 'Psiquiatría', '5553692581', 'lucia.mendoza@hospital.com'),
('Fernando', 'Navarro', 'Cardiología', '5557418523', 'fernando.navarro@hospital.com'),
('Elena', 'Castro', 'Medicina General', '5558529637', 'elena.castro@hospital.com'),
('Andres', 'Suarez', 'Traumatología', '5559631472', 'andres.suarez@hospital.com'),
('Raquel', 'Mendez', 'Urología', '5553571596', 'raquel.mendez@hospital.com'),
('Javier', 'Ortega', 'Otorrinolaringología', '5552587419', 'javier.ortega@hospital.com'),
('Daniel', 'Rojas', 'Geriatría', '5559513574', 'daniel.rojas@hospital.com'),
('Camila', 'Garcia', 'Gastroenterología', '5554569512', 'camila.garcia@hospital.com'),
('Roberto', 'Jimenez', 'Hematología', '5557531594', 'roberto.jimenez@hospital.com'),
('Paula', 'Morales', 'Reumatología', '5559517538', 'paula.morales@hospital.com'),
('Hugo', 'Vega', 'Oftalmología', '5553697415', 'hugo.vega@hospital.com');
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, motivo) VALUES
(1, 1, '2025-03-20', '10:30:00', 'Chequeo general'),
(2, 2, '2025-03-21', '14:00:00', 'Revisión pediátrica'),
(3, 3, '2025-03-22', '16:00:00', 'Consulta por migrañas'),
(4, 4, '2025-03-23', '09:00:00', 'Control ginecológico'),
(5, 5, '2025-03-24', '11:45:00', 'Erupción en la piel'),
(6, 6, '2025-03-25', '13:30:00', 'Chequeo oncológico'),
(7, 7, '2025-03-26', '15:00:00', 'Dolor de rodilla'),
(8, 8, '2025-03-27', '08:15:00', 'Revisión hormonal'),
(9, 9, '2025-03-28', '10:00:00', 'Problemas respiratorios'),
(10, 10, '2025-03-29', '12:30:00', 'Ansiedad y estrés'),
(11, 11, '2025-03-30', '14:00:00', 'Chequeo cardiológico'),
(12, 12, '2025-03-31', '16:30:00', 'Dolor abdominal'),
(13, 13, '2025-04-01', '09:45:00', 'Fractura de brazo'),
(14, 14, '2025-04-02', '11:15:00', 'Dolor al orinar'),
(15, 15, '2025-04-03', '13:45:00', 'Pérdida auditiva'),
(16, 16, '2025-04-04', '15:30:00', 'Chequeo geriátrico'),
(17, 17, '2025-04-05', '08:00:00', 'Acidez estomacal'),
(18, 18, '2025-04-06', '10:15:00', 'Chequeo de sangre'),
(19, 19, '2025-04-07', '12:45:00', 'Dolor articular'),
(20, 20, '2025-04-08', '14:30:00', 'Problemas de visión');
INSERT INTO Tratamiento (id_paciente, diagnostico, medicamento, duracion) VALUES
(1, 'Hipertensión', 'Losartán 50mg', '6 meses'),
(2, 'Alergia estacional', 'Loratadina 10mg', '2 semanas'),
(3, 'Migrañas crónicas', 'Sumatriptán 100mg', '3 meses'),
(4, 'Síndrome de ovario poliquístico', 'Metformina 850mg', '1 año'),
(5, 'Dermatitis atópica', 'Cremas con corticoides', '2 meses'),
(6, 'Cáncer de mama', 'Quimioterapia', '6 meses'),
(7, 'Artritis reumatoide', 'Metotrexato 10mg', 'Indefinido'),
(8, 'Diabetes tipo 2', 'Insulina Glargina', 'Indefinido'),
(9, 'Asma', 'Salbutamol inhalador', 'Según necesidad'),
(10, 'Ansiedad generalizada', 'Sertralina 50mg', '1 año'),
(11, 'Insuficiencia cardiaca', 'Carvedilol 12.5mg', 'Indefinido'),
(12, 'Úlcera gástrica', 'Omeprazol 20mg', '8 semanas'),
(13, 'Fractura de fémur', 'Fisioterapia y analgésicos', '3 meses'),
(14, 'Infección urinaria', 'Nitrofurantoína 100mg', '10 días'),
(15, 'Pérdida auditiva', 'Aparatos auditivos', 'Indefinido'),
(16, 'Osteoporosis', 'Alendronato 70mg', '6 meses'),
(17, 'Reflujo gastroesofágico', 'Esomeprazol 40mg', '3 meses'),
(18, 'Anemia ferropénica', 'Sulfato ferroso 300mg', '2 meses'),
(19, 'Gota', 'Alopurinol 100mg', 'Indefinido'),
(20, 'Miopía severa', 'Cirugía LASIK', 'Única aplicación');
CREATE INDEX idx_paciente_email ON Paciente(email);
CREATE INDEX idx_paciente_nombre ON Paciente(nombre, apellido);
CREATE INDEX idx_medico_email ON Medico(email);
CREATE INDEX idx_medico_especialidad ON Medico(especialidad);
CREATE INDEX idx_cita_paciente ON Cita(id_paciente);
CREATE INDEX idx_cita_medico ON Cita(id_medico);
CREATE INDEX idx_cita_fecha ON Cita(fecha, hora);
CREATE INDEX idx_tratamiento_paciente ON Tratamiento(id_paciente);
CREATE INDEX idx_tratamiento_diagnostico ON Tratamiento(diagnostico);

SELECT P.nombre AS paciente, P.apellido AS apellido_paciente,
       C.id_cita, C.fecha, C.hora, C.motivo,
       M.nombre AS medico, M.apellido AS apellido_medico, M.especialidad
FROM Cita C
JOIN Paciente P ON C.id_paciente = P.id_paciente
JOIN Medico M ON C.id_medico = M.id_medico
WHERE C.id_paciente = 5;