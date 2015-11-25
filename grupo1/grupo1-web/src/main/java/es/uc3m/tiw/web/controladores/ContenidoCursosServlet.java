package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import es.uc3m.tiw.model.Curso;
import es.uc3m.tiw.model.Matricula;
import es.uc3m.tiw.model.Usuario;
import es.uc3m.tiw.model.dao.CursoDAO;
import es.uc3m.tiw.model.dao.CursoDAOImpl;
import es.uc3m.tiw.model.dao.MatriculaDAOImpl;
import es.uc3m.tiw.model.dao.MatriculaDAO;

@WebServlet("/contenidoCursos")
public class ContenidoCursosServlet extends HttpServlet {
	private static final String ENTRADACONTENIDOCURSO_JSP = "/contenidoCurso.jsp";
	private static final String AVISOMATRICULA_JSP = "/avisoMatricula.jsp";
	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "demoTIW")
	private EntityManager em;
	@Resource
	private UserTransaction ut;
	private ServletConfig config2;
	private MatriculaDAO matDao;
	private CursoDAO curDao;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		config2 = config;
		matDao = new MatriculaDAOImpl(em, ut);
		curDao = new CursoDAOImpl(em, ut);

	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		matDao = null;
		curDao = null;
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		ServletContext context = sesion.getServletContext();
		
		Usuario user = (Usuario) sesion.getAttribute("usuario");
		String nombreCurso = request.getParameter("nombreCurso");//Coger nombre del curso a matricular
		Curso contenidoCurso = null;
		try {
			contenidoCurso = curDao.recuperarCursoPorNombre(nombreCurso);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Comprobar si el usuario ya esta matriculado en el curso
		Matricula m = null;
		try {
			m = matDao.recuperarMatriculaPorAlumnoYCurso(user.getID_usuario(), contenidoCurso.getID_curso());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Cursos relacionados con el curso al que se quiere acceder
		Collection<Curso> cursosRecomendados = null;
		try {
			cursosRecomendados = curDao.recuperarCursosPorTematica(contenidoCurso.getTematica());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sesion.setAttribute("cursosRecomendados", cursosRecomendados);

		//Si el usuario esta matriculado en este curso, el servlet le manda a ver el contenido del curso
		if (m == null){
			//Si el usuario no matriculado en este curso le manda a matricularse
			
			sesion.setAttribute("nombreCurso", nombreCurso);
			sesion.setAttribute("contenidoCurso", contenidoCurso);
			config2.getServletContext().getRequestDispatcher(AVISOMATRICULA_JSP).forward(request, response);
		}
		
		else{//Meto el titulo del curso en el contexto para que el servlet AñadirMatriculaServlet pueda leerlo
			sesion.setAttribute("idCurso", contenidoCurso.getID_curso());
			sesion.setAttribute("nombreCurso", nombreCurso);
			config2.getServletContext().getRequestDispatcher(ENTRADACONTENIDOCURSO_JSP).forward(request, response);

		}		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
