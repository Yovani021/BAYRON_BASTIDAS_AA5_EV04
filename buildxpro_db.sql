-- ============================================================
-- CREACIÓN DE BASE DE DATOS DEL PROYECTO Build X Pro
-- ============================================================

-- Si la base de datos ya existe, se elimina para evitar conflictos
DROP DATABASE IF EXISTS buildxpro_db;

-- Crear nueva base de datos
CREATE DATABASE buildxpro_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos recién creada
USE buildxpro_db;

-- ============================================================
-- TABLA: usuarios
-- ============================================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100),
    contrasena VARCHAR(100) NOT NULL,
    rol ENUM('Administrador', 'Residente de Obra') NOT NULL
);

-- ============================================================
-- TABLA: proyectos
-- ============================================================
CREATE TABLE proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    responsable_id INT,
    FOREIGN KEY (responsable_id) REFERENCES usuarios(id_usuario)
);

-- ============================================================
-- TABLA: actividades
-- ============================================================
CREATE TABLE actividades (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado ENUM('Pendiente', 'En progreso', 'Completada') DEFAULT 'Pendiente',
    proyecto_id INT NOT NULL,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- ============================================================
-- TABLA: materiales
-- ============================================================
CREATE TABLE materiales (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT DEFAULT 0,
    unidad VARCHAR(50),
    costo_unitario DECIMAL(10,2),
    proyecto_id INT NOT NULL,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id_proyecto)
);

-- ============================================================
-- TABLA: evidencias
-- ============================================================
CREATE TABLE evidencias (
    id_evidencia INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    fecha_subida DATE,
    archivo VARCHAR(255),
    actividad_id INT NOT NULL,
    FOREIGN KEY (actividad_id) REFERENCES actividades(id_actividad)
);

-- ============================================================
-- DATOS INICIALES (usuarios de prueba)
-- ============================================================
INSERT INTO usuarios (nombre, apellido, usuario, correo, contrasena, rol)
VALUES 
('Sebastián', 'López', 'slopez', 'sebastian@buildxpro.com', '12345', 'Administrador'),
('Ximena', 'Calderón', 'xcalderon', 'ximena@buildxpro.com', '12345', 'Residente de Obra');

-- ============================================================
-- DATOS INICIALES (proyecto de ejemplo)
-- ============================================================
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin, responsable_id)
VALUES 
('Construcción Edificio Central', 'Proyecto principal de registro y control de obra', '2025-01-01', '2025-12-31', 1);

-- ============================================================
-- DATOS INICIALES (actividad de ejemplo)
-- ============================================================
INSERT INTO actividades (nombre, descripcion, fecha_inicio, fecha_fin, estado, proyecto_id)
VALUES 
('Excavación de terreno', 'Preparación inicial del área de construcción', '2025-01-05', '2025-01-20', 'Completada', 1);

-- ============================================================
-- DATOS INICIALES (materiales)
-- ============================================================
INSERT INTO materiales (nombre, cantidad, unidad, costo_unitario, proyecto_id)
VALUES 
('Cemento gris', 100, 'Bolsas', 28000, 1),
('Arena fina', 20, 'm3', 55000, 1);

-- ============================================================
-- DATOS INICIALES (evidencias)
-- ============================================================
INSERT INTO evidencias (descripcion, fecha_subida, archivo, actividad_id)
VALUES 
('Informe fotográfico de excavación finalizada', '2025-01-21', 'excavacion_final.jpg', 1);

-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================

SHOW TABLES;

