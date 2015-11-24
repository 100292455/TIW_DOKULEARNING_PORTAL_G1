package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-22T20:42:23.290+0100")
@StaticMetamodel(Cupon.class)
public class Cupon_ {
	public static volatile SingularAttribute<Cupon, Integer> ID_cupon;
	public static volatile SingularAttribute<Cupon, String> fecha_vto_cupon;
	public static volatile SingularAttribute<Cupon, Usuario> profesor;
	public static volatile SingularAttribute<Cupon, Integer> descuento;
	public static volatile SingularAttribute<Cupon, Integer> TIPO_cupon;
	public static volatile SingularAttribute<Cupon, Curso> curso;
}
