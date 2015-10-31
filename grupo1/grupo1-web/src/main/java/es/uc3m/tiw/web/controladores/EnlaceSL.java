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
import es.uc3m.tiw.web.dominio.Leccion;
import es.uc3m.tiw.web.dominio.Seccion;

@WebServlet("/EnlaceSL")
public class EnlaceSL extends HttpServlet {
	private static final String ENTRADA_JSP = "/gestionlecciones.jsp";
	private static final String GESTION_CURSOS_JSP = "/gestionlecciones.jsp";
	private static final long serialVersionUID = 1L;
	ServletContext context;

	private ArrayList<Seccion> secciones;
	private ArrayList<Leccion> lecciones;
	
	@Override
	public void init() throws ServletException {
		lecciones = new ArrayList<Leccion>();
	    context= this.getServletConfig().getServletContext();
		context.setAttribute("lecciones", lecciones);
	
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_seccion= request.getParameter("IdSeccion"); //cuidado con esto
		int idseccion = Integer.parseInt(id_seccion);
		
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		
		context= this.getServletConfig().getServletContext();
		
		secciones=(ArrayList<Seccion>) context.getAttribute("secciones");
		
		String nombreSeccion;
		Seccion seccionActual = null;
		
		for (Seccion seccion : secciones) {
			if (seccion.getId_seccion() == idseccion) {
				nombreSeccion=seccion.getNombre();
				
				seccionActual  = secciones.get(idseccion);
			}
		}
		
		HttpSession sesion = request.getSession();
	    context.setAttribute("seccion_actual",seccionActual);
		context.setAttribute("idseccion", idseccion);
		context.setAttribute("secciones", secciones);
		
	
		
		pagina = ENTRADA_JSP;
		
		this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	    }
		
	}

