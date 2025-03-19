CREATE DATABASE TIENDAENLINEA;
USE TIENDAENLINEA;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT NOT NULL
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE DetallePedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE
);
INSERT INTO Cliente (nombre, apellido, email, telefono, direccion) VALUES
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
INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES
('Laptop HP 15"', 'Laptop con procesador Intel Core i5, 8GB RAM, 512GB SSD', 850.00, 25),
('Mouse Logitech G502', 'Mouse gamer con sensor HERO 25K', 65.99, 40),
('Teclado Mecánico Redragon K552', 'Teclado con switches mecánicos y retroiluminación RGB', 45.00, 35),
('Monitor Samsung 24"', 'Monitor LED Full HD 75Hz', 150.00, 30),
('Disco Duro Externo 1TB', 'HDD portátil USB 3.0', 65.00, 50),
('Silla Gamer Cougar', 'Silla ergonómica con soporte lumbar', 220.00, 15),
('Smartphone Samsung Galaxy S23', 'Teléfono con pantalla AMOLED y cámara de 50MP', 999.99, 10),
('Audífonos Sony WH-1000XM4', 'Audífonos inalámbricos con cancelación de ruido', 299.00, 20),
('Tarjeta de Video RTX 4060', 'GPU de alto rendimiento para gaming', 499.00, 12),
('Impresora Epson L3250', 'Impresora multifuncional con sistema de tinta continua', 180.00, 20),
('Tablet iPad 10.2"', 'iPad de 10ª generación con 64GB de almacenamiento', 329.00, 18),
('Consola PlayStation 5', 'Consola de nueva generación con SSD ultrarrápido', 499.00, 10),
('Cámara Canon EOS Rebel T7', 'Cámara digital DSLR con lente 18-55mm', 450.00, 10),
('Router TP-Link AX3000', 'Router Wi-Fi 6 con doble banda', 110.00, 25),
('Memoria RAM Corsair 16GB DDR4', 'Módulo de memoria de 3200MHz', 70.00, 40),
('Microprocesador Ryzen 7 5800X', 'Procesador de 8 núcleos y 16 hilos', 320.00, 15),
('SSD NVMe Samsung 1TB', 'Unidad de almacenamiento ultrarrápida PCIe 4.0', 130.00, 30),
('Fuente de Poder 750W 80 Plus Gold', 'Fuente de alimentación certificada', 100.00, 22),
('Mousepad RGB Razer', 'Alfombrilla para mouse con iluminación RGB', 30.00, 45),
('Webcam Logitech C920', 'Cámara Full HD con micrófono estéreo', 90.00, 28);
INSERT INTO Pedido (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-03-01 10:30:00', 'Entregado'),
(2, '2025-03-02 15:45:00', 'Enviado'),
(3, '2025-03-03 18:00:00', 'Pendiente'),
(4, '2025-03-04 12:15:00', 'Cancelado'),
(5, '2025-03-05 14:20:00', 'Entregado'),
(6, '2025-03-06 17:10:00', 'Enviado'),
(7, '2025-03-07 11:35:00', 'Pendiente'),
(8, '2025-03-08 16:40:00', 'Entregado'),
(9, '2025-03-09 19:25:00', 'Enviado'),
(10, '2025-03-10 13:50:00', 'Cancelado'),
(11, '2025-03-11 08:30:00', 'Pendiente'),
(12, '2025-03-12 20:10:00', 'Entregado'),
(13, '2025-03-13 14:50:00', 'Enviado'),
(14, '2025-03-14 10:45:00', 'Pendiente'),
(15, '2025-03-15 12:00:00', 'Entregado'),
(16, '2025-03-16 18:15:00', 'Cancelado'),
(17, '2025-03-17 09:40:00', 'Pendiente'),
(18, '2025-03-18 11:25:00', 'Enviado'),
(19, '2025-03-19 17:30:00', 'Entregado'),
(20, '2025-03-20 13:15:00', 'Pendiente');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 850.00),
(1, 5, 2, 65.00),
(2, 2, 1, 65.99),
(2, 3, 1, 45.00),
(3, 4, 1, 150.00),
(3, 6, 1, 220.00),
(4, 7, 1, 999.99),
(4, 8, 1, 299.00),
(5, 9, 1, 499.00),
(5, 10, 1, 180.00),
(6, 11, 1, 329.00),
(6, 12, 1, 499.00),
(7, 13, 1, 450.00),
(7, 14, 1, 110.00),
(8, 15, 2, 70.00),
(8, 16, 1, 320.00),
(9, 17, 1, 130.00),
(9, 18, 1, 100.00),
(10, 19, 3, 30.00),
(10, 20, 1, 90.00);
SELECT C.nombre AS cliente, C.apellido AS apellido,
       P.nombre AS producto, DP.cantidad, DP.precio_unitario,
       (DP.cantidad * DP.precio_unitario) AS total
FROM DetallePedido DP
JOIN Pedido Pe ON DP.id_pedido = Pe.id_pedido
JOIN Cliente C ON Pe.id_cliente = C.id_cliente
JOIN Producto P ON DP.id_producto = P.id_producto
WHERE C.id_cliente = 1; -- Cambia el ID para consultar otro cliente
