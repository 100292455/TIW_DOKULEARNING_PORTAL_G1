package es.uc3m.tiw.model;

import static javax.persistence.GenerationType.AUTO;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="mensaje")

public class Mensaje implements Serializable {

	@Id
 	@GeneratedValue(strategy = AUTO)
	private Long ID_curso;
	private String DES_mensaje;
	@OneToOne
	private Usuario emisor;
	@OneToOne
	private Curso curso;

	public Mensaje() {
		super();
	}

	public Long getID_curso() {
		return ID_curso;
	}

	public void setID_curso(Long iD_curso) {
		this.ID_curso = iD_curso;
	}

	public Mensaje(String dES_mensaje, Usuario emisor, Curso curso) {
		super();
		this.DES_mensaje = dES_mensaje;
		this.emisor = emisor;
		this.curso = curso;
	}

	public Mensaje(String dES_mensaje) {
		super();
		DES_mensaje = dES_mensaje;
	}

	public String getDES_mensaje() {
		return DES_mensaje;
	}

	public void setDES_mensaje(String dES_mensaje) {
		this.DES_mensaje = dES_mensaje;
	}

	public Usuario getEmisor() {
		return emisor;
	}

	public void setEmisor(Usuario emisor) {
		this.emisor = emisor;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
   
}
