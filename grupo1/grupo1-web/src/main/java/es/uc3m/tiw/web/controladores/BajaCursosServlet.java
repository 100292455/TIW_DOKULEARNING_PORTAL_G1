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
	private static final String ENTRADA_JSP = "/misCursos.jsp";
	private static final String MIS_CURSOS_JSP = "/misCursos.jsp";
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(MIS_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* Cuando el profesor clique en BORRAR CURSO, eliminamos el curso del arrayList 'cursos'. Habria que eliminarlo de la BBDD */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagina = "";
		pagina = MIS_CURSOS_JSP;
		request.setAttribute("selectedTab", "1");
		ArrayList<Curso> cursoscreados;//BBDD cursos
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		String idCursoStr = request.getParameter("IdCurso");
		int idCurso = Integer.parseInt(idCursoStr);
		cursoscreados = (ArrayList<Curso>) sesion.getAttribute("cursoscreados");
		for (Curso curso : cursoscreados) {
			if (curso.getID_curso() == idCurso) {
				cursoscreados.remove(curso);
				break;
			}
		}
		
		pagina = ENTRADA_JSP;
		sesion.setAttribute("cursoscreados", cursoscreados);
		
		this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	}

}