-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS PlaySena;

-- Crear la base de datos
CREATE DATABASE PlaySena;

-- Usar la base de datos recién creada
USE PlaySena;

-- Tabla TipoUsuario
DROP TABLE IF EXISTS Tipo_Usuario;
CREATE TABLE Tipo_Usuario (
    IdTipo INT AUTO_INCREMENT,
    Tipo VARCHAR(50) NOT NULL,
    CONSTRAINT Tipo_Usuario_IdTipo_PK PRIMARY KEY (IdTipo)
);

-- Insertando tipos de usuario
INSERT INTO Tipo_Usuario (Tipo) VALUES ('Jugador'), ('Administrador');

-- Tabla Usuarios
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE Usuarios (
    IdUsuario INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    FotoURL VARCHAR(255) NOT NULL,
    TipoUsuarioId INT NOT NULL,
    CONSTRAINT Usuarios_IdUsuario_PK PRIMARY KEY (IdUsuario),
    CONSTRAINT Usuarios_TipoUsuarioId_FK FOREIGN KEY (TipoUsuarioId) REFERENCES Tipo_Usuario(IdTipo)
);

-- Tabla Etapas
DROP TABLE IF EXISTS Etapas;
CREATE TABLE Etapas (
    IdEtapa INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    CONSTRAINT Etapas_IdEtapa_PK PRIMARY KEY (IdEtapa)
);

-- Tabla Niveles
DROP TABLE IF EXISTS Niveles;
CREATE TABLE Niveles (
    IdNivel INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    EtapasId INT,
    CONSTRAINT Niveles_IdNivel_PK PRIMARY KEY (IdNivel),
    CONSTRAINT Niveles_EtapasId_FK FOREIGN KEY (EtapasId) REFERENCES Etapas(IdEtapa)
);

-- Tabla Desafios
DROP TABLE IF EXISTS Desafios;
CREATE TABLE Desafios (
    IdDesafio INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    ImagenURL VARCHAR(255) NOT NULL,
    CONSTRAINT Desafios_IdDesafio_PK PRIMARY KEY (IdDesafio)
);

-- Tabla Lecciones
DROP TABLE IF EXISTS Lecciones;
CREATE TABLE Lecciones (
    IdLeccion INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    ImagenURL VARCHAR(255) NOT NULL,
    CONSTRAINT Lecciones_IdLeccion_PK PRIMARY KEY (IdLeccion)
);

-- Tabla Opciones
DROP TABLE IF EXISTS Opciones;
CREATE TABLE Opciones (
    IdOpcion INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ImagenURL VARCHAR(255) NOT NULL,
    Tipo BOOLEAN NOT NULL,
    CONSTRAINT Opciones_IdOpcion_PK PRIMARY KEY (IdOpcion)
);

-- Tabla Niveles_Desafios
DROP TABLE IF EXISTS Niveles_Desafios;
CREATE TABLE Niveles_Desafios (
    Id INT AUTO_INCREMENT,
    NivelId INT,
    DesafiosId INT,
    CONSTRAINT Niveles_Desafios_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Niveles_Desafios_NivelId_FK FOREIGN KEY (NivelId) REFERENCES Niveles(IdNivel),
    CONSTRAINT Niveles_Desafios_DesafiosId_FK FOREIGN KEY (DesafiosId) REFERENCES Desafios(IdDesafio)
);

-- Tabla Niveles_Lecciones
DROP TABLE IF EXISTS Niveles_Lecciones;
CREATE TABLE Niveles_Lecciones (
    Id INT AUTO_INCREMENT,
    NivelId INT,
    LeccionId INT,
    CONSTRAINT Niveles_Lecciones_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Niveles_Lecciones_NivelId_FK FOREIGN KEY (NivelId) REFERENCES Niveles(IdNivel),
    CONSTRAINT Niveles_Lecciones_LeccionId_FK FOREIGN KEY (LeccionId) REFERENCES Lecciones(IdLeccion)
);

-- Tabla Desafios_Opciones
DROP TABLE IF EXISTS Desafios_Opciones;
CREATE TABLE Desafios_Opciones (
    Id INT AUTO_INCREMENT,
    DesafiosId INT,
    OpcionesId INT,
    CONSTRAINT Desafios_Opciones_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Desafios_Opciones_DesafiosId_FK FOREIGN KEY (DesafiosId) REFERENCES Desafios(IdDesafio),
    CONSTRAINT Desafios_Opciones_OpcionesId_FK FOREIGN KEY (OpcionesId) REFERENCES Opciones(IdOpcion)
);

-- Tabla Progreso
DROP TABLE IF EXISTS Progreso;
CREATE TABLE Progreso (
    Id INT AUTO_INCREMENT,
    UsuariosId INT NOT NULL,
    EtapasId INT NOT NULL,
    NivelesId INT NOT NULL,
    DesafiosId INT NOT NULL,
    Completado BOOLEAN NOT NULL DEFAULT 0,
    Experiencia INT NOT NULL DEFAULT 0,
    CONSTRAINT Progreso_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Progreso_UsuariosId_FK FOREIGN KEY (UsuariosId) REFERENCES Usuarios(IdUsuario),
    CONSTRAINT Progreso_EtapasId_FK FOREIGN KEY (EtapasId) REFERENCES Etapas(IdEtapa),
    CONSTRAINT Progreso_NivelesId_FK FOREIGN KEY (NivelesId) REFERENCES Niveles(IdNivel),
    CONSTRAINT Progreso_DesafiosId_FK FOREIGN KEY (DesafiosId) REFERENCES Desafios(IdDesafio)
);
