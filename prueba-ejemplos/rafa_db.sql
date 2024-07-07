-- Tabla TipoUsuario
CREATE TABLE Tipo_Usuario (
    IdTipo INT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    cod_tipo INT NOT NULL,
    CONSTRAINT Tipo_Usuario_IdTipo_PK PRIMARY KEY (IdTipo)
);

-- Insertando tipos de usuario
INSERT INTO Tipo_Usuario (Tipo) VALUES ('Jugador'), ('Administrador');

-- Tabla Usuarios
CREATE TABLE Usuarios (
    IdUsuario INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL,
    FotoURL VARCHAR(400) NOT NULL,
    TipoUsuarioId INT NOT NULL,
    CONSTRAINT Usuarios_IdUsuario_PK PRIMARY KEY (IdUsuario),
    CONSTRAINT Usuarios_TipoUsuarioId_FK FOREIGN KEY (TipoUsuarioId) REFERENCES Tipo_Usuario(IdTipo)
);

-- Tabla Etapas
CREATE TABLE Etapas (
    IdEtapa INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    CONSTRAINT Etapas_IdEtapa_PK PRIMARY KEY (IdEtapa)
);

-- Tabla Niveles
CREATE TABLE Niveles (
    IdNivel INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    EtapasId INT,
    CONSTRAINT Niveles_IdNivel_PK PRIMARY KEY (IdNivel),
    CONSTRAINT Niveles_EtapasId_FK FOREIGN KEY (EtapasId) REFERENCES Etapas(IdEtapa)
);

-- Tabla Desafios
CREATE TABLE Desafios (
    IdDesafio INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    ImagenURL VARCHAR(255) NOT NULL,
    CONSTRAINT Desafios_IdDesafio_PK PRIMARY KEY (IdDesafio)
);

-- Tabla Opciones
CREATE TABLE Opciones (
    IdOpcion INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ImagenURL VARCHAR(255) NOT NULL,
    Tipo BOOLEAN NOT NULL,
    CONSTRAINT Opciones_IdOpcion_PK PRIMARY KEY (IdOpcion)
);

-- Tabla Niveles_Desafios
CREATE TABLE Niveles_Desafios (
    Id INT AUTO_INCREMENT,
    NivelId INT,
    DesafiosId INT,
    CONSTRAINT Niveles_Desafios_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Niveles_Desafios_NivelId_FK FOREIGN KEY (NivelId) REFERENCES Niveles(IdNivel),
    CONSTRAINT Niveles_Desafios_DesafiosId_FK FOREIGN KEY (DesafiosId) REFERENCES Desafios(IdDesafio)
);

-- Tabla Desafíos_Opciones
CREATE TABLE Desafíos_Opciones (
    Id INT AUTO_INCREMENT,
    DesafiosId INT,
    OpcionesId INT,
    CONSTRAINT Desafíos_Opciones_Id_PK PRIMARY KEY (Id),
    CONSTRAINT Desafíos_Opciones_DesafiosId_FK FOREIGN KEY (DesafiosId) REFERENCES Desafios(IdDesafio),
    CONSTRAINT Desafíos_Opciones_OpcionesId_FK FOREIGN KEY (OpcionesId) REFERENCES Opciones(IdOpcion)
);

-- Tabla Progreso
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