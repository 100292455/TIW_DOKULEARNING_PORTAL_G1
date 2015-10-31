package es.uc3m.tiw.web.dominio;

public class Seccion {
	
	private int id_seccion;
	int id_curso;
	String nombre;
	
	public Seccion() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Seccion(int id_seccion, int id_curso, String nombre) {
		super();
		this.id_seccion = id_seccion;
		this.id_curso = id_curso;
		this.nombre = nombre;
	}

	public int getId_seccion() {
		return id_seccion;
	}
	public void setId_seccion(int id_seccion) {
		this.id_seccion = id_seccion;
	}
	public int getId_curso() {
		return id_curso;
	}
	public void setId_curso(int id_curso) {
		this.id_curso = id_curso;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	

	

}
