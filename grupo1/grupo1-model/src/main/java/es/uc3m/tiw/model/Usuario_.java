package es.uc3m.tiw.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-11-24T19:26:32.960+0100")
@StaticMetamodel(Usuario.class)
public class Usuario_ {
	public static volatile SingularAttribute<Usuario, Integer> ID_usuario;
	public static volatile SingularAttribute<Usuario, String> nombre;
	public static volatile SingularAttribute<Usuario, String> apellido;
	public static volatile SingularAttribute<Usuario, Integer> sexo;
	public static volatile SingularAttribute<Usuario, String> email;
	public static volatile SingularAttribute<Usuario, String> descripcion;
	public static volatile SingularAttribute<Usuario, String> intereses;
	public static volatile SingularAttribute<Usuario, String> telefono;
	public static volatile SingularAttribute<Usuario, String> TIPO_medio_cobro;
	public static volatile SingularAttribute<Usuario, Integer> TIPO_usuario;
	public static volatile SingularAttribute<Usuario, String> clave;
	public static volatile ListAttribute<Usuario, Curso> cursos_matriculados;
}
