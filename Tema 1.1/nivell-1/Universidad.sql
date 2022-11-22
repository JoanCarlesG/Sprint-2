/*1*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2*/SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
/*3*/SELECT nombre, apellido1, apellido2 FROM persona 
		WHERE tipo = 'alumno' AND (fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento < '2000-01-01');
/*4*/SELECT nombre, apellido1, apellido2 FROM persona 
		WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
/*5*/SELECT a.nombre FROM asignatura a JOIN grado g ON a.id_grado = g.id WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;
/*6*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre 
		FROM persona 
		JOIN profesor ON persona.id = profesor.id_profesor 
        JOIN departamento ON profesor.id_departamento = departamento.id
        ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
/*7*/SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona p
		JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno
        JOIN curso_escolar ce ON m.id_curso_escolar = ce.id
        JOIN asignatura a ON m.id_asignatura = a.id
        WHERE nif = "26902806M";
/*8*/SELECT DISTINCT departamento.nombre FROM departamento
		JOIN profesor ON profesor.id_departamento = departamento.id
        JOIN asignatura USING (id_profesor)
        JOIN grado ON asignatura.id_grado = grado.id
        WHERE grado.id = 4;
/*9*/SELECT DISTINCT persona.nombre FROM persona
		JOIN alumno_se_matricula_asignatura am ON persona.id = am.id_alumno
        JOIN curso_escolar ce ON ce.id = am.id_curso_escolar
        WHERE ce.id = 5;
-- LEFT JOIN / RIGHT JOIN
/*1SELECT d.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        RIGHT JOIN departamento d ON pro.id_departamento = d.id
        WHERE per.tipo = 'profesor'
        ORDER BY d.nombre, per.apellido1, per.apellido2, per.nombre;
        */
/*2SELECT per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        LEFT JOIN departamento d ON pro.id_departamento = d.id
        WHERE d.nombre IS NULL AND per.tipo != 'alumno';
        */
/*3*/SELECT d.nombre FROM departamento d
		LEFT JOIN profesor pro ON pro.id_departamento = d.id
		LEFT JOIN persona per ON per.id = pro.id_profesor
        WHERE per.nombre IS NULL;
/*4*/SELECT per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        LEFT JOIN asignatura a USING (id_profesor)
        WHERE a.id_profesor IS NULL AND per.tipo = 'profesor';
/*5*/SELECT a.nombre FROM asignatura a
		
        
/*6*/
-- CONSULTES RESUM
/*1*/
/*2*/
/*3*/
/*4*/
/*5*/
/*6*/
/*7*/
/*8*/
/*9*/
/*10*/
/*11*/