package es.uc3m.tiw.web.dominio;

public class Matricula {
	
	int cod_alumno;
	int cod_curso;
	int precio_pagado;
	
	public Matricula() {
		super();

	}
	
	public Matricula(int cod_alumno, int cod_curso, int precio_pagado) {
		super();
		this.cod_alumno = cod_alumno;
		this.cod_curso = cod_curso;
		this.precio_pagado = precio_pagado;
	}
	public int getCod_alumno() {
		return cod_alumno;
	}
	public void setCod_alumno(int cod_alumno) {
		this.cod_alumno = cod_alumno;
	}
	public int getCod_curso() {
		return cod_curso;
	}
	public void setCod_curso(int cod_curso) {
		this.cod_curso = cod_curso;
	}
	public int getPrecio_pagado() {
		return precio_pagado;
	}
	public void setPrecio_pagado(int precio_pagado) {
		this.precio_pagado = precio_pagado;
	}
	
}