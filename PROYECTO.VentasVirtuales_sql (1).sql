create database Ventas;
use Ventas;

create table Clientes(
dni_cliente INT PRIMARY KEY NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
email VARCHAR(30) UNIQUE,
telefono VARCHAR(20) NOT NULL,
direccion VARCHAR(30) NOT NULL,
ciudad VARCHAR(30) NOT NULL);

create table Ordenes (
	id_orden INT PRIMARY KEY NOT NULL,
    dni_cliente INT NOT NULL,
	fecha_orden DATE NOT NULL,
	total_orden DECIMAL(10,2) NOT NULL,
	estado VARCHAR(20) NOT NULL,
    
    constraint fk_productos_clientes
		foreign key (dni_cliente)
        references Clientes(dni_cliente)
        on delete restrict
        on update cascade
);

create table Productos(
	id_producto INT PRIMARY KEY NOT NULL,
    nombre_producto VARCHAR(30) UNIQUE,
    descripcion VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL);
    
create table Detalle_Orden(
	id_detalle INT PRIMARY KEY NOT NULL,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    
    constraint fk_detalleo_orden
		foreign key (id_orden)
        references Ordenes(id_orden)
        on delete restrict
        on update cascade,
        
	constraint fk_detalleo_productos
		foreign key (id_producto)
        references Productos(id_producto)
		on delete restrict
        on update cascade
);



INSERT INTO Clientes (dni_cliente, nombre, apellido, email, telefono, direccion, ciudad) VALUES
(11111111, 'Ana', 'Gomez', 'ana.gomez@mail.com', '3511234567', 'Av. Central 100', 'Cordoba'),
(22222222, 'Luis', 'Perez', 'luis.perez@mail.com', '3512345678', 'Calle Falsa 123', 'Cordoba'),
(33333333, 'Maria', 'Lopez', 'maria.lopez@mail.com', '3513456789', 'Bv. San Juan 500', 'Buenos Aires'),
(44444444, 'Carlos', 'Garcia', 'carlos.garcia@mail.com', '3514567890', 'Ruta 20 Km 5', 'Rosario'),
(55555555, 'Elena', 'Rodriguez', 'elena.r@mail.com', '3515678901', 'Libertador 88', 'Cordoba'),
(66666666, 'Javier', 'Fernandez', 'javi.fer@mail.com', '3516789012', 'Salta 990', 'Mendoza'),
(77777777, 'Sofia', 'Martinez', 'sofia.m@mail.com', '3517890123', 'Belgrano 45', 'Cordoba'),
(88888888, 'Pablo', 'Diaz', 'pablo.d@mail.com', '3518901234', 'Maipu 1500', 'Buenos Aires'),
(99999999, 'Laura', 'Sanchez', 'laura.s@mail.com', '3519012345', 'Chacabuco 77', 'Rosario'),
(10101010, 'Diego', 'Torres', 'diego.t@mail.com', '3510123456', 'Colon 2020', 'Cordoba');



INSERT INTO Productos (id_producto, nombre_producto, descripcion, precio, stock) VALUES
(1, 'Laptop Gamer X', 'Potente laptop con 16GB RAM y RTX 3060.', '1250.00', 50),
(2, 'Mouse Optico Z', 'Mouse ergonómico de 16000 DPI.', '35.50', 300),
(3, 'Teclado Mecanico', 'Teclado con switches marrones y RGB.', '90.99', 150),
(4, 'Monitor 27 Pulg', 'Monitor 4K, 144Hz, ideal para gaming y diseño.', '450.00', 75),
(5, 'Webcam HD Pro', 'Cámara web con resolución 1080p.', '55.00', 200),
(6, 'Disco SSD 1TB', 'Unidad de estado sólido de alta velocidad.', '75.99', 100),
(7, 'Router WiFi 6', 'Router de última generación con gran cobertura.', '110.00', 80),
(8, 'Impresora Laser', 'Impresora monocromática de alto rendimiento.', '200.00', 40),
(9, 'Auriculares BT', 'Auriculares inalámbricos con cancelación de ruido.', '65.50', 250),
(10, 'Smartwatch Plus', 'Reloj inteligente con monitor de ritmo cardíaco.', '150.00', 60);



INSERT INTO Ordenes (id_orden, dni_cliente, fecha_orden, total_orden, estado) VALUES
(1, 11111111, '2025-01-10', '1340.99', 'Entregada'),
(2, 11111111, '2025-02-15', '166.49', 'Pendiente'),
(3, 11111111, '2025-03-01', '210.99', 'Entregada'),
(4, 11111111, '2025-03-20', '300.00', 'Entregada'),
(5, 11111111, '2025-04-05', '70.50', 'Enviada'),
(6, 11111111, '2025-04-12', '1375.50', 'Entregada'),
(7, 11111111, '2025-05-01', '135.50', 'Pendiente'),
(8, 11111111, '2025-05-18', '500.00', 'Entregada'),
(9, 11111111, '2025-06-03', '70.99', 'Entregada'),
(10, 11111111, '2025-06-19', '175.99', 'Enviada'),

(11, 22222222, '2025-01-20', '1340.99', 'Entregada'),
(12, 22222222, '2025-02-25', '166.49', 'Entregada'),
(13, 22222222, '2025-03-05', '210.99', 'Pendiente'),
(14, 22222222, '2025-03-25', '300.00', 'Entregada'),
(15, 22222222, '2025-04-10', '70.50', 'Enviada'),
(16, 22222222, '2025-04-20', '1375.50', 'Entregada'),
(17, 22222222, '2025-05-05', '135.50', 'Entregada'),
(18, 22222222, '2025-05-25', '500.00', 'Pendiente'),
(19, 22222222, '2025-06-10', '70.99', 'Enviada'),
(20, 22222222, '2025-06-25', '175.99', 'Entregada'),

(21, 33333333, '2025-01-25', '1340.99', 'Pendiente'),
(22, 33333333, '2025-02-01', '166.49', 'Entregada'),
(23, 33333333, '2025-03-10', '210.99', 'Entregada'),
(24, 33333333, '2025-04-01', '300.00', 'Enviada'),
(25, 33333333, '2025-04-15', '70.50', 'Entregada'),
(26, 33333333, '2025-04-25', '1375.50', 'Entregada'),
(27, 33333333, '2025-05-10', '135.50', 'Pendiente'),
(28, 33333333, '2025-05-30', '500.00', 'Entregada'),
(29, 33333333, '2025-06-15', '70.99', 'Enviada'),
(30, 33333333, '2025-07-01', '175.99', 'Entregada'),

(31, 44444444, '2025-01-30', '1340.99', 'Entregada'),
(32, 44444444, '2025-02-05', '166.49', 'Entregada'),
(33, 44444444, '2025-03-15', '210.99', 'Pendiente'),
(34, 44444444, '2025-04-05', '300.00', 'Entregada'),
(35, 44444444, '2025-04-20', '70.50', 'Entregada'),
(36, 44444444, '2025-05-01', '1375.50', 'Enviada'),
(37, 44444444, '2025-05-15', '135.50', 'Entregada'),
(38, 44444444, '2025-06-05', '500.00', 'Pendiente'),
(39, 44444444, '2025-06-20', '70.99', 'Entregada'),
(40, 44444444, '2025-07-05', '175.99', 'Enviada'),

(41, 55555555, '2025-02-10', '1340.99', 'Entregada'),
(42, 55555555, '2025-02-28', '166.49', 'Pendiente'),
(43, 55555555, '2025-03-20', '210.99', 'Entregada'),
(44, 55555555, '2025-04-10', '300.00', 'Entregada'),
(45, 55555555, '2025-04-25', '70.50', 'Enviada'),
(46, 55555555, '2025-05-05', '1375.50', 'Entregada'),
(47, 55555555, '2025-05-20', '135.50', 'Pendiente'),
(48, 55555555, '2025-06-10', '500.00', 'Entregada'),
(49, 55555555, '2025-06-25', '70.99', 'Enviada'),
(50, 55555555, '2025-07-10', '175.99', 'Entregada'),

(51, 66666666, '2025-02-15', '1340.99', 'Entregada'),
(52, 66666666, '2025-03-05', '166.49', 'Entregada'),
(53, 66666666, '2025-03-25', '210.99', 'Pendiente'),
(54, 66666666, '2025-04-15', '300.00', 'Entregada'),
(55, 66666666, '2025-04-30', '70.50', 'Entregada'),
(56, 66666666, '2025-05-10', '1375.50', 'Enviada'),
(57, 66666666, '2025-05-25', '135.50', 'Entregada'),
(58, 66666666, '2025-06-15', '500.00', 'Pendiente'),
(59, 66666666, '2025-06-30', '70.99', 'Entregada'),
(60, 66666666, '2025-07-15', '175.99', 'Enviada'),

(61, 77777777, '2025-03-01', '1340.99', 'Entregada'),
(62, 77777777, '2025-03-10', '166.49', 'Pendiente'),
(63, 77777777, '2025-04-01', '210.99', 'Entregada'),
(64, 77777777, '2025-04-20', '300.00', 'Entregada'),
(65, 77777777, '2025-05-05', '70.50', 'Enviada'),
(66, 77777777, '2025-05-15', '1375.50', 'Entregada'),
(67, 77777777, '2025-05-30', '135.50', 'Pendiente'),
(68, 77777777, '2025-06-20', '500.00', 'Entregada'),
(69, 77777777, '2025-07-05', '70.99', 'Enviada'),
(70, 77777777, '2025-07-20', '175.99', 'Entregada'),

(71, 88888888, '2025-03-15', '1340.99', 'Pendiente'),
(72, 88888888, '2025-03-25', '166.49', 'Entregada'),
(73, 88888888, '2025-04-05', '210.99', 'Entregada'),
(74, 88888888, '2025-04-25', '300.00', 'Enviada'),
(75, 88888888, '2025-05-10', '70.50', 'Entregada'),
(76, 88888888, '2025-05-20', '1375.50', 'Entregada'),
(77, 88888888, '2025-06-05', '135.50', 'Pendiente'),
(78, 88888888, '2025-06-25', '500.00', 'Entregada'),
(79, 88888888, '2025-07-10', '70.99', 'Enviada'),
(80, 88888888, '2025-07-25', '175.99', 'Entregada'),

(81, 99999999, '2025-04-01', '1340.99', 'Entregada'),
(82, 99999999, '2025-04-10', '166.49', 'Entregada'),
(83, 99999999, '2025-04-20', '210.99', 'Pendiente'),
(84, 99999999, '2025-05-01', '300.00', 'Entregada'),
(85, 99999999, '2025-05-15', '70.50', 'Entregada'),
(86, 99999999, '2025-05-25', '1375.50', 'Enviada'),
(87, 99999999, '2025-06-10', '135.50', 'Entregada'),
(88, 99999999, '2025-06-30', '500.00', 'Pendiente'),
(89, 99999999, '2025-07-15', '70.99', 'Entregada'),
(90, 99999999, '2025-07-30', '175.99', 'Enviada'),

(91, 10101010, '2025-04-15', '1340.99', 'Entregada'),
(92, 10101010, '2025-04-25', '166.49', 'Pendiente'),
(93, 10101010, '2025-05-05', '210.99', 'Entregada'),
(94, 10101010, '2025-05-20', '300.00', 'Entregada'),
(95, 10101010, '2025-06-01', '70.50', 'Enviada'),
(96, 10101010, '2025-06-10', '1375.50', 'Entregada'),
(97, 10101010, '2025-06-25', '135.50', 'Pendiente'),
(98, 10101010, '2025-07-05', '500.00', 'Entregada'),
(99, 10101010, '2025-07-20', '70.99', 'Enviada'),
(100, 10101010, '2025-08-01', '175.99', 'Entregada');



INSERT INTO Detalle_Orden (id_detalle, id_orden, id_producto, cantidad, precio_unitario) VALUES
-- Ordenes 1 - 10 (Cliente 11111111)
(1, 1, 1, 1, '1250.00'), (2, 1, 3, 1, '90.99'),
(3, 2, 2, 2, '35.50'), (4, 2, 7, 1, '110.00'),
(5, 3, 3, 1, '90.99'), (6, 3, 8, 1, '200.00'),
(7, 4, 4, 1, '450.00'), (8, 4, 5, 1, '55.00'),
(9, 5, 5, 1, '55.00'), (10, 5, 6, 1, '75.99'),
(11, 6, 6, 2, '75.99'), (12, 6, 1, 1, '1250.00'),
(13, 7, 7, 1, '110.00'), (14, 7, 9, 2, '65.50'),
(15, 8, 8, 2, '200.00'), (16, 8, 10, 2, '150.00'),
(17, 9, 9, 1, '65.50'), (18, 9, 2, 1, '35.50'),
(19, 10, 10, 1, '150.00'), (20, 10, 4, 1, '450.00'),

-- Ordenes 11 - 20 (Cliente 22222222)
(21, 11, 1, 1, '1250.00'), (22, 11, 3, 1, '90.99'),
(23, 12, 2, 2, '35.50'), (24, 12, 7, 1, '110.00'),
(25, 13, 3, 1, '90.99'), (26, 13, 8, 1, '200.00'),
(27, 14, 4, 1, '450.00'), (28, 14, 5, 1, '55.00'),
(29, 15, 5, 1, '55.00'), (30, 15, 6, 1, '75.99'),
(31, 16, 6, 2, '75.99'), (32, 16, 1, 1, '1250.00'),
(33, 17, 7, 1, '110.00'), (34, 17, 9, 2, '65.50'),
(35, 18, 8, 2, '200.00'), (36, 18, 10, 2, '150.00'),
(37, 19, 9, 1, '65.50'), (38, 19, 2, 1, '35.50'),
(39, 20, 10, 1, '150.00'), (40, 20, 4, 1, '450.00'),

-- Ordenes 21 - 30 (Cliente 33333333)
(41, 21, 1, 1, '1250.00'), (42, 21, 3, 1, '90.99'),
(43, 22, 2, 2, '35.50'), (44, 22, 7, 1, '110.00'),
(45, 23, 3, 1, '90.99'), (46, 23, 8, 1, '200.00'),
(47, 24, 4, 1, '450.00'), (48, 24, 5, 1, '55.00'),
(49, 25, 5, 1, '55.00'), (50, 25, 6, 1, '75.99'),
(51, 26, 6, 2, '75.99'), (52, 26, 1, 1, '1250.00'),
(53, 27, 7, 1, '110.00'), (54, 27, 9, 2, '65.50'),
(55, 28, 8, 2, '200.00'), (56, 28, 10, 2, '150.00'),
(57, 29, 9, 1, '65.50'), (58, 29, 2, 1, '35.50'),
(59, 30, 10, 1, '150.00'), (60, 30, 4, 1, '450.00'),

-- Ordenes 31 - 40 (Cliente 44444444)
(61, 31, 1, 1, '1250.00'), (62, 31, 3, 1, '90.99'),
(63, 32, 2, 2, '35.50'), (64, 32, 7, 1, '110.00'),
(65, 33, 3, 1, '90.99'), (66, 33, 8, 1, '200.00'),
(67, 34, 4, 1, '450.00'), (68, 34, 5, 1, '55.00'),
(69, 35, 5, 1, '55.00'), (70, 35, 6, 1, '75.99'),
(71, 36, 6, 2, '75.99'), (72, 36, 1, 1, '1250.00'),
(73, 37, 7, 1, '110.00'), (74, 37, 9, 2, '65.50'),
(75, 38, 8, 2, '200.00'), (76, 38, 10, 2, '150.00'),
(77, 39, 9, 1, '65.50'), (78, 39, 2, 1, '35.50'),
(79, 40, 10, 1, '150.00'), (80, 40, 4, 1, '450.00'),

-- Ordenes 41 - 50 (Cliente 55555555)
(81, 41, 1, 1, '1250.00'), (82, 41, 3, 1, '90.99'),
(83, 42, 2, 2, '35.50'), (84, 42, 7, 1, '110.00'),
(85, 43, 3, 1, '90.99'), (86, 43, 8, 1, '200.00'),
(87, 44, 4, 1, '450.00'), (88, 44, 5, 1, '55.00'),
(89, 45, 5, 1, '55.00'), (90, 45, 6, 1, '75.99'),
(91, 46, 6, 2, '75.99'), (92, 46, 1, 1, '1250.00'),
(93, 47, 7, 1, '110.00'), (94, 47, 9, 2, '65.50'),
(95, 48, 8, 2, '200.00'), (96, 48, 10, 2, '150.00'),
(97, 49, 9, 1, '65.50'), (98, 49, 2, 1, '35.50'),
(99, 50, 10, 1, '150.00'), (100, 50, 4, 1, '450.00'),

-- Ordenes 51 - 60 (Cliente 66666666)
(101, 51, 1, 1, '1250.00'), (102, 51, 3, 1, '90.99'),
(103, 52, 2, 2, '35.50'), (104, 52, 7, 1, '110.00'),
(105, 53, 3, 1, '90.99'), (106, 53, 8, 1, '200.00'),
(107, 54, 4, 1, '450.00'), (108, 54, 5, 1, '55.00'),
(109, 55, 5, 1, '55.00'), (110, 55, 6, 1, '75.99'),
(111, 56, 6, 2, '75.99'), (112, 56, 1, 1, '1250.00'),
(113, 57, 7, 1, '110.00'), (114, 57, 9, 2, '65.50'),
(115, 58, 8, 2, '200.00'), (116, 58, 10, 2, '150.00'),
(117, 59, 9, 1, '65.50'), (118, 59, 2, 1, '35.50'),
(119, 60, 10, 1, '150.00'), (120, 60, 4, 1, '450.00'),

-- Ordenes 61 - 70 (Cliente 77777777)
(121, 61, 1, 1, '1250.00'), (122, 61, 3, 1, '90.99'),
(123, 62, 2, 2, '35.50'), (124, 62, 7, 1, '110.00'),
(125, 63, 3, 1, '90.99'), (126, 63, 8, 1, '200.00'),
(127, 64, 4, 1, '450.00'), (128, 64, 5, 1, '55.00'),
(129, 65, 5, 1, '55.00'), (130, 65, 6, 1, '75.99'),
(131, 66, 6, 2, '75.99'), (132, 66, 1, 1, '1250.00'),
(133, 67, 7, 1, '110.00'), (134, 67, 9, 2, '65.50'),
(135, 68, 8, 2, '200.00'), (136, 68, 10, 2, '150.00'),
(137, 69, 9, 1, '65.50'), (138, 69, 2, 1, '35.50'),
(139, 70, 10, 1, '150.00'), (140, 70, 4, 1, '450.00'),

-- Ordenes 71 - 80 (Cliente 88888888)
(141, 71, 1, 1, '1250.00'), (142, 71, 3, 1, '90.99'),
(143, 72, 2, 2, '35.50'), (144, 72, 7, 1, '110.00'),
(145, 73, 3, 1, '90.99'), (146, 73, 8, 1, '200.00'),
(147, 74, 4, 1, '450.00'), (148, 74, 5, 1, '55.00'),
(149, 75, 5, 1, '55.00'), (150, 75, 6, 1, '75.99'),
(151, 76, 6, 2, '75.99'), (152, 76, 1, 1, '1250.00'),
(153, 77, 7, 1, '110.00'), (154, 77, 9, 2, '65.50'),
(155, 78, 8, 2, '200.00'), (156, 78, 10, 2, '150.00'),
(157, 79, 9, 1, '65.50'), (158, 79, 2, 1, '35.50'),
(159, 80, 10, 1, '150.00'), (160, 80, 4, 1, '450.00'),

-- Ordenes 81 - 90 (Cliente 99999999)
(161, 81, 1, 1, '1250.00'), (162, 81, 3, 1, '90.99'),
(163, 82, 2, 2, '35.50'), (164, 82, 7, 1, '110.00'),
(165, 83, 3, 1, '90.99'), (166, 83, 8, 1, '200.00'),
(167, 84, 4, 1, '450.00'), (168, 84, 5, 1, '55.00'),
(169, 85, 5, 1, '55.00'), (170, 85, 6, 1, '75.99'),
(171, 86, 6, 2, '75.99'), (172, 86, 1, 1, '1250.00'),
(173, 87, 7, 1, '110.00'), (174, 87, 9, 2, '65.50'),
(175, 88, 8, 2, '200.00'), (176, 88, 10, 2, '150.00'),
(177, 89, 9, 1, '65.50'), (178, 89, 2, 1, '35.50'),
(179, 90, 10, 1, '150.00'), (180, 90, 4, 1, '450.00'),

-- Ordenes 91 - 100 (Cliente 10101010)
(181, 91, 1, 1, '1250.00'), (182, 91, 3, 1, '90.99'),
(183, 92, 2, 2, '35.50'), (184, 92, 7, 1, '110.00'),
(185, 93, 3, 1, '90.99'), (186, 93, 8, 1, '200.00'),
(187, 94, 4, 1, '450.00'), (188, 94, 5, 1, '55.00'),
(189, 95, 5, 1, '55.00'), (190, 95, 6, 1, '75.99'),
(191, 96, 6, 2, '75.99'), (192, 96, 1, 1, '1250.00'),
(193, 97, 7, 1, '110.00'), (194, 97, 9, 2, '65.50'),
(195, 98, 8, 2, '200.00'), (196, 98, 10, 2, '150.00'),
(197, 99, 9, 1, '65.50'), (198, 99, 2, 1, '35.50'),
(199, 100, 10, 1, '150.00'), (200, 100, 4, 1, '450.00');
   
-- GESTION DE PRODUCTOS --
-- creamos procedimiento para AGREGAR PRODUCTO en la tabla
delimiter $$
create procedure agregar_producto(
	IN p_id INT,
    IN p_nombre VARCHAR(50),
    IN p_desc VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)    
    BEGIN
		insert into Productos (id_producto,nombre_producto, descripcion,precio,stock)
        values (p_id, p_nombre, p_desc, p_precio, p_stock);
	END $$
    DELIMITER ;
    
-- creamos procedimiento para ACTUALIZAR PRODUCTO de la tabla
DELIMITER $$
CREATE PROCEDURE actualizar_producto (
    IN p_id INT,
    IN p_nuevo_precio DECIMAL(10,2),
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE Productos
    SET precio = p_nuevo_precio,
        stock = p_nuevo_stock
    WHERE id_producto = p_id;
    end $$
    delimiter ;
    
-- creamos procedimiento para VER PRODUCTOS de la tabla
DELIMITER $$
CREATE PROCEDURE ver_productos()
BEGIN
    SELECT * FROM Productos;
END $$

DELIMITER ;

-- creamos procedimiento para VER PRODUCTO POR ID
DELIMITER $$
CREATE PROCEDURE ver_producto_por_id(IN p_id INT)
BEGIN
    SELECT *
    FROM Productos
    WHERE id_producto = p_id;
END $$

DELIMITER ;

-- creamos procedimiento para ELIMINAR PRODUCTO de la tabla
DELIMITER $$
CREATE PROCEDURE eliminar_producto(IN p_id INT)
BEGIN
    SELECT * 
    FROM productos
    WHERE id_producto = p_id;

    DELETE FROM productos
    WHERE id_producto = p_id;
END $$

DELIMITER ;




-- GESTION DE CLIENTES --
-- creamos procedimiento para REGISTRAR CLIENTES nuevos en la tabla
delimiter $$
create procedure registrar_cliente(
	IN p_dni INT,
    in p_nombre VARCHAR(30),
    in p_apellido VARCHAR(30),
    in p_email VARCHAR(30),
    in p_telefono VARCHAR(20),
    in p_direccion VARCHAR(30),
    in p_ciudad VARCHAR(30)
)
	BEGIN
		insert into Clientes (dni_cliente,nombre,apellido,email,telefono,direccion,ciudad)
        values (p_dni, p_nombre,p_apellido,p_email,p_telefono,p_direccion,p_ciudad);
	end $$
    delimiter ;
    

-- creamos procedimiento para ACTUALIZAR CLIENTE en la tabla
delimiter $$
CREATE PROCEDURE actualizar_cliente(
    IN p_dni_cliente INT,
    IN p_nombre VARCHAR(30),
    IN p_apellido VARCHAR(30),
    IN p_email VARCHAR(30),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(30),
    IN p_ciudad VARCHAR(30)
)
BEGIN
    UPDATE Clientes
    SET 
        nombre = p_nombre,
        apellido = p_apellido,
        email = p_email,
        telefono = p_telefono,
        direccion = p_direccion,
        ciudad = p_ciudad
        
    WHERE 
        dni_cliente = p_dni_cliente;
end $$
delimiter ;


-- creamos un procedimiento para MOSTRAR INFORMACION DE UN CLIENTE por su dni
delimiter //
create procedure VerClientePorDNI(in p_dni INT)
begin
	select *
    from Clientes
    where dni_cliente = p_dni;
end //
	delimiter ;


-- creamos procedimiento para VER TODOS LOS CLIENTES con su respectiva informacion
delimiter //
create procedure VerClientes()
begin
	select *
    from Clientes;
end //
delimiter ;


-- creamos un procedimiento solo para GESTIONAR LOS CONTACTOS
delimiter //

CREATE PROCEDURE ActualizarContactoCliente(
    IN p_dni_cliente INT,
    IN p_email VARCHAR(30),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(30),
    IN p_ciudad VARCHAR(30)
)
BEGIN
    UPDATE Clientes
    SET 
        email = p_email,
        telefono = p_telefono,
        direccion = p_direccion,
        ciudad = p_ciudad
        
    WHERE 
        dni_cliente = p_dni_cliente;
END //

DELIMITER ;


-- PROCESAMIENTO DE ORDENES --
-- creamos procedimiento para MOSTRAR ORDENES PEDIDAS POR UN CLIENTE
DELIMITER //
CREATE PROCEDURE MostrarOrdenesDeCliente(
    IN p_dni_cliente INT
)
BEGIN
    SELECT
        Ordenes.id_orden AS 'Numero_Orden',
        Ordenes.fecha_orden AS 'Fecha',
        Productos.nombre_producto AS 'Producto',
        Detalle_Orden.cantidad AS 'Cantidad',
        Detalle_Orden.precio_unitario AS 'Precio_Unitario',
        (Detalle_Orden.cantidad * Detalle_Orden.precio_unitario) AS 'Subtotal',
        Ordenes.estado AS 'Estado_Orden'
    FROM
        Ordenes
    INNER JOIN
        Detalle_Orden ON Ordenes.id_orden = Detalle_Orden.id_orden
    INNER JOIN
        Productos ON Detalle_Orden.id_producto = Productos.id_producto
    WHERE
        Ordenes.dni_cliente = p_dni_cliente
    ORDER BY
        Ordenes.fecha_orden DESC, Ordenes.id_orden;
END //

DELIMITER ;


-- BUSQUEDAS AVANZADAS --
-- creamos un procedimiento que FILTRE LOS PRODUCTOS MAS VENDIDOS
delimiter %%
create procedure ProductosMasVendidos()
begin
	select
		Productos.nombre_producto as 'producto',
        SUM(Detalle_Orden.cantidad) as 'cantidad_Total_Vendida',
        SUM(Detalle_Orden.cantidad * Detalle_Orden.precio_unitario) as 'Total_Ingresos'
	from
		Productos
	inner join
		Detalle_Orden on Productos.id_producto = Detalle_Orden.id_producto
	group by
		Productos.id_producto, Productos.nombre_producto
	order by
		cantidad_Total_Vendida desc, Total_Ingresos DESC;
end %%
delimiter ;



-- creamos un procedimiento que haga una busqueda avanzada para BUSCAR PRODUCTO POR TEXTO
DELIMITER //

CREATE PROCEDURE BuscarProductosPorTexto(
    IN p_texto VARCHAR(100)
)
BEGIN
    SELECT
        id_producto,
        nombre_producto,
        precio,
        stock
    FROM
        Productos
    WHERE
        nombre_producto LIKE CONCAT(p_texto)
    ORDER BY
        nombre_producto;
END //

DELIMITER ;



-- creamos un procedimiento para BUSCAR EL CLIENTE MAS ACTIVO (es decir, el que tenga mayor numero de ordenes)
DELIMITER //

CREATE PROCEDURE ClientesMasActivos(
    IN p_min_ordenes INT)
BEGIN
    SELECT
        Clientes.dni_cliente,
        Clientes.nombre,
        Clientes.apellido,
        COUNT(Ordenes.id_orden) AS 'Total_Ordenes'
    FROM
        Clientes
    INNER JOIN
        Ordenes ON Clientes.dni_cliente = Ordenes.dni_cliente
    GROUP BY
        Clientes.dni_cliente, Clientes.nombre, Clientes.apellido
    HAVING
        Total_Ordenes >= p_min_ordenes -- esto filtra los clientes que superan el mínimo pasado por parametro
    ORDER BY
        Total_Ordenes DESC;
END //
DELIMITER ;



-- REPORTE DE PRODUCTOS MAS VENDIDOS --
-- creamos un procedimiento para MOSTRAR EL PRODUCTO MAS VENDIDO CON SU CANTIDAD VENDIDA Y NOMBRE
delimiter %%
create procedure ProductoMasVendido()
begin
	select
		Productos.nombre_producto as 'producto',
        SUM(Detalle_Orden.cantidad) as 'cantidad_Total_Vendida'
	from
		Productos
	inner join
		Detalle_Orden on Productos.id_producto = Detalle_Orden.id_producto
	group by
		Productos.id_producto, Productos.nombre_producto
	order by
		cantidad_Total_Vendida desc
	LIMIT 1;
end %%
delimiter ;


-- MODIFICACIÓN DE VALOR DE UN PRODUCTO --
-- creamos un cursor para AJUSTAR LAS ORDENES DE UN PRODUCTO CON UNA CANTIDAD MAXIMA
DROP PROCEDURE IF EXISTS AjustarCantidadMaxima_Cursor;
DELIMITER $$

CREATE PROCEDURE AjustarCantidadMaxima_Cursor(
    IN p_id_producto_param INT,	-- ID del producto a buscar
    IN p_cantidad_maxima INT	-- cantidad máxima a la que se debe ajustar
)
BEGIN
    -- declaramos las variables, cursores y handler
    DECLARE fin BOOLEAN DEFAULT FALSE;
    
    DECLARE v_id_detalle_orden INT;
    DECLARE v_cantidad_actual INT;

    DECLARE cur CURSOR FOR
        SELECT id_detalle, cantidad
        FROM Detalle_Orden
        WHERE 
            id_producto = p_id_producto_param AND 
            cantidad > p_cantidad_maxima;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    OPEN cur; -- abrimos cursor

    loop_ajustar_cantidad: LOOP
        FETCH cur INTO v_id_detalle_orden, v_cantidad_actual;

        IF fin THEN
            LEAVE loop_ajustar_cantidad;
        END IF;

        UPDATE Detalle_Orden
        SET cantidad = p_cantidad_maxima
        WHERE id_detalle = v_id_detalle_orden;
        
    END LOOP;

    CLOSE cur;
    
END$$

DELIMITER ;
