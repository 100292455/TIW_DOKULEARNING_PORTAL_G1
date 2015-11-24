package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-21T10:56:55.498+0100")
@StaticMetamodel(Curso.class)
public class Curso_ {
	public static volatile SingularAttribute<Curso, Integer> ID_curso;
	public static volatile SingularAttribute<Curso, String> DES_titulo;
	public static volatile SingularAttribute<Curso, String> DES_descripcion;
	public static volatile SingularAttribute<Curso, Integer> TIPO_dificultad;
	public static volatile SingularAttribute<Curso, Integer> horas;
	public static volatile SingularAttribute<Curso, Integer> precio_inicial;
	public static volatile SingularAttribute<Curso, Integer> precio_final;
	public static volatile SingularAttribute<Curso, Integer> TIPO_destacado;
	public static volatile SingularAttribute<Curso, String> tematica;
	public static volatile SingularAttribute<Curso, Usuario> profesor;
	public static volatile ListAttribute<Curso, Usuario> claustro;
	public static volatile SingularAttribute<Curso, Integer> TIPO_estado;
	public static volatile SingularAttribute<Curso, String> FechaFinDescuento;
}
