-- Tabla: Estudiantes
CREATE TABLE Estudiantes (
    IDEstudiante SERIAL PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    FechaNacimiento DATE,
    Direccion TEXT,
    Ciudad VARCHAR(50),
    Email VARCHAR(100)
);

-- Tabla: Cursos
CREATE TABLE Cursos (
    IDCurso SERIAL PRIMARY KEY,
    NombreCurso VARCHAR(100),
    Descripcion TEXT,
    Creditos INT,
    Semestre VARCHAR(10),
    IDDepartamento INT REFERENCES Departamentos(IDDepartamento)
);

-- Tabla: Inscripciones
CREATE TABLE Inscripciones (
    IDInscripcion SERIAL PRIMARY KEY,
    IDEstudiante INT REFERENCES Estudiantes(IDEstudiante),
    IDCurso INT REFERENCES Cursos(IDCurso),
    FechaInscripcion DATE,
    Calificacion NUMERIC(3,1)
);

-- Tabla: Profesores
CREATE TABLE Profesores (
    IDProfesor SERIAL PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Titulo VARCHAR(100),
    IDDepartamento INT REFERENCES Departamentos(IDDepartamento)
);

-- Tabla: Departamentos
CREATE TABLE Departamentos (
    IDDepartamento SERIAL PRIMARY KEY,
    NombreDepartamento VARCHAR(100),
    Edificio VARCHAR(100)
);

-- Tabla: Aulas
CREATE TABLE Aulas (
    IDAula SERIAL PRIMARY KEY,
    NombreAula VARCHAR(50),
    Capacidad INT,
    Ubicacion VARCHAR(100)
);

-- Tabla: Horarios
CREATE TABLE Horarios (
    IDHorario SERIAL PRIMARY KEY,
    IDCurso INT REFERENCES Cursos(IDCurso),
    IDAula INT REFERENCES Aulas(IDAula),
    FechaInicio DATE,
    FechaFin DATE,
    HoraInicio TIME,
    HoraFin TIME
);

-- Tabla intermedia: CursosProfesores
CREATE TABLE CursosProfesores (
    IDCursoProfesor SERIAL PRIMARY KEY,
    IDCurso INT REFERENCES Cursos(IDCurso),
    IDProfesor INT REFERENCES Profesores(IDProfesor)
);

-- Tabla: ProgramasEstudio
CREATE TABLE ProgramasEstudio (
    IDPrograma SERIAL PRIMARY KEY,
    NombrePrograma VARCHAR(100),
    DescripcionPrograma TEXT
);

-- Tabla intermedia: ProgramasCursos
CREATE TABLE ProgramasCursos (
    IDProgramaCurso SERIAL PRIMARY KEY,
    IDPrograma INT REFERENCES ProgramasEstudio(IDPrograma),
    IDCurso INT REFERENCES Cursos(IDCurso)
);

CREATE TABLE Campus (
    IDCampus SERIAL PRIMARY KEY,
    NombreCampus VARCHAR(100),
    DireccionCampus TEXT
);

CREATE TABLE Carreras (
    IDCarrera SERIAL PRIMARY KEY,
    NombreCarrera VARCHAR(100),
    TituloOtorgado VARCHAR(100)
);

CREATE TABLE EstudiantesCarreras (
    IDEstudianteCarrera SERIAL PRIMARY KEY,
    IDEstudiante INT REFERENCES Estudiantes(IDEstudiante),
    IDCarrera INT REFERENCES Carreras(IDCarrera)
);

ALTER TABLE Estudiantes
ADD COLUMN IDCarrera INT REFERENCES Carreras(IDCarrera);

ALTER TABLE Cursos
ADD COLUMN IDCampus INT REFERENCES Campus(IDCampus);

ALTER TABLE Profesores
ADD COLUMN Email VARCHAR(100);

ALTER TABLE Estudiantes
DROP COLUMN Ciudad;

DROP TABLE IF EXISTS Aulas CASCADE;