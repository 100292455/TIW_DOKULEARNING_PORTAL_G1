package es.uc3m.tiw.web.dominio;

import java.util.Date;

public class Cupon {

	int id_cupon;
	String fecha_fin;
	int id_profesor;
	int descuento;
	int tipo_descuento;
	int cod_curso;
	
	
	
	public Cupon() {
		super();
	}
	public Cupon(int id_cupon, String fecha_fin, int id_profesor,
			int descuento, int tipo_descuento, int cod_curso) {
		super();
		this.id_cupon = id_cupon;
		this.fecha_fin = fecha_fin;
		this.id_profesor = id_profesor;
		this.descuento = descuento;
		this.tipo_descuento = tipo_descuento;
		this.cod_curso = cod_curso;
	}
	public int getId_cupon() {
		return id_cupon;
	}
	public void setId_cupon(int id_cupon) {
		this.id_cupon = id_cupon;
	}
	public String getFecha_fin() {
		return fecha_fin;
	}
	public void setFecha_fin(String fecha_fin) {
		this.fecha_fin = fecha_fin;
	}
	public int getId_profesor() {
		return id_profesor;
	}
	public void setId_profesor(int id_profesor) {
		this.id_profesor = id_profesor;
	}
	public int getDescuento() {
		return descuento;
	}
	public void setDescuento(int descuento) {
		this.descuento = descuento;
	}
	public int getTipo_descuento() {
		return tipo_descuento;
	}
	public void setTipo_descuento(int tipo_descuento) {
		this.tipo_descuento = tipo_descuento;
	}
	public int getCod_curso() {
		return cod_curso;
	}
	public void setCod_curso(int cod_curso) {
		this.cod_curso = cod_curso;
	}
	
	
	
}
