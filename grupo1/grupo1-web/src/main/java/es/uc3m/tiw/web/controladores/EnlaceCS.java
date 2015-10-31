package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Curso;
import es.uc3m.tiw.web.dominio.Seccion;

@WebServlet("/EnlaceCS")
public class EnlaceCS extends HttpServlet {
	private static final String ENTRADA_JSP = "/gestionSecciones.jsp";
	private static final String GESTION_CURSOS_JSP = "/gestionSecciones.jsp";
	private static final long serialVersionUID = 1L;
	ServletContext context;
	private ArrayList<Curso> cursos;
	private ArrayList<Seccion> secciones;
	
	@Override
	public void init() throws ServletException {
		secciones = new ArrayList<Seccion>();
	    context= this.getServletConfig().getServletContext();
		context.setAttribute("secciones", secciones);
	
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		//this.getServletContext().getRequestDispatcher(GESTION_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_curso= request.getParameter("IdCurso"); //cuidado con esto
		int idcurso = Integer.parseInt(id_curso);
		
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		context= this.getServletConfig().getServletContext();
		
		cursos=(ArrayList<Curso>) context.getAttribute("cursos");
		
		String nombreCurso;
		Curso cursoActual = null;
		
		for (Curso curso : cursos) {
			if (curso.getID_curso() == idcurso) {
				nombreCurso=curso.getDES_titulo();
				
				cursoActual = cursos.get(idcurso);
			}
		}
		
		HttpSession sesion = request.getSession();
	    context.setAttribute("curso_actual",cursoActual);
		context.setAttribute("idcurso", idcurso);
		secciones = (ArrayList<Seccion>) context.getAttribute("secciones");
		
	
		
		pagina = ENTRADA_JSP;
		context.setAttribute("secciones", secciones);
		this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	    }
		
	}

