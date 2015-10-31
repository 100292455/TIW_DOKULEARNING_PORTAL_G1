package es.uc3m.tiw.web.dominio;

public class Leccion {
	
	int id_leccion;
	String titulo;
	String des;
	String formato;
	int id_seccion;
	public Leccion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Leccion(String titulo, String des, String formato,
			int id_seccion) {
		super();
		
		this.titulo = titulo;
		this.des = des;
		this.formato = formato;
		this.id_seccion = id_seccion;
		
	}
	public int getId_leccion() {
		return id_leccion;
	}
	public void setId_leccion(int id_leccion) {
		this.id_leccion = id_leccion;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getFormato() {
		return formato;
	}
	public void setFormato(String formato) {
		this.formato = formato;
	}
	public int getId_seccion() {
		return id_seccion;
	}
	public void setId_seccion(int id_seccion) {
		this.id_seccion = id_seccion;
	}
	
}