package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-15T16:15:09.235+0100")
@StaticMetamodel(Seccion.class)
public class Seccion_ {
	public static volatile SingularAttribute<Seccion, Integer> id_seccion;
	public static volatile SingularAttribute<Seccion, Curso> curso;
	public static volatile SingularAttribute<Seccion, String> nombre;
}
