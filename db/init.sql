-- ============================================
-- BASE DE DATOS UNIFICADA PARA LOS 3 SERVICIOS
-- Licencias, Portal Paciente, Validador Aseguradora
-- Solo tablas principales
-- ============================================

-- 1️⃣ TABLA DE PACIENTES
CREATE TABLE patients (
    id BIGSERIAL PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT now()
);

-- 2️⃣ TABLA DE LICENCIAS
CREATE TABLE licenses (
    id BIGSERIAL PRIMARY KEY,
    folio VARCHAR(50) NOT NULL UNIQUE,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    diagnosis TEXT NOT NULL,
    start_date DATE NOT NULL,
    days INT NOT NULL CHECK (days > 0),
    status VARCHAR(20) NOT NULL DEFAULT 'issued',
    created_at TIMESTAMP DEFAULT now()
);

-- Índice por paciente para búsquedas rápidas
CREATE INDEX idx_licenses_patient_id ON licenses(patient_id);

-- ============================================
-- DATOS INICIALES DE EJEMPLO
-- ============================================

-- Pacientes
INSERT INTO patients (patient_id, first_name, last_name) VALUES
('11111111-1', 'Juan', 'Perez'),
('22222222-2', 'Maria', 'Gonzalez');

-- Licencia válida
INSERT INTO licenses (folio, patient_id, doctor_id, diagnosis, start_date, days, status)
VALUES
('L-1001', '11111111-1', 'D-123', 'Gripe', '2025-09-01', 7, 'issued');

-- ============================================
-- FIN DEL SCRIPT
-- ============================================
