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

@WebServlet("/BajaCursos")
public class BajaCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/GestionCursos.jsp";
	private static final String GESTION_CURSOS_JSP = "/GestionCursos.jsp";
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
		String idCursoStr = request.getParameter("IdCurso");
		int idCurso = Integer.parseInt(idCursoStr);
		ArrayList<Curso> cursos = (ArrayList<Curso>) context.getAttribute("cursos");
		sesion.removeAttribute("cursos");
		int posCurso = cursos.indexOf(cursos.get(idCurso));
		cursos.remove(posCurso);
		
		pagina = ENTRADA_JSP;
		sesion.setAttribute("cursos", cursos);
		
		this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	}

}