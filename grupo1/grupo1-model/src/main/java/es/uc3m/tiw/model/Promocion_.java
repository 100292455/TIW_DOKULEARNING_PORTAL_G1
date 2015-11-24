package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-15T16:15:09.227+0100")
@StaticMetamodel(Promocion.class)
public class Promocion_ {
	public static volatile SingularAttribute<Promocion, Integer> id_promo;
	public static volatile SingularAttribute<Promocion, String> nombrePromo;
	public static volatile SingularAttribute<Promocion, String> fecha_fin;
	public static volatile SingularAttribute<Promocion, Integer> descuento;
	public static volatile SingularAttribute<Promocion, Integer> tipo_promo;
	public static volatile SingularAttribute<Promocion, Usuario> profesor;
}
