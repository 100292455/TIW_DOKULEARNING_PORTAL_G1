package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-15T16:15:09.208+0100")
@StaticMetamodel(Leccion.class)
public class Leccion_ {
	public static volatile SingularAttribute<Leccion, Integer> ID_leccion;
	public static volatile SingularAttribute<Leccion, String> titulo;
	public static volatile SingularAttribute<Leccion, String> descripcion;
	public static volatile SingularAttribute<Leccion, String> formato;
	public static volatile SingularAttribute<Leccion, Seccion> seccion;
	public static volatile SingularAttribute<Leccion, Curso> curso;
}
