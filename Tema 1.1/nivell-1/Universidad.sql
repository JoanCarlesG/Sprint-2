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
/*1*/SELECT d.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        LEFT JOIN departamento d ON pro.id_departamento = d.id
        WHERE per.tipo = 'profesor'
        ORDER BY d.nombre, per.apellido1, per.apellido2, per.nombre;
        -- Hi ha 12 professors a la Base de Dades, i els 12 tenen un departament associat.
        -- Tot i així l'enunciat demana també els professors que NO tenen un departament associat.
/*2*/SELECT per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        LEFT JOIN departamento d ON pro.id_departamento = d.id
        WHERE d.nombre IS NULL AND per.tipo = 'profesor';
        -- Igual que al query anterior, no hi ha cap professor sense departament associat, per tant la llista està buida.
/*3*/SELECT d.nombre FROM departamento d
		LEFT JOIN profesor pro ON pro.id_departamento = d.id
		LEFT JOIN persona per ON per.id = pro.id_profesor
        WHERE per.nombre IS NULL;
/*4*/SELECT per.apellido1, per.apellido2, per.nombre FROM persona per
		LEFT JOIN profesor pro ON per.id = pro.id_profesor
        LEFT JOIN asignatura a USING (id_profesor)
        WHERE a.id_profesor IS NULL AND per.tipo = 'profesor';
/*5*/SELECT a.nombre FROM asignatura a
		WHERE a.id_profesor IS NULL;
        -- Entenc que cal utilitzar un left/right join, pero així s'obté directament no?
        -- No sé com aplicar un outer join sense complicar-me la vida.
/*6*/SELECT DISTINCT d.nombre FROM departamento d
		LEFT JOIN profesor pro ON pro.id_departamento = d.id
        LEFT JOIN asignatura a USING (id_profesor)
		WHERE a.id_profesor IS NULL;
-- CONSULTES RESUM
/*1*/SELECT tipo, COUNT(tipo) total_alumnes
		FROM persona
        WHERE tipo = 'alumno' 
        GROUP BY tipo
        HAVING total_alumnes > 1;
/*2*/SELECT tipo, COUNT(tipo) total_alumnes
		FROM persona
        WHERE tipo = 'alumno' AND (fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento < '2000-01-01') 
        GROUP BY tipo
        HAVING total_alumnes > 0;
/*3*/SELECT d.nombre, COUNT(per.tipo) total_profesors FROM departamento d
		LEFT JOIN profesor pro ON pro.id_departamento = d.id
		LEFT JOIN persona per ON per.id = pro.id_profesor
        WHERE per.tipo = 'profesor'
        GROUP BY d.nombre, per.tipo
        HAVING total_profesors > 0
        ORDER BY total_profesors DESC;
/*4*/SELECT d.nombre, COUNT(per.tipo) total_profesors FROM departamento d
		LEFT JOIN profesor pro ON pro.id_departamento = d.id
		LEFT JOIN persona per ON per.id = pro.id_profesor
        GROUP BY d.nombre, per.tipo
        HAVING total_profesors >= 0 
        ORDER BY total_profesors DESC;
/*5*/SELECT g.nombre, COUNT(a.id_grado) total_assignatures FROM grado g
		LEFT JOIN asignatura a ON g.id = a.id_grado
        GROUP BY g.nombre, a.id_grado
        HAVING total_assignatures >= 0 
        ORDER BY total_assignatures DESC;
/*6*/SELECT g.nombre, COUNT(a.id_grado) total_assignatures FROM grado g
		LEFT JOIN asignatura a ON g.id = a.id_grado
        GROUP BY g.nombre, a.id_grado
        HAVING total_assignatures >= 40 
        ORDER BY total_assignatures DESC;
/*7*/SELECT DISTINCT g.nombre, a.tipo, COUNT(a.creditos) total_creditos FROM grado g
		LEFT JOIN asignatura a ON g.id = a.id_grado
        GROUP BY g.nombre, a.tipo, a.creditos
        HAVING total_creditos >= 0 
        ORDER BY g.nombre, total_creditos DESC;
/*8*/SELECT DISTINCT ce.anyo_inicio,COUNT(DISTINCT(persona.id)) total_alumnes FROM curso_escolar ce
		LEFT JOIN alumno_se_matricula_asignatura am ON am.id_curso_escolar = ce.id
        LEFT JOIN persona ON am.id_alumno = persona.id
        GROUP BY ce.anyo_inicio
        HAVING total_alumnes >= 0 
        ORDER BY total_alumnes DESC;
/*9*/SELECT DISTINCT per.id, per.nombre, per.apellido1, per.apellido2, COUNT(a.id_profesor) total_assignatures 
		FROM persona per
		LEFT JOIN asignatura a ON a.id_profesor = per.id
        WHERE per.tipo = 'profesor'
        GROUP BY per.id
        HAVING total_assignatures >= 0 
        ORDER BY total_assignatures DESC;
/*10*/SELECT * FROM persona
		WHERE persona.tipo = 'alumno'
        ORDER BY persona.fecha_nacimiento DESC LIMIT 1;
/*11*/SELECT per.nombre AS profesor, d.nombre AS departamento, a.nombre AS asignatura FROM persona per
		LEFT JOIN profesor pro ON pro.id_profesor = per.id
        LEFT JOIN departamento d ON pro.id_departamento = d.id
        LEFT JOIN asignatura a USING(id_profesor)
        WHERE per.tipo = 'profesor';