package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-15T16:15:09.225+0100")
@StaticMetamodel(Matricula.class)
public class Matricula_ {
	public static volatile SingularAttribute<Matricula, Integer> ID_matricula;
	public static volatile SingularAttribute<Matricula, Usuario> alumno;
	public static volatile SingularAttribute<Matricula, Curso> curso;
	public static volatile SingularAttribute<Matricula, Integer> precio_pagado;
}
