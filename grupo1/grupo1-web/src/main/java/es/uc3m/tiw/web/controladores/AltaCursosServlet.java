package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Curso;

/**
 * Servlet de ejemplo que muestra distintos aspectos dentro de los ambitos request y session. 
 * -Como usar el metodo init para inicializar datos
 * -Como recoger datos desde un formulario por post
 * -Como no permitir acceso por get redirigiendo a la pagina de login.jsp
 * -Uso del objeto RequestDispatcher y forward
 * -Introduccion de atributos en el objeto request
 * -Uso de objeto sesion para mantener al usuario autenticado
 * -Control de flujo y logica de negicio de un controlador.
 * 
 */
@WebServlet("/AltaCursos")
public class AltaCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/AltaCursos.jsp";
	private static final String ALTA_CURSOS_JSP = "/AltaCursos.jsp";
	private static final long serialVersionUID = 1L;
	private Curso curso;
	private ArrayList<Curso> cursos;
	@Override
	public void init() throws ServletException {
	
		curso = new Curso(0, "Ingles", "Curso de Ingles", 1, 10, 30, 30, 0, 0, 2); 
		
		cursos = new ArrayList<Curso>();
		cursos.add(curso);
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(ALTA_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		String dificultadStr = request.getParameter("dificultad");
		String horasStr = request.getParameter("horas");
		String precioStr = request.getParameter("precio");
		String codProfStr = "10";
		int dificultad = Integer.parseInt(dificultadStr);
		int horas = Integer.parseInt(horasStr);
		int precio = Integer.parseInt(precioStr);  
		int codProf = Integer.parseInt(codProfStr);
		String mensaje ="";
		String pagina = "";
		pagina = ALTA_CURSOS_JSP;
		HttpSession sesion = request.getSession();		  
		
		String m = comprobarCurso(titulo, descripcion, dificultad, horas, precio);
		if (m == null){
			Curso c = crearCurso(titulo, descripcion, dificultad, horas, precio, codProf);
			
			pagina = ENTRADA_JSP;
			request.setAttribute("cursos", cursos);
			sesion.setAttribute("curso", c);
			sesion.setAttribute("AltaCurso", "ok");
			
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
		}
		
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Curso crearCurso(String titulo, String descripcion, int dificultad, int horas, int precio, int profesor) {
		Curso c = new Curso();
		
		c.setCOD_profesor(profesor);
		c.setDES_descripcion(descripcion);
		c.setDES_titulo(titulo);
		c.setHoras(horas);
		c.setID_curso(cursos.size()+1);
		c.setPrecio_final(0);
		c.setPrecio_inicial(precio);
		c.setTIPO_destacado(0);
		c.setTIPO_dificultad(dificultad);
		c.setTIPO_estado(0);
		/* AÑADIR CURSO A LA TABLA DE CURSOS */
		cursos.add(c);
		
		return c;
	}



	private String comprobarCurso(String titulo, String descripcion, int dificultad, int horas, int precio) {
		String m = null;
		
		if (titulo == "" || titulo == null) {
			m = "Titulo obligatorio. \n";
		}
		if (descripcion == "" || descripcion == null) {
			m += "Descripcion obligatoria. \n";
		}
		if (dificultad == -1) {
			m += "Dificultad obligatoria. \n";
		}
		if (horas == 0) {
			m += "Numero de horas obligatorio. \n";
		}
		if (precio == 0) {
			m += "Precio obligatorio. \n";
		}
		return m;
	}

}