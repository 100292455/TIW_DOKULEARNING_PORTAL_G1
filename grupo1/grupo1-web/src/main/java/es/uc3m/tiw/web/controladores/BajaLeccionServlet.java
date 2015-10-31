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


@WebServlet("/BajaLeccionServlet")
public class BajaLeccionServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/gestionlecciones.jsp";
	private static final String GESTION_CURSOS_JSP = "/gestionlecciones.jsp";
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
		
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
		
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		String idleccionStr = request.getParameter("IdLeccion");
		int idleccion = Integer.parseInt(idleccionStr);
		ArrayList<Leccion> lecciones = (ArrayList<Leccion>) context.getAttribute("lecciones");
		
		
		sesion.removeAttribute("lecciones");
		for (Leccion leccion : lecciones) {
			if (leccion.getId_leccion()== idleccion) {
				lecciones.remove(leccion);
			
				break;
			}
		}
		
		pagina = ENTRADA_JSP;
		sesion.setAttribute("lecciones", lecciones);
		this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	}

}