--CONSULTAS ESPECIFICAS

--Selección Básica
SELECT Nombre, Apellido FROM Estudiantes;

--Cláusula WHERE
SELECT * FROM Cursos WHERE Creditos = 3;

--INNER JOIN
SELECT e.Nombre AS NombreEstudiante, e.Apellido, c.NombreCurso
FROM Inscripciones i
INNER JOIN Estudiantes e ON i.IDEstudiante = e.IDEstudiante
INNER JOIN Cursos c ON i.IDCurso = c.IDCurso;


--LEFT JOIN
SELECT e.Nombre AS NombreEstudiante, e.Apellido, c.NombreCurso
FROM Estudiantes e
LEFT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
LEFT JOIN Cursos c ON i.IDCurso = c.IDCurso;

--RIGHT JOIN
SELECT c.NombreCurso, e.Nombre AS NombreEstudiante, e.Apellido
FROM Cursos c
RIGHT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
RIGHT JOIN Estudiantes e ON i.IDEstudiante = e.IDEstudiante
ORDER BY c.NombreCurso;

--GROUP BY y COUNT
SELECT c.NombreCurso, COUNT(i.IDEstudiante) AS NumeroEstudiantes
FROM Cursos c
LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
GROUP BY c.NombreCurso
ORDER BY NumeroEstudiantes DESC;


--BETWEEN
SELECT Nombre, Apellido, FechaNacimiento
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';


--ORDER BY
SELECT NombreCurso FROM Cursos ORDER BY NombreCurso ASC;

--CTE
WITH InscripcionesPorEstudiante AS (
    SELECT e.IDEstudiante, e.Nombre, e.Apellido, COUNT(i.IDInscripcion) AS NumInscripciones
    FROM Estudiantes e
    LEFT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
    GROUP BY e.IDEstudiante, e.Nombre, e.Apellido
)
SELECT Nombre, Apellido, NumInscripciones
FROM InscripcionesPorEstudiante
ORDER BY NumInscripciones DESC
LIMIT 3;

--Consulta Compleja 1
WITH ConteoEstudiantes AS (
    SELECT c.IDCurso, c.NombreCurso, c.IDDepartamento, COUNT(i.IDEstudiante) AS NumEstudiantes
    FROM Cursos c
    LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY c.IDCurso, c.NombreCurso, c.IDDepartamento
),
MaxEstudiantesPorDepto AS (
    SELECT IDDepartamento, MAX(NumEstudiantes) AS MaxEstudiantes
    FROM ConteoEstudiantes
    GROUP BY IDDepartamento
)
SELECT d.NombreDepartamento, ce.NombreCurso, ce.NumEstudiantes
FROM ConteoEstudiantes ce
JOIN MaxEstudiantesPorDepto med ON ce.IDDepartamento = med.IDDepartamento AND ce.NumEstudiantes = med.MaxEstudiantes
JOIN Departamentos d ON ce.IDDepartamento = d.IDDepartamento
ORDER BY d.NombreDepartamento;

--Consulta Compleja 2
SELECT p.Nombre, p.Apellido, COUNT(cp.IDCurso) AS NumCursos
FROM Profesores p
JOIN CursosProfesores cp ON p.IDProfesor = cp.IDProfesor
GROUP BY p.IDProfesor, p.Nombre, p.Apellido
HAVING COUNT(cp.IDCurso) > 2;

--Consulta Compleja 3
WITH promedioscursos AS (
    SELECT
        pc.idprograma,
        pc.idcurso,
        AVG(i.calificacion) AS promedio
    FROM
        programascursos pc
    JOIN inscripciones i ON pc.idcurso = i.idcurso
    GROUP BY
        pc.idprograma, pc.idcurso
)
    SELECT
    pe.nombreprograma,
    c.nombrecurso,
    p.promedio
FROM
    promedioscursos p
JOIN cursos c ON p.idcurso = c.idcurso
JOIN programasestudio pe ON p.idprograma = pe.idprograma
WHERE
    (p.idprograma, p.promedio) IN (
        SELECT
            idprograma,
            MAX(promedio)
        FROM
            promedioscursos
        GROUP BY idprograma
    );
