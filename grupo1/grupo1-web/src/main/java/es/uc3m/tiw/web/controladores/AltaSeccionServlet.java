package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Curso;
import es.uc3m.tiw.web.dominio.Seccion;

@WebServlet("/AltaSeccion")
@MultipartConfig(location="/")
public class AltaSeccionServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/gestionSecciones.jsp";
	private static final String GESTION_CURSOS_JSP = "/gestionSecciones.jsp";
	private static final long serialVersionUID = 1L;
	private Seccion seccion;
	private ArrayList<Seccion> secciones;
	private int new_IDSeccion = 0;
	ServletContext context;
	private static final String SAVE_DIR = "uploadFiles";
	@Override
	public void init() throws ServletException {
	
		context= this.getServletConfig().getServletContext();
		secciones=(ArrayList<Seccion>) context.getAttribute("secciones");
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
		
		secciones = (ArrayList<Seccion>) context.getAttribute("secciones");
		
		
		HttpSession sesion = request.getSession();
		//Curso cursoactual=(Curso)sesion.getAttribute("curso_actual");
		String titulo = request.getParameter("titulo");
		int id_curso= (int) context.getAttribute("idcurso");
		//int id_curso= (int) context.getAttribute("IDCURSO");  //cojo ID CURSO DEL CONTEXTO
		Curso cursoactual=(Curso) context.getAttribute("curso_actual");
		String nombrecursoactual=cursoactual.getDES_titulo();
		context.setAttribute("nombrecursoactual", nombrecursoactual);
		
		String mensaje ="";
		String pagina = "";
		pagina = ENTRADA_JSP;
		
		
		String m = comprobarCurso(titulo);
		if (m == null || m == ""){
			
		
			Seccion c = crearSeccion(titulo,id_curso);
			
			pagina = GESTION_CURSOS_JSP;
			context.setAttribute("secciones", secciones);
			context.setAttribute("seccion", c);
			
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
			context.setAttribute("secciones", secciones);
		}
			
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Seccion crearSeccion(String titulo, int id_curso) {
		Seccion c = new Seccion();
		
		c.setNombre(titulo);
		c.setId_seccion(new_IDSeccion);
		c.setId_curso(id_curso);
		
		secciones.add(c);
		new_IDSeccion++;
		
		return c;
	}



	private String comprobarCurso(String titulo) {
		String m = "";
		
		if (titulo.equals("") || titulo.equals(null)) {
			m ="Fallo al crear nuevo curso. ";
		}
		
		return m;
	}

}