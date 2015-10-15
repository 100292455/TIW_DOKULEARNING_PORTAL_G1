package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Curso;

@WebServlet("/AltaCursos")
public class AltaCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/GestionCursos.jsp";
	private static final String GESTION_CURSOS_JSP = "/GestionCursos.jsp";
	private static final long serialVersionUID = 1L;
	private Curso curso;
	private ArrayList<Curso> cursos;
	private int new_IDCurso = 0;
	@Override
	public void init() throws ServletException {
	
		cursos = new ArrayList<Curso>();
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(GESTION_CURSOS_JSP).forward(request, response);
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
		/* TO-DO */
		String codProfStr = "10";
		/*****/
		
		String mensaje ="";
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		
		String m = comprobarCurso(titulo, descripcion, dificultadStr, horasStr, precioStr);
		if (m == null || m == ""){
			int dificultad = Integer.parseInt(dificultadStr);
			int horas = Integer.parseInt(horasStr);
			int precio = Integer.parseInt(precioStr);  
			int codProf = Integer.parseInt(codProfStr);
		
			Curso c = crearCurso(titulo, descripcion, dificultad, horas, precio, codProf);
			
			pagina = ENTRADA_JSP;
			context.setAttribute("cursos", cursos);
			context.setAttribute("curso", c);
			
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
			context.setAttribute("cursos", cursos);
		}
			
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Curso crearCurso(String titulo, String descripcion, int dificultad, int horas, int precio, int profesor) {
		Curso c = new Curso();
		
		c.setCOD_profesor(profesor);
		c.setDES_descripcion(descripcion);
		c.setDES_titulo(titulo);
		c.setHoras(horas);
		c.setID_curso(new_IDCurso);
		c.setPrecio_final(precio);
		c.setPrecio_inicial(precio);
		c.setTIPO_destacado(0);
		c.setTIPO_dificultad(dificultad);
		c.setTIPO_estado(0);
		/* AÑADIR CURSO A LA TABLA DE CURSOS */
		cursos.add(c);
		new_IDCurso++;
		
		return c;
	}



	private String comprobarCurso(String titulo, String descripcion, String dificultad, String horas, String precio) {
		String m = "";
		
		if (titulo == "" || titulo == null || descripcion == "" || descripcion == null || dificultad == "-1" || horas == "" || horas == null || precio == "" || precio == null ) {
			m ="Fallo al crear nuevo curso. ";
		}
		
		return m;
	}

}