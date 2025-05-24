INSERT INTO Departamentos (IDDepartamento, NombreDepartamento, Edificio) VALUES
(1, 'Ingeniería', 'Edificio A'),
(2, 'Ciencias Sociales', 'Edificio B'),
(3, 'Artes', 'Edificio C');

INSERT INTO Campus (IDCampus, NombreCampus, DireccionCampus) VALUES
(1, 'Campus Central', 'Av. Principal 123'),
(2, 'Campus Norte', 'Calle Secundaria 456');

INSERT INTO Carreras (IDCarrera, NombreCarrera, TituloOtorgado) VALUES
(1, 'Ingeniería en Sistemas', 'Ingeniero en Sistemas'),
(2, 'Psicología', 'Licenciado en Psicología'),
(3, 'Diseño Gráfico', 'Licenciado en Diseño');

INSERT INTO Estudiantes (IDEstudiante, Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
(1, 'Ana', 'García', '1996-04-12', 'Calle 1', 'ana.garcia@mail.com', 1),
(2, 'Luis', 'Pérez', '1997-09-30', 'Calle 2', 'luis.perez@mail.com', 2),
(3, 'Marta', 'López', '1995-06-15', 'Calle 3', 'marta.lopez@mail.com', 1),
(4, 'Jorge', 'Martínez', '1994-11-20', 'Calle 4', 'jorge.martinez@mail.com', 3);


INSERT INTO Profesores (IDProfesor, Nombre, Apellido, Titulo, IDDepartamento, Email) VALUES
(1, 'Carlos', 'Sánchez', 'Dr.', 1, 'carlos.sanchez@uni.edu'),
(2, 'Luisa', 'Morales', 'MSc', 2, 'luisa.morales@uni.edu'),
(3, 'Roberto', 'Díaz', 'PhD', 1, 'roberto.diaz@uni.edu');


INSERT INTO Cursos (IDCurso, NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento, IDCampus) VALUES
(1, 'Programación I', 'Introducción a la programación', 4, 1, 1, 1),
(2, 'Psicología General', 'Fundamentos de psicología', 3, 1, 2, 1),
(3, 'Diseño Digital', 'Herramientas de diseño gráfico', 3, 2, 3, 2);


INSERT INTO Inscripciones (IDInscripcion, IDEstudiante, IDCurso, FechaInscripcion, Calificacion) VALUES
(1, 1, 1, '2023-01-15', 85),
(2, 2, 2, '2023-01-16', 90),
(3, 3, 1, '2023-01-17', 88),
(4, 4, 3, '2023-01-18', 92);


INSERT INTO Horarios (IDHorario, IDCurso, IDAula, FechaInicio, FechaFin, HoraInicio, HoraFin) VALUES
(1, 1, NULL, '2023-02-01', '2023-06-30', '08:00', '10:00'),
(2, 2, NULL, '2023-02-01', '2023-06-30', '10:00', '12:00'),
(3, 3, NULL, '2023-02-01', '2023-06-30', '14:00', '16:00');

INSERT INTO CursosProfesores (IDCursoProfesor, IDCurso, IDProfesor) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 3);

INSERT INTO ProgramasEstudio (IDPrograma, NombrePrograma, DescripcionPrograma) VALUES
(1, 'Programa Ingeniería', 'Programa para Ingeniería'),
(2, 'Programa Psicología', 'Programa para Psicología'),
(3, 'Programa Diseño', 'Programa para Diseño');

INSERT INTO ProgramasCursos (IDProgramaCurso, IDPrograma, IDCurso) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

UPDATE Profesores
SET Email = 'c.sanchez@uni.edu'
WHERE IDProfesor = 1;

UPDATE Estudiantes
SET Direccion = 'Avenida Reforma 456'
WHERE IDEstudiante = 2;

UPDATE Cursos
SET NombreCurso = 'Programación Avanzada'
WHERE IDCurso = 1;

UPDATE Inscripciones
SET Calificacion = 95
WHERE IDInscripcion = 3;

DELETE FROM Estudiantes
WHERE IDEstudiante = 5;

DELETE FROM Cursos
WHERE IDCurso = 4;

DELETE FROM Inscripciones
WHERE IDInscripcion = 7;

DELETE FROM Profesores
WHERE IDProfesor = 6;